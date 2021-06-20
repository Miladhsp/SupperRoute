import 'package:analyzer/dart/element/element.dart' as E;
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import '../supper_route.dart';

class MichGenerator extends GeneratorForAnnotation<SupperRoute> {
  @override
  generateForAnnotatedElement(
      E.Element element, ConstantReader annotation, BuildStep buildStep) {
    String initialRoute = annotation.peek('initialRoute')?.stringValue ?? '/';
    List<Object>? screens = annotation.peek('screens')!.listValue;
    Map<dynamic, dynamic>? routes =
        annotation.peek('routes')?.mapValue as Map<dynamic, dynamic>;
    return generateCode(
            initialRoute, generateModels(initialRoute, screens, routes))
        .toString();
  }

  Set<Model> generateModels(String initialRoute, List<Object>? screens,
      Map<dynamic, dynamic>? routes) {
    Set<Model> models = {};
    models.add(Model(getClass(screens![0].toString()), initialRoute));
    Screens:
    for (int i = 1; i < screens.length; i++) {
      String item = getClass(screens[i].toString());
      models.add(Model(item, '/' + item));
    }
    Routes:
    routes?.forEach((screen, path) {
      models.add(
          Model(getClass(screen.toString()), getMapValue(path.toString())));
    });
    return models;
  }

  String getClass(String type) {
    return type.substring(type.indexOf('(') + 1, type.indexOf('*'));
  }

  String getMapValue(String type) {
    return type.substring(type.indexOf('/') + 1, type.indexOf(')') - 1);
  }
}

String firstLowerCase(String txt) {
  return txt[0].toLowerCase() + txt.substring(1);
}

StringBuffer generateCode(initialRoute, Set<Model> models) {
  final String context = ': (context) =>';
  var code = StringBuffer();
  code.writeln('''
    part of 'main.dart';
    
    
      final Goto goto = Goto();
    
    class SupperApp extends StatelessWidget {
           @override
           Widget build(BuildContext context) {
             return MaterialApp(
             initialRoute: \'$initialRoute\',
             routes: {
    ''');
  models.forEach((m) {
    code.writeln('\'${m.path}\' $context ${m.screen}() ,');
  });
  code.writeln('''},);}}
            
      class Goto {
  ''');

  models.forEach((m) {
    code.writeln('''
     ${firstLowerCase(m.screen)}({required BuildContext context,Object? arguments}){
    _from(context, \'${m.path}\', arguments);
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
  
  arguments(BuildContext context) => ModalRoute.of(context)?.settings.arguments;
  
  
  ''');
  return code;
}

class Model {
  final String path;
  final String screen;

  Model(this.screen, this.path);
}
