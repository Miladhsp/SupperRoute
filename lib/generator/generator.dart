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
  code.writeln(
      '''},);}}arguments(BuildContext context) => ModalRoute.of(context)?.settings.arguments;
      final Goto GoTo = Goto();
            
      class Goto {
      
        late BuildContext _context;
  ''');

  models.forEach((m) {
    code.writeln('''
     ${m.enumm}({required BuildContext context,Object? arguments}){
    _from(this._context, \'${m.path}\', arguments);
  }
  ''');
  });
  code.writeln(''' 
    Future<T?> _from<T extends Object?>(
      BuildContext context,
      String routeName,
      Object? arguments,
    ) {
      return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments);
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
