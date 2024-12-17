import 'package:bbu_midterm/dashbord_menubar..dart';
import 'package:bbu_midterm/modle/user.dart';
import 'package:bbu_midterm/screens/edit_user_profile.dart';
import 'package:bbu_midterm/service/api_service.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  User? user;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  void fetchUser() async {
    try {
      final fetchedUser = await ApiService.fetchUserData();
      setState(() {
        user = fetchedUser;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 84, 121),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'User Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.backspace,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Dashbord()),
            ); // Menu Button Logic
          },
        ),
      ),
      body: user == null
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Column(
                children: [
                  ColoredBox(
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(
                        'assets/nsy.jpg'), // Add your image in assets
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ListTile(
                          leading: Icon(
                            Icons.account_circle, // Left icon
                            color: Colors.purple,
                            size: 30,
                          ),
                          title: Text(
                            'Username: ${user!.username}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )),
                      ListTile(
                          leading: Icon(
                            Icons.card_giftcard, // Left icon
                            color: Color.fromARGB(255, 25, 60, 76),
                            size: 30,
                          ),
                          title: Text(
                            'Full Name: ${user!.fullName}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )),
                      ListTile(
                          leading: Icon(
                            Icons.phone_iphone, // Left icon
                            color: const Color.fromARGB(255, 0, 195, 255),
                            size: 30,
                          ),
                          title: Text(
                            'Phone: ${user!.phone}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )),
                      ListTile(
                          leading: Icon(
                            Icons.mail, // Left icon
                            color: const Color.fromARGB(255, 255, 0, 136),
                            size: 30,
                          ),
                          title: Text(
                            'Email: ${user!.email}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 35, 66, 91), // Button background color
                foregroundColor: Colors.white, // Text color
                textStyle: TextStyle(
                  // Text style
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  EditUserProfileScreen(user: user!),
                            ),
                          ).then((_) => fetchUser());
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
