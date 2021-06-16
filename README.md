
# SupperRoute
```yaml
#pubspec.yaml
dependencies:
  #...
  supper_route:                                     # <-- Add this line
    git:                                            # <-- And this line
      url: https://github.com/Miladhsp/SupperRoute/ # <-- And this line
dev_dependencies:
  #...
  build_runner: '>=0.9.1'                           # <-- And this line
```
# main.dart
```dart
import 'package:flutter/material.dart';
import 'package:supper_route/define.dart';
part 'main.mich.dart';

void main() => runApp(SupperApp());

//Example
enum GoTo {
  @define(path: '/', screen: HomePage)
  home,
  @define(path: '/aboutUs', screen: AboutUs)
  aboutUs,
}
```
# Example
```diff
+ import '../main.dart';
```
| Class | Code |
| ------ | ------ |
| HomePage extends StatelessWidget | GoTo.aboutUs.from(context, arguments: 'dataPass'); |
| class AboutUs extends StatelessWidget | var dataPass = arguments(context).toString(); |

# Terminal
```bat
@echo off
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter packages pub run build_runner clean
::flutter packages pub run build_runner watch --delete-conflicting-outputs
```
# GENERATED CODE
```dart
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

```

