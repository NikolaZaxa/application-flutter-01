import 'package:bbu_midterm/dashbord_menubar..dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 211, 211, 211),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white,),
        backgroundColor: const Color.fromARGB(255, 40, 84, 121),
        title: const Text("BBU STORE",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashbord()),
                );
            // Add logic to open side menu
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Add options menu logic
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card Section
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 84, 121),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Profile Image
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/nsy.jpg'), // Add your image in assets
                  ),
                  // Profile Text
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text(
                          '  Good Afternoon!',
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '  NSY Poipet',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                  // Buttons
                  const SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {
                      
                    },
                    child: const Text('MORE', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 40, 84, 121),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan.shade700,
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Text('MY ORDERS'),
                  ),
                  const SizedBox(width: 5),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('INFORMATION', style: TextStyle(color: Colors.white),),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan.shade700,
                      foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: const Text('TOP NEWS'),
                  ),
                ],
              ),
            ),

            // Responsive Grid Menu Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  childAspectRatio: 1.2, // Aspect ratio
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                children: [
                  buildDashboardMenu(
                      icon: Icons.person, label: 'CONTACTS', onTap: () {}),
                  buildDashboardMenu(
                      icon: Icons.group, label: 'GROUPS', onTap: () {}),
                  buildDashboardMenu(
                      icon: Icons.shopping_cart, label: 'PRODUCTS', onTap: () {}),
                  buildDashboardMenu(
                      icon: Icons.category, label: 'CATEGORIES', onTap: () {}),
                  buildDashboardMenu(
                      icon: Icons.help, label: 'HELP', onTap: () {}),
                  buildDashboardMenu(
                      icon: Icons.settings, label: 'SETTINGS', onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for menu buttons
  Widget buildDashboardMenu(
      {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan.shade50,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0, 2),
              blurRadius: 4,  
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.cyan),
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
