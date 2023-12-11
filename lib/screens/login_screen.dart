import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:macverin_task/constants.dart';
import 'package:macverin_task/screens/login_tab.dart';
import 'package:macverin_task/screens/onboarding_screen.dart';
import 'package:macverin_task/screens/register_tab.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  bool isSelected = false;
  bool isDetail = false;
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);
    _slideAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 78, 78, 78),
                        width: 0.7),
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => OnBoardingScreen()));
                  },
                  icon: const Icon(
                    FontAwesome.arrow_left,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25.0, right: 20),
              child: RichText(
                  text: const TextSpan(
                      text: 'Go ahead and set up your account',
                      style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 186, 186, 186)))),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25.0, right: 20),
              child: RichText(
                  text: const TextSpan(
                      text: 'Sign in-up to enjoy the best managing experience',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 105, 105, 105)))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20.0, right: 20),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 53,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: const Color(0xa5c0c0c0)),
                          ),
                          AnimatedBuilder(
                            animation: _slideAnimation,
                            builder: (context, child) {
                              return Transform.translate(
                                offset: Offset(
                                    _slideAnimation.value *
                                        (MediaQuery.sizeOf(context).width -
                                            208),
                                    0),
                                child: child,
                              );
                            },
                            child: slider(),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 15.0, left: 58, right: 50),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = false;
                                    });
                                    _animationController.reverse();
                                  },
                                  child: const Text(
                                    'Login',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSelected = true;
                                    });
                                    _animationController.forward();
                                  },
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!isSelected) ...{
                      const LoginTab()
                    } else ...{
                      const RegisterTab()
                    }
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget slider() {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 8.0),
      child: Container(
        width: 151,
        height: 42,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color.fromARGB(255, 255, 255, 255)),
      ),
    );
  }
}
