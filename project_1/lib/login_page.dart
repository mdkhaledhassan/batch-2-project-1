import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_1/controllers/auth_controller.dart';
import 'package:project_1/register_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> ModalProgressHUD(
        inAsyncCall: authController.isLoading.value,
        progressIndicator: CircularProgressIndicator(),
        blur: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Login'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  TextFormField(
                    controller: authController.phoneController,
                  ),
                  TextFormField(
                    controller: authController.passwordController,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                    
                  ElevatedButton(onPressed: () async {
                    authController.login(phone: authController.phoneController.text, password: authController.passwordController.text);
                  }, child: Icon(Icons.login)),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(()=> RegisterScreen());
                    },
                    child: Text('Register'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}