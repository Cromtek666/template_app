import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && (Platform.isLinux || Platform.isWindows || Platform.isMacOS)) {
    await DesktopWindow.setMinWindowSize(const Size(500, 1000));
    await DesktopWindow.setMaxWindowSize(const Size(511, 1000));
  }

  runApp(ProviderScope(child: MyApp()));
}
