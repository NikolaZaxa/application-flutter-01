import 'package:bbu_midterm/modle/user.dart';
import 'package:bbu_midterm/screens/user_profile_screen.dart';
import 'package:bbu_midterm/service/api_service.dart';
import 'package:flutter/material.dart';

class EditUserProfileScreen extends StatefulWidget {
  final User user;

  const EditUserProfileScreen({required this.user});

  @override
  _EditUserProfileScreenState createState() => _EditUserProfileScreenState();
}

class _EditUserProfileScreenState extends State<EditUserProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController usernameController;
  late TextEditingController fullNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController(text: widget.user.username);
    fullNameController = TextEditingController(text: widget.user.fullName);
    phoneController = TextEditingController(text: widget.user.phone);
    emailController = TextEditingController(text: widget.user.email);
  }

  void updateUser() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => isLoading = true);

    User updatedUser = User(
      username: usernameController.text,
      fullName: fullNameController.text,
      phone: phoneController.text,
      email: emailController.text,
    );

    try {
      String message = await ApiService.updateUser(updatedUser);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }

    setState(() => isLoading = false);
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
          'Edit Profile',
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
              MaterialPageRoute(builder: (context) => UserProfileScreen()),
            ); // Menu Button Logic
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            ColoredBox(
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            const CircleAvatar(
              radius: 60,
              backgroundImage:
                  AssetImage('assets/nsy.jpg'), // Add your image in assets
            ),
            TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    labelText: 'Username',
                    icon: Icon(
                      Icons.account_circle, // Left icon
                      color: Colors.purple,
                      size: 30,
                    ),
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ))),
            TextFormField(
                controller: fullNameController,
                decoration: InputDecoration(
                    labelText: 'Full Name',
                    icon: Icon(
                      Icons.card_giftcard, // Left icon
                      color: Color.fromARGB(255, 25, 60, 76),
                      size: 30,
                    ),
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ))),
            TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                    labelText: 'Phone',
                    icon: Icon(
                      Icons.phone_iphone, // Left icon
                      color: const Color.fromARGB(255, 0, 195, 255),
                      size: 30,
                    ),
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ))),
            TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'Email',
                    icon: Icon(
                      Icons.mail, // Left icon
                      color: const Color.fromARGB(255, 255, 0, 136),
                      size: 30,
                    ),
                    labelStyle: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ))),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(
                    255, 35, 66, 91), // Button background color
                foregroundColor: Colors.white, // Text color
                textStyle: TextStyle(
                  // Text style
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: isLoading ? null : updateUser,
              child: isLoading
                  ? CircularProgressIndicator(
                      color: const Color.fromARGB(255, 57, 157, 34))
                  : Text(
                      'Update Profile User',
                      style: TextStyle(
                        color: Colors.white, //
                        fontSize: 18,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
