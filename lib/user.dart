import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserScreen extends StatelessWidget {
  const UserScreen(
      {super.key,
      required this.userId,
      required this.phoneId,
      required this.phoneNumber});

  final String userId;
  final String phoneId;
  final String phoneNumber;

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
                  'You\'re logged in!',
                  style: GoogleFonts.ibmPlexSans(
                    color: const Color(0xFF19303D),
                    fontSize: 24,
                    height: 1.25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Image.asset('assets/images/person.png'),
                    const SizedBox(width: 8),
                    Text(
                      'USER ID',
                      style: GoogleFonts.ibmPlexSans(
                        color: const Color(0xFF19303D),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                TextFormField(
                  initialValue: userId,
                  maxLines: null,
                  enabled: false,
                  decoration: const InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE5E8EB)),
                    ),
                  ),
                  style: GoogleFonts.ibmPlexMono(
                    color: const Color(0xFF19303D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Image.asset('assets/images/sms.png'),
                    const SizedBox(width: 8),
                    Text(
                      'PHONE ID',
                      style: GoogleFonts.ibmPlexSans(
                        color: const Color(0xFF19303D),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                TextFormField(
                  initialValue: phoneId,
                  maxLines: null,
                  enabled: false,
                  decoration: const InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE5E8EB)),
                    ),
                  ),
                  style: GoogleFonts.ibmPlexMono(
                    color: const Color(0xFF19303D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Image.asset('assets/images/numbers.png'),
                    const SizedBox(width: 8),
                    Text(
                      'PHONE NUMBER',
                      style: GoogleFonts.ibmPlexSans(
                        color: const Color(0xFF19303D),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                TextFormField(
                  initialValue: phoneNumber,
                  maxLines: null,
                  enabled: false,
                  decoration: const InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFE5E8EB)),
                    ),
                  ),
                  style: GoogleFonts.ibmPlexMono(
                    color: const Color(0xFF19303D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
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
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: const Text('Log out'),
                ),
                const Spacer(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
