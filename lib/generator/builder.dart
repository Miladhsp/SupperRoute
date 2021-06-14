import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'generator.dart';

Builder builder(BuilderOptions options) =>
    LibraryBuilder(MichGenerator(), generatedExtension: '.mich.dart');
