import 'package:at_project/Screen/Authentication/firebase%20functions/functions.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String email = '';
  String phone = '';
  String imgUrl = '';
  String gender = '';
  List<Map<String, dynamic>> listedItem = [];

  void printUserDataForCurrentUser() async {
    Map<String, dynamic>? userData = await fetchUserDataForCurrentUser();
    if (userData != null) {
      setState(() {
        name = userData['name'];
        email = userData['emailAddress'];
        phone = userData['phoneNo'];
        imgUrl = userData['imgUrl'];
        gender = userData['gender'];
        listedItem =
            List<Map<String, dynamic>>.from(userData['listedItem'] ?? []);
      });
    } else {
      print('Unable to fetch user data for the currently logged-in user.');
    }
  }

  @override
  void initState() {
    printUserDataForCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              userSignOut(context: context);
            },
            icon: const Icon(Icons.logout_rounded),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 90,
                    backgroundImage: NetworkImage(
                      imgUrl.isNotEmpty
                          ? imgUrl
                          : 'https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildDisabledTextField('Name', name),
                  const SizedBox(height: 15),
                  buildDisabledTextField('Gender', gender),
                  const SizedBox(height: 15),
                  buildDisabledTextField('Phone Number', '+91 $phone'),
                  const SizedBox(height: 15),
                  buildDisabledTextField('Email', email),
                  const SizedBox(height: 15),
                  if (listedItem.isEmpty)
                    const Text('No Products Listed By You',
                        style: TextStyle(fontSize: 20)),
                  if (listedItem.isNotEmpty)
                    Column(
                      children: [
                        const Text('Products Listed By You',
                            style: TextStyle(fontSize: 20)),
                        const SizedBox(height: 15),
                        ...List.generate(listedItem.length, (index) {
                          return Container(
                            color: Colors.grey[100],
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.all(3),
                            child: Text(
                              listedItem[index]['itemName'],
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        }),
                      ],
                    ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDisabledTextField(String label, dynamic value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
            controller: TextEditingController(text: value.toString()),
            readOnly: true,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(fontSize: 18),
              hintText: 'Enter $label',
              border: const OutlineInputBorder(),
            ),
            style: const TextStyle(
              fontSize: 18,
            )),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
