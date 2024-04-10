import 'package:flutter/material.dart';
import 'package:foodendra/controllers/user_profile_controller.dart';
import 'package:get/get.dart';

class EditUserProfilePage extends StatelessWidget {
  final String username;
  final String email;
  final String address;
  final String phoneNumber;
  EditUserProfilePage({
    super.key,
    required this.username,
    required this.email,
    required this.address,
    required this.phoneNumber,
  });

  final UserProfilePageController c = Get.put(UserProfilePageController());

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController =
        TextEditingController(text: username);
    TextEditingController emailController = TextEditingController(text: email);
    TextEditingController addressController =
        TextEditingController(text: address);
    TextEditingController phoneNumberController =
        TextEditingController(text: phoneNumber);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: Colors.deepOrangeAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/1/18/Mark_Zuckerberg_F8_2019_Keynote_%2832830578717%29_%28cropped%29.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                c.updateUserInfo(
                  usernameController.text,
                  emailController.text,
                  addressController.text,
                  phoneNumberController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                shadowColor: Colors.grey,
                elevation: 5,
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 32),
            profileItem(
              icon: Icons.person,
              label: 'Username',
              controller: usernameController,
            ),
            profileItem(
              icon: Icons.email,
              label: 'Email',
              controller: emailController,
            ),
            profileItem(
              icon: Icons.phone,
              label: 'Phone Number',
              controller: phoneNumberController,
            ),
          ],
        ),
      ),
    );
  }

  Widget profileItem({
    required IconData icon,
    required String label,
    required TextEditingController controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.deepOrangeAccent,
                  Color.fromARGB(255, 229, 14, 182),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.deepOrangeAccent, // Change label color
                  ),
                ),
                const SizedBox(height: 4),
                TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter $label', // Dynamic hint
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
