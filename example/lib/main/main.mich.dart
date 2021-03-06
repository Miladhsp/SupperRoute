// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MichGenerator
// **************************************************************************

part of 'main.dart';

final Goto goto = Goto();

class SupperApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/AboutUs': (context) => AboutUs(),
      },
    );
  }
}

class Goto {
  homePage({required BuildContext context, Object? arguments}) {
    _from(context, '/', arguments);
  }

  aboutUs({required BuildContext context, Object? arguments}) {
    _from(context, '/AboutUs', arguments);
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
