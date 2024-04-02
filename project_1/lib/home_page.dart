import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/login_page.dart';
import 'package:project_1/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home Page'),
            ElevatedButton(onPressed: (){
              box.remove('token');
              Get.offAll(()=> LoginScreen());
            }, child: Icon(Icons.logout))
          ],
        ),
      ),
    );
  }
}