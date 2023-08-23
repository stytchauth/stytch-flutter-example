import 'package:flutter/material.dart';
import 'package:stytch_flutter_example/login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Stytch Flutter Example',
    theme: ThemeData.light().copyWith(
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color(0xFF19303D),
        selectionColor: Color(0xFF19303D),
        selectionHandleColor: Color(0xFF19303D),
      ),
    ),
    home: const LoginScreen(),
  ));
}
