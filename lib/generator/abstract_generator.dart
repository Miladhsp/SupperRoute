import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';

abstract class GeneratorForSubAnnotatedField<Model, AnnotationType>
    extends Generator {
  /// Returns the annotation of type [AnnotationType] of the given [element],
  /// or [null] if it doesn't have any.
  DartObject? getAnnotation(Element element) {
    final annotations =
        TypeChecker.fromRuntime(AnnotationType).annotationsOf(element);
    if (annotations.isEmpty) {
      return null;
    }
    if (annotations.length > 1) {
      throw Exception(
          "You tried to add multiple @$AnnotationType() annotations to the "
          "same element (${element.name}), but that's not possible.");
    }
    return annotations.single;
  }

  @override
  String generate(LibraryReader library, BuildStep buildStep) {
    late final String enumName;
    bool flag = false;
    var models = <Model>{};
    for (final element in library.allElements) {
      if (element is ClassElement && element.isEnum) {
        flag = _stopCase(element);
        if (!flag) {
          return '';
        }
        enumName = element.displayName;
        for (final field in element.fields) {
          final annotation = getAnnotation(field);
          if (annotation != null) {
            models.add(generateModels(
              field,
              ConstantReader(annotation),
            ));
          }
        }
      }
    }
    return (flag) ? generateFile(enumName, models) : '';
  }

  bool _stopCase(Element element) {
    if (element.librarySource == null) {
      return false;
    }
    return element.librarySource!.shortName == 'main.dart';
  }

  String generateFile(String enumName, Set<Model> models);

  Model generateModels(FieldElement field, ConstantReader annotation);
}
