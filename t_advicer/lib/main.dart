import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:t_advicer/3_application/pages/advice/advice_page.dart';
import 'package:t_advicer/theme.dart';

import '3_application/core/services/theme_service.dart';
import 'injection.dart' as di; //di = dependancy Injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const AdvicerPageWrapperProvider(),
      );
    });
  }
}
