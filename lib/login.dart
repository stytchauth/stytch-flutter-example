import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stytch_flutter_example/constants.dart';
import 'package:stytch_flutter_example/models.dart';
import 'package:stytch_flutter_example/verify.dart';

String basicAuth =
    'Basic ${base64.encode(utf8.encode('${Constants.stytchProjectId}:${Constants.stytchSecret}'))}';

Future<LoginResponse> loginOrCreate(String phoneNumber) async {
  final response = await http.post(
    Uri.parse('https://test.stytch.com/v1/otps/sms/login_or_create'),
    headers: {
      HttpHeaders.authorizationHeader: basicAuth,
    },
    body: jsonEncode(<String, String>{
      'phone_number': phoneNumber,
    }),
  );

  if (response.statusCode == 200) {
    return LoginResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(
        ErrorResponse.fromJson(jsonDecode(response.body)).errorMessage);
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String phoneNumber = '';
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
            child: Column(
              children: [
                Text(
                  'Sign up or log in',
                  style: GoogleFonts.ibmPlexSans(
                    color: const Color(0xFF19303D),
                    fontSize: 24,
                    height: 1.25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      errorMessage = '';
                      phoneNumber = value;
                    });
                  },
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF19303D)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF19303D)),
                      ),
                      hintText: '+11234567890'),
                ),
                const SizedBox(height: 12),
                Text(
                  errorMessage,
                  style: GoogleFonts.ibmPlexSans(
                    color: const Color(0xFF19303D),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF19303D),
                    minimumSize: const Size.fromHeight(48),
                    textStyle: GoogleFonts.ibmPlexSans(
                      fontSize: 18,
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: () {
                    loginOrCreate(phoneNumber).then((response) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VerifyScreen(
                            phoneNumber: phoneNumber,
                            methodId: response.phoneId,
                          ),
                        ),
                      );
                    }).catchError((error) {
                      setState(() {
                        errorMessage = error.toString();
                      });
                    });
                  },
                  child: const Text('Continue'),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Powered by',
                      style: GoogleFonts.ibmPlexSans(
                        color: const Color(0xFFADBCC5),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Image.asset('assets/images/stytch_logo.png'),
                  ],
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
