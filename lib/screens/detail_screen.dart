import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:macverin_task/constants.dart';
import 'package:macverin_task/screens/profile_screen.dart';

class DetailScreen extends StatefulWidget {
  final bool isSelected;
  const DetailScreen({super.key, required this.isSelected});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _rightAnimation;
  late Animation<double> _topAnimation;
  bool _isVisible = false;

  File? image;

  @override
  void initState() {
    super.initState();
    _nameController.text = 'John';
    _categoryController.text = 'Technology';
    _qualificationController.text = 'Graduate AKTU';
    _locationController.text = 'Delhi';
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _rightAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _topAnimation = Tween<double>(begin: 0.5, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    Timer(const Duration(milliseconds: 100), () {
      setState(() {
        _isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _locationController.dispose();
    _qualificationController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void playAnimation() {
    _controller.forward();
  }

  void stopAnimation() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSelected) {
      playAnimation();
    }
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
                    Navigator.of(context).pop();
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
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: Stack(children: [
                  AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Positioned(
                        right: _rightAnimation.value *
                            MediaQuery.of(context).size.width /
                            1.5,
                        top: _topAnimation.value *
                            MediaQuery.of(context).size.height /
                            3,
                        child: child!,
                      );
                    },
                    child: IconButton(
                        onPressed: () async {
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (image != null) {
                            setState(() => this.image = File(image.path));
                          }
                        },
                        icon: const Icon(
                          Iconsax.user_cirlce_add,
                          size: 110,
                          color: Color(0x99808080),
                        )),
                  ),
                  Visibility(
                    child: detailForm(),
                    visible: _isVisible,
                  )
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget detailForm() {
    return Column(
      children: [
        const SizedBox(
          height: 120,
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
              child: TextField(
                controller: _nameController,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  fillColor: Color(0x00979797),
                  border: InputBorder.none,
                  filled: true,
                  labelText: 'Your Good Name',
                  labelStyle: TextStyle(color: Color(0xFF9D9D9D)),
                  counterText: '',
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                expands: true,
                minLines: null,
                maxLines: null,
                maxLength: 50,
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
              child: TextField(
                controller: _categoryController,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  fillColor: Color(0x00979797),
                  border: InputBorder.none,
                  filled: true,
                  labelText: 'Category',
                  labelStyle: TextStyle(color: Color(0xFF9D9D9D)),
                  counterText: '',
                  prefixIcon: Icon(
                    Icons.category_outlined,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                expands: true,
                minLines: null,
                maxLines: null,
                maxLength: 50,
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
              child: TextField(
                controller: _qualificationController,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  fillColor: Color(0x00979797),
                  border: InputBorder.none,
                  filled: true,
                  labelText: 'Highest Qualification',
                  labelStyle: TextStyle(color: Color(0xFF9D9D9D)),
                  counterText: '',
                  prefixIcon: Icon(
                    Icons.school_outlined,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                expands: true,
                minLines: null,
                maxLines: null,
                maxLength: 50,
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
              child: TextField(
                controller: _locationController,
                textAlign: TextAlign.start,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  fillColor: Color(0x00979797),
                  border: InputBorder.none,
                  filled: true,
                  labelText: 'Location',
                  labelStyle: TextStyle(color: Color(0xFF9D9D9D)),
                  counterText: '',
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.green,
                    size: 30,
                  ),
                ),
                expands: true,
                minLines: null,
                maxLines: null,
                maxLength: 50,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff519C6D),
                fixedSize: Size(MediaQuery.sizeOf(context).width, 48)),
            child: const Text('Done',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
