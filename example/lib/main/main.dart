import 'package:example/screen/about_us.dart';
import 'package:example/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supper_route/supper_route.dart';

part '../main/main.mich.dart';

@SupperRoute(screens: [HomePage, AboutUs])
void main() => runApp(SupperApp());
