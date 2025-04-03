import 'package:contact_app/core/utils/appcolors.dart';
import 'package:contact_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
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

class HomeScreen extends StatelessWidget {
  displayBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Appcolors.background,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * .6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
                        child: Lottie.asset('assets/images/image_picker.json'),
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
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          displayBottomSheet(context);
        },
        backgroundColor: Appcolors.gold,
        child: Icon(
          Icons.add,
          color: Appcolors.background,
        ),
      ),
      backgroundColor: Appcolors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image(
          width: MediaQuery.of(context).size.width * .3,
          image: AssetImage('assets/images/appbarimage.png'),
        ),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
