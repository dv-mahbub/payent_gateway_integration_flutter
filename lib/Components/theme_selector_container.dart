import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../theme/theme_notifier.dart';

// ignore: must_be_immutable
class ThemeSelectorContainer extends StatefulWidget {
  String text;
  ThemeSelectorContainer({super.key, required this.text});

  @override
  State<ThemeSelectorContainer> createState() => _ThemeSelectorContainerState();
}

class _ThemeSelectorContainerState extends State<ThemeSelectorContainer> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: InkWell(
        onTap: (){
          switch (widget.text){
            case 'System':
              final Brightness systemBrightness = MediaQuery.of(context).platformBrightness;
              themeNotifier.setTheme(systemBrightness == Brightness.light
                  ? ThemeData.light()
                  : ThemeData.dark());
              themeNotifier.setSelectedThemeOption('System');
              break;

            case 'Light':
              themeNotifier.setTheme(ThemeData.light());
              themeNotifier.setSelectedThemeOption('Light');
              break;

            default:
              themeNotifier.setTheme(ThemeData.dark());
              themeNotifier.setSelectedThemeOption('Dark');
          }
        },
        child: Container(
          height: 45.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              color: themeNotifier.selectedThemeOption == widget.text
                  ?themeNotifier.currentTheme == ThemeData.light()
                  ?Colors.blue: Colors.lightBlueAccent
                  : themeNotifier.currentTheme == ThemeData.light()
                  ? Colors.black12:Colors.white12
          ),
          child: Center(child: Text(widget.text, style: TextStyle(color: themeNotifier.selectedThemeOption!=widget.text && themeNotifier.currentTheme==ThemeData.light()? Colors.black:Colors.white),)),
        ),
      ),
    );
  }
}
