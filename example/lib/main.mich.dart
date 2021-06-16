// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MichGenerator
// **************************************************************************

part of 'main.dart';

final Goto GoTo = Goto();

class SupperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/aboutUs': (context) => AboutUs(),
      },
    );
  }
}

class Goto {
  home({required BuildContext context, Object? arguments}) {
    _from(context, '/', arguments);
  }

  aboutUs({required BuildContext context, Object? arguments}) {
    _from(context, '/aboutUs', arguments);
  }

  Future<T?> _from<T extends Object?>(
    BuildContext context,
    String routeName,
    Object? arguments,
  ) {
    return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments);
  }
}

arguments(BuildContext context) => ModalRoute.of(context)?.settings.arguments;
