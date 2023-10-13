import 'package:flutter/material.dart';
import 'package:payment_gateway_integration/screenView/theme_selector/theme_selector_page.dart';

class ThemeSelectorPageDesktop extends StatelessWidget {
  const ThemeSelectorPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeSelectorPage(isMobile: false);
  }
}
