import 'package:bbu_midterm/dashbord_screens.dart';
import 'package:bbu_midterm/screens/product.dart';
import 'package:bbu_midterm/screens/settings.dart';
import 'package:bbu_midterm/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';

class Dashbord extends StatelessWidget {
  const Dashbord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white,),
        backgroundColor: const Color.fromARGB(255, 40, 84, 121),
        title: const Text('Menu Bar', style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: const Icon(Icons.backspace, color: Color.fromARGB(255, 255, 255, 255),),
          onPressed: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()),
            );// Menu Button Logic
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 84, 121),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile Picture
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/nsy.jpg'),
                  ),
                  // User Info
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, NSY!',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'Welcome Back',
                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  ),
                  // Buttons
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('MY ORDERS'),
                  ),
                ],
              ),
            ),
            // Menu Buttons (Three Trumpets)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildMenuButton(
                      icon: Icons.home,
                      label: 'Home',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DashboardScreen()),
                        );
                      }),
                  buildMenuButton(
                      icon: Icons.person,
                      label: 'Profile',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfileScreen()),
                        );
                      }),
                  buildMenuButton(
                      icon: Icons.settings,
                      label: 'Settings',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsScreen()),
                        );
                      }),
                ],
              ),
            ),

            // Build List for Menu Options
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                buildListTile(
                    icon: Icons.shopping_cart,
                    title: 'Products',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProductsScreen()));
                    }),
                buildListTile(
                    icon: Icons.category,
                    title: 'Categories',
                    onTap: () {}),
                buildListTile(
                    icon: Icons.help, title: 'Help', onTap: () {}),
                buildListTile(
                    icon: Icons.info, title: 'About', onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // Menu Button Widget (Three Buttons)
  Widget buildMenuButton(
      {required IconData icon,
      required String label,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blueAccent,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(height: 8),
          Text(label,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  // Build ListTile Widget
  Widget buildListTile(
      {required IconData icon, required String title, required VoidCallback onTap}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
// Home Screen Class



