import 'package:flutter/material.dart';
import 'package:foodendra/controllers/user_profile_controller.dart';
import 'package:foodendra/views/pages/edit_profile.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  final c = Get.put(UserProfilePageController());

  UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepOrangeAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 10,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    // child: const Center(
                    //   child: CircleAvatar(
                    //     radius: 70,
                    //     backgroundImage: NetworkImage(
                    //         'https://upload.wikimedia.org/wikipedia/commons/1/18/Mark_Zuckerberg_F8_2019_Keynote_%2832830578717%29_%28cropped%29.jpg'),
                    //   ),
                    // ),
                  ),
                  const SizedBox(height: 35),
                  // const SizedBox(height: 32),
                  profileItem(
                    icon: Icons.person,
                    label: 'Username',
                    value: c.user.value!.username ?? '',
                  ),
                  profileItem(
                    icon: Icons.email,
                    label: 'Email',
                    value: c.user.value?.email ?? '',
                  ),
                  profileItem(
                    icon: Icons.phone,
                    label: 'Phone Number',
                    value: c.user.value!.phoneNumber ?? '',
                  ),
                  profileItem(
                    icon: Icons.location_on,
                    label: 'Address',
                    value: c.user.value!.address ?? '',
                  ),
                  profileItem(
                    icon: Icons.account_circle,
                    label: 'Type',
                    value: c.user.value!.type ?? '',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 55,
            width: Get.width,
            child: ElevatedButton.icon(
              onPressed: () {
                Get.to(() => EditUserProfilePage(
                      username: c.user.value!.username ?? '',
                      email: c.user.value!.email ?? '',
                      address: c.user.value!.address ?? '',
                      phoneNumber: c.user.value!.phoneNumber ?? '',
                    ));
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.deepOrangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                shadowColor: Colors.grey,
                elevation: 5,
              ),
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              label: const Text(
                'Edit Profile',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget profileItem(
    {required IconData icon, required String label, required String value}) {
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
        Column(
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
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
