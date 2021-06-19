import 'package:example/screen/about_us.dart';
import 'package:example/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:supper_route/define.dart';

part 'main.mich.dart';

void main() => runApp(SupperApp());

//Example
enum routes {
  @define.asHome(screen: HomePage)
  home,
//@define.as(path: '/AboutUs', screen: AboutUs)
  @define(screen: AboutUs)
  aboutUs,
}
