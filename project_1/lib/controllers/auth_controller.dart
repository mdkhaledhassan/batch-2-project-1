import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_service.dart';
import '../home_page.dart';
import '../main.dart';

class AuthController extends GetxController{
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final isLoading = false.obs;

  login({required String phone, required String password})async
  {
    isLoading.value = true;
    var response  = await ApiService().login(phonenumber: phone, password: password);
            
      if(response.statusCode == 200)
      {
        isLoading.value = false;
        phoneController.clear();
        passwordController.clear();
        box.write('token', response.data['token']);
        box.write('userID', response.data['data']['id']);
        Get.snackbar('Success', '${response.data['message']}',backgroundColor: Colors.green);
        Get.to(()=> HomePage());
      }
      else
      {
        isLoading.value = false;
      Get.snackbar('Error', '${response.data['message']}',backgroundColor: Colors.red);
      }
  }
}