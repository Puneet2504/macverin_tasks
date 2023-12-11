import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:macverin_task/constants.dart';
import 'package:macverin_task/screens/tab_bar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<BottomNavigationBarItem> iconList = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.other_houses_outlined),
        label: 'Home',
        backgroundColor: kBackgroundColor),
    const BottomNavigationBarItem(
        icon: Icon(FontAwesome.lightbulb),
        label: 'Bulb',
        backgroundColor: kBackgroundColor),
    const BottomNavigationBarItem(
        icon: Icon(Icons.edit_square),
        label: 'Edit',
        backgroundColor: kBackgroundColor),
    const BottomNavigationBarItem(
        icon: Icon(Icons.notifications_none_outlined),
        label: 'Notify',
        backgroundColor: kBackgroundColor),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_outlined),
        label: 'Profile',
        backgroundColor: kBackgroundColor)
  ];
  List<Widget> screens = [
    const ProfileScreen(),
    const ProfileScreen(),
    const ProfileScreen(),
    const ProfileScreen(),
    const ProfileScreen()
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 80),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Iconsax.user_cirlce_add,
                    size: 100,
                    color: Colors.white,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'John Doe',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          Icon(
                            Icons.verified_user,
                            size: 15,
                            color: Colors.white,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            '500',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Text(
                            'Connects',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '100',
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 5),
              child: Row(
                children: [
                  Text(
                    'Technology',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 5),
              child: Row(
                children: [
                  Text(
                    'Graduate AKTU',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0, top: 5),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 10,
                    color: Colors.white,
                  ),
                  Text(
                    'Delhi',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 34,
                    width: 128,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(118, 158, 158, 158)),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Bootstrap.chat,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Chat',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ]),
                  ),
                  Container(
                    height: 34,
                    width: 127,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromARGB(118, 158, 158, 158)),
                    child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.bolt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Connect',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )
                        ]),
                  ),
                  const Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 10),
              child: Row(
                children: [
                  Text(
                    'About',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10, right: 25),
              child: RichText(
                text: const TextSpan(
                    text:
                        'Lorem ipsum dolor sit amet consectetur adipiscingelit Ut et.',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 14)),
                maxLines: 4,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const CategoryTab()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.white,
        fixedColor: Colors.white,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: iconList,
      ),
    );
  }
}
