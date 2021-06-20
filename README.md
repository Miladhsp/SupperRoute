
# SupperRoute
```yaml
#pubspec.yaml
environment:             
  sdk: ">=2.12.0 <3.0.0"                            # <-- required
  
dependencies:
  #...
  supper_route:                                     # <-- Add this line
    git:                                            # <-- And this line
      url: https://github.com/Miladhsp/SupperRoute/ # <-- And this line
      
dev_dependencies:
  #...
  build_runner: '>=0.9.1'                           # <-- And this line
```
# Example
#### main.dart
```dart
import 'package:example/screen/about_us.dart';
import 'package:example/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supper_route/supper_route.dart';

part '../main/main.mich.dart';

@SupperRoute(screens: [HomePage, AboutUs])
void main() => runApp(SupperApp());

```
## Terminal
```shell
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner clean
::flutter packages pub run build_runner watch --delete-conflicting-outputs
```
#### home_page.dart
```dart
import '../main/main.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    var dataPass = 'Milad Hasanpour';
    goto.aboutUs(context: context, arguments: dataPass);
    return Center();
  }
  
}
```
#### about_us.dart
```dart
import '../main/main.dart';

class AboutUs extends StatelessWidget {

  var args = arguments(context).toString();
  
  @override
  Widget build(BuildContext context) {
    print(args);
    goto.homePage(context: context);
    return Center();
  }
  
}
```

# GENERATED CODE
```dart
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

```

