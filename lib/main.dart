import 'package:firebase_project/Providers/theme_provider.dart';
import 'package:firebase_project/Screen/start_screen.dart';
import 'package:firebase_project/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeMode == ThemeMode.light
          ? AppTheme.lightThemeCopy
          : AppTheme.darkTheme,
      darkTheme: AppTheme.darkTheme,
      home: const StartScreen(),
    );
  }
}
