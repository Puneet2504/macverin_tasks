import 'package:flutter/material.dart';
import 'package:macverin_task/constants.dart';
import 'package:macverin_task/screens/login_screen.dart';
import 'package:macverin_task/services/firebase_auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 131.0),
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/image.png'),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 10),
                child: RichText(
                  text: const TextSpan(
                      text:
                          'Effortlessly Manage Your Tasks and Boost Productivuty',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 10),
                child: RichText(
                  text: const TextSpan(
                      text:
                          'The ultimate task management app designed to streamline your workflow and supercharge your productivity',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ));
                  },
                  child: const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(114, 158, 158, 158),
                      fixedSize: const Size(333, 48)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
