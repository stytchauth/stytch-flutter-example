import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stytch_flutter_example/constants.dart';
import 'package:stytch_flutter_example/login.dart';
import 'package:stytch_flutter_example/models.dart';
import 'package:stytch_flutter_example/user.dart';

String basicAuth =
    'Basic ${base64.encode(utf8.encode('${Constants.stytchProjectId}:${Constants.stytchSecret}'))}';

Future<AuthenticateResponse> authenticate(String methodId, String code) async {
  final response = await http.post(
    Uri.parse('https://test.stytch.com/v1/otps/authenticate'),
    headers: {
      HttpHeaders.authorizationHeader: basicAuth,
    },
    body: jsonEncode(<String, String>{
      'method_id': methodId,
      'code': code,
    }),
  );

  if (response.statusCode == 200) {
    return AuthenticateResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception(
        ErrorResponse.fromJson(jsonDecode(response.body)).errorMessage);
  }
}

class VerifyScreen extends StatefulWidget {
  const VerifyScreen(
      {super.key, required this.phoneNumber, required this.methodId});

  final String phoneNumber;
  final String methodId;

  @override
  State<VerifyScreen> createState() => VerifyScreenState();
}

class VerifyScreenState extends State<VerifyScreen> {
  String otpCode = '';
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
                  'Enter passcode',
                  style: GoogleFonts.ibmPlexSans(
                    color: const Color(0xFF19303D),
                    fontSize: 24,
                    height: 1.25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  'A 6-digit passcode was sent to you at ${widget.phoneNumber}.',
                  style: GoogleFonts.ibmPlexSans(
                    color: const Color(0xFF19303D),
                    fontSize: 18,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      errorMessage = '';
                      otpCode = value;
                    });
                    if (value.length == 6) {
                      authenticate(widget.methodId, otpCode).then((response) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserScreen(
                                  userId: response.userId,
                                  phoneId: response.methodId,
                                  phoneNumber: widget.phoneNumber)),
                        );
                      }).catchError((error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      });
                    }
                  },
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF19303D)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF19303D)),
                      ),
                      hintText: '123456'),
                ),
                const SizedBox(height: 12),
                Text(
                  errorMessage,
                  style: GoogleFonts.ibmPlexSans(
                    color: const Color(0xFF19303D),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Didn\'t get it?',
                    style: GoogleFonts.ibmPlexSans(
                      color: const Color(0xFF5C727D),
                      fontSize: 16,
                      height: 1.2,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 4),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFF5C727D),
                      textStyle: GoogleFonts.ibmPlexSans(
                        color: const Color(0xFF5C727D),
                        fontSize: 16,
                        height: 1.2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onPressed: () {
                      loginOrCreate(widget.phoneNumber);
                    },
                    child: const Text('Resend code.'),
                  ),
                ]),
                const SizedBox(height: 12),
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
