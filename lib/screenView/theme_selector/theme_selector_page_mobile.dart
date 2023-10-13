import 'package:flutter/material.dart';
import 'package:payment_gateway_integration/screenView/theme_selector/theme_selector_page.dart';

class ThemeSelectorPageMobile extends StatelessWidget {
  const ThemeSelectorPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const ThemeSelectorPage(isMobile: true);
  }
}
