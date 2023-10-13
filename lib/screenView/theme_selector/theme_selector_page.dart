import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Components/spacing.dart';
import '../../Components/theme_selector_container.dart';

class ThemeSelectorPage extends StatelessWidget {
  final bool isMobile;
  const ThemeSelectorPage({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    //final themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
      appBar: AppBar(
          title: const Text('Theme', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          elevation: 2,
         // backgroundColor: themeNotifier.currentTheme==ThemeData.light()?Colors.white10:Colors.black12,
       //   backgroundColor: themeNotifier.currentTheme.scaffoldBackgroundColor
      ),
      body: SafeArea(
        child: Padding(
          padding: isMobile?EdgeInsets.symmetric(horizontal: 10.w):EdgeInsets.symmetric(horizontal: .25.sw),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpacing(15.h),
              ThemeSelectorContainer(text: "System"),
              ThemeSelectorContainer(text: "Light"),
              ThemeSelectorContainer(text: "Dark"),
            ],
          ),
        ),
      ),
    );
  }
}
