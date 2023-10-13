import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  const CustomTextField({super.key, required this.textEditingController});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      //obscureText: true,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
       // prefixIcon: Icon(Icons.password, color: myColor,),
       // hintText: 'Enter your password',
        enabledBorder: borderStyle(false, false),
        errorBorder: borderStyle(false, true),
        focusedBorder: borderStyle(true, false),
        focusedErrorBorder: borderStyle(true, true),
      ),
      // validator: (value){
      //   if(value.toString().length<6){
      //     return 'Please enter at least 6 character';
      //   } else {
      //     password = _passwordController.text;
      //     return null;
      //   }
      // },
    );
  }
}


OutlineInputBorder borderStyle(bool focused, bool error) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(width: focused ? 2 : 1,
          color: error ? Colors.red : Colors.deepPurpleAccent)
  );
}