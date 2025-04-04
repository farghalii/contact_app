import 'dart:io';

import 'package:contact_app/core/models/contacts.dart';
import 'package:contact_app/core/utils/appcolors.dart';
import 'package:contact_app/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? selectedImage;
  List<Contacts> contacts = [];

  addContact(String username, String email, String phone_number) {
    if (contacts.length < 6) {
      contacts.add(Contacts(
          username: username, email: email, phone_number: phone_number));
      setState(() {});
    }
  }

  removeContact(int index) {
    if (contacts.length > 0) {
      contacts.removeAt(index);
      setState(() {});
    }
  }

  removeLast() {
    if (contacts.isNotEmpty) {
      contacts.removeLast();
      setState(() {});
    }
  }

  displayBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Appcolors.background,
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setModalState) {
              return Container(
                height: MediaQuery.of(context).size.height * .6,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Column(
                    children: [
                      Row(
                        spacing: 10,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Appcolors.gold,
                              ),
                            ),
                            height: MediaQuery.of(context).size.height * .2,
                            width: MediaQuery.of(context).size.height * .2,
                            child: GestureDetector(
                              onTap: () async {
                                final pickedImage = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (pickedImage != null) {
                                  setState(() {
                                    selectedImage = File(pickedImage.path);
                                  });
                                  setModalState(() {});
                                }
                              },
                              child: selectedImage == null
                                  ? Lottie.asset(
                                      'assets/images/image_picker.json')
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.file(
                                        selectedImage!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                UserInfo(hint: 'User Name'),
                                UserInfo(hint: 'example@email.com'),
                                UserInfo(hint: '+200000000000'),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          contacts.isNotEmpty
              ? FloatingActionButton(
                  onPressed: () {
                    removeLast();
                    setState(() {});
                  },
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 10,
          ),
          contacts.length < 6
              ? FloatingActionButton(
                  onPressed: () {
                    displayBottomSheet(context);
                  },
                  backgroundColor: Appcolors.gold,
                  child: Icon(
                    Icons.add,
                    color: Appcolors.background,
                  ),
                )
              : SizedBox(),
        ],
      ),
      backgroundColor: Appcolors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image(
          width: MediaQuery.of(context).size.width * .3,
          image: AssetImage('assets/images/appbarimage.png'),
        ),
      ),
      body: contacts.isEmpty
          ? Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Lottie.asset('assets/images/empty_list.json',
                      width: MediaQuery.of(context).size.height * .4),
                  Text(
                    'There is No Contacts Added Here',
                    style: TextStyle(
                      color: Appcolors.gold,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
          : Text('lsadlakhd'),
    );
  }
}
