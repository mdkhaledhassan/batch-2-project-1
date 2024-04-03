import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/api-list.dart';
import 'package:project_1/controllers/profile_controller.dart';
import 'package:project_1/login_page.dart';
import 'package:project_1/main.dart';

class HomePage extends StatelessWidget {
 HomePage({super.key});

  ProfileController profileController = Get.put(ProfileController());

  String userId= box.read('userID').toString();

  @override
  Widget build(BuildContext context) {
    profileController.getProfile(userId: userId);
    return Scaffold(
      body: Center(
        child: Obx(
          ()=> Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('${ApiList.imageUrl}userpic/${profileController.profileModel.value.data?.userpic}'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(profileController.profileModel.value.data?.name.toString() ?? ''),
              SizedBox(
                height: 20,
              ),
              Text(profileController.profileModel.value.data?.phonenumber.toString() ?? ''),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                box.remove('token');
                Get.offAll(()=> LoginScreen());
              }, child: Icon(Icons.logout))
            ],
          ),
        ),
      ),
    );
  }
}