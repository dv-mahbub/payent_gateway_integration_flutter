import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment_gateway_integration/responsive/responsive_layout.dart';
import 'package:payment_gateway_integration/screenView/homepage/homepage_mobile.dart';
import 'package:payment_gateway_integration/theme/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final themeNotifier = ThemeNotifier(ThemeData.light(), prefs);
  await themeNotifier.loadTheme();
  await themeNotifier.loadSelectedThemeOption(); // Load the selected theme option
  //WebViewPlatform.instance = WebViewPlatform();

  runApp(
    ChangeNotifierProvider(
      create: (_) => themeNotifier,
      child: const ScreenUtilInit(
        designSize: Size(360, 690),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeNotifier.currentTheme,
      home: const ResponsiveLayout(mobileBody: HomePageMobile()),
    );
  }
}