import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:macverin_task/services/firebase_auth_services.dart';
import 'package:macverin_task/screens/detail_screen.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class RegisterTab extends StatefulWidget {
  const RegisterTab({super.key});

  @override
  State<RegisterTab> createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuthServices _auth = FirebaseAuthServices();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool isSelected = false;
  bool isSelectedConfirmPwd = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void showNotification(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent, content: Text(message.toString())));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(children: [
        Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: EdgeInsets.only(top: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0x55979797))),
                      width: 323,
                      height: 73,
                      child: TextFormField(
                          controller: _emailController,
                          textAlign: TextAlign.start,
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                            fillColor: Color(0x00979797),
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Color(0xFF9D9D9D)),
                            counterText: '',
                            prefixIcon: Icon(
                              Icons.mail_outlined,
                              color: Colors.green,
                              size: 30,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                    .hasMatch(value!)) {
                              return "Enter Correct Email";
                            } else {
                              return null;
                            }
                          }),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0x55979797))),
                      width: 323,
                      height: 73,
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: !isSelected,
                        obscuringCharacter: '*',
                        textAlign: TextAlign.start,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            fillColor: const Color(0x00979797),
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'Password',
                            labelStyle:
                                const TextStyle(color: Color(0xFF9D9D9D)),
                            counterText: '',
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.green,
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isSelected = !isSelected;
                                });
                              },
                              icon: Icon(
                                !isSelected
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 30,
                                color: Colors.green,
                              ),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0x55979797))),
                      width: 323,
                      height: 73,
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !isSelectedConfirmPwd,
                        obscuringCharacter: '*',
                        textAlign: TextAlign.start,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            fillColor: const Color(0x00979797),
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'Confirm Password',
                            labelStyle:
                                const TextStyle(color: Color(0xFF9D9D9D)),
                            counterText: '',
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.green,
                              size: 30,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isSelectedConfirmPwd = !isSelectedConfirmPwd;
                                });
                              },
                              icon: Icon(
                                !isSelectedConfirmPwd
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                size: 30,
                                color: Colors.green,
                              ),
                            )),
                        validator: Validators.compose([
                          Validators.required('Password is required'),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () async {
              if (_passwordController.text == _confirmPasswordController.text &&
                  _formKey.currentState!.validate()) {
                await _auth.signUpWithEmailAndPassword(
                    _emailController.text, _passwordController.text);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const DetailScreen(
                          isSelected: true,
                        )));
              } else {
                showNotification(context, 'Password Did Not Match');
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff519C6D),
                fixedSize: Size(MediaQuery.sizeOf(context).width, 48)),
            child: const Text('Register',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 1,
                color: const Color(0xffCDCDCD),
              ),
              const Text("Or Signup with",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Color(0x999D9D9D))),
              Container(
                width: 100,
                height: 1,
                color: const Color(0xffCDCDCD),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: GestureDetector(
            onTap: () async {
              await _auth.signInWithGoogle();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailScreen(isSelected: true)));
            },
            child: Container(
              padding: const EdgeInsets.only(top: 2),
              width: 192,
              height: 54,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: const Color(0x99CECECE))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Logo(Logos.google),
                  const Text('Google',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      )),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
