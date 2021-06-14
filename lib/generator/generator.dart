import 'package:analyzer/dart/element/element.dart' as E;
import 'package:source_gen/source_gen.dart';
import 'package:supper_route/define.dart';
import 'package:supper_route/generator/abstract_generator.dart';

class MichGenerator extends GeneratorForSubAnnotatedField<Model, define> {
  @override
  generateModels(E.FieldElement field, ConstantReader annotation) {
    String screen = annotation.peek('screen')!.objectValue.toString();
    screen = screen.substring(screen.indexOf('(') + 1, screen.indexOf('*'));
    return Model(
        annotation.peek('path')!.stringValue, screen, field.displayName);
  }

  @override
  String generateFile(String enumName, Set<Model> models) {
    return generateCode(enumName, models).toString();
  }
}

StringBuffer generateCode(String enumName, Set<Model> models) {
  final String context = ': (context) =>';
  var code = StringBuffer();
  code.writeln('''
    part of 'main.dart';
    class SupperApp extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return MaterialApp(
             initialRoute: '/',
             routes: {
    ''');
  models.forEach((m) {
    code.writeln('\'${m.path}\' $context ${m.screen}() ,');
  });
  code.writeln('''
  },);}}
  arguments(BuildContext context) => ModalRoute.of(context)?.settings.arguments;
  
      extension navigation on $enumName {
        value() {
          switch (this) {''');
  models.forEach((m) {
    code.writeln('case $enumName.${m.enumm}: return \'${m.path}\' ;');
  });
  code.writeln('''
          }
        }
      
         Future<T?> from<T extends Object?>(
          BuildContext context, {
          Object? arguments,
        }) {
          return Navigator.of(context).pushNamed<T>(value(), arguments: arguments);
        }
      }
  ''');
  return code;
}

class Model {
  final String path;
  final String screen;
  final String enumm;

  Model(this.path, this.screen, this.enumm);
}
