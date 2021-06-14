// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// MichGenerator
// **************************************************************************

part of 'main.dart';

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

arguments(BuildContext context) => ModalRoute.of(context)?.settings.arguments;

extension navigation on GoTo {
  value() {
    switch (this) {
      case GoTo.home:
        return '/';
      case GoTo.aboutUs:
        return '/aboutUs';
    }
  }

  Future<T?> from<T extends Object?>(
    BuildContext context, {
    Object? arguments,
  }) {
    return Navigator.of(context).pushNamed<T>(value(), arguments: arguments);
  }
}
