import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_1/api_service.dart';
import 'package:project_1/home_page.dart';
import 'package:project_1/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: CircularProgressIndicator(),
      blur: 1,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              TextFormField(
                controller: phoneController,
              ),
              TextFormField(
                controller: password,
              ),
      
              ElevatedButton(onPressed: () async {

                setState(() {
                  isLoading = true;
                });
                var response  = await ApiService().login(phonenumber: phoneController.text, password: password.text);


                if(response.statusCode == 200)
                {
                  setState(() {
                  isLoading = false;
                });
                  box.write('token', response.data['token']);
                  Get.snackbar('Success', '${response.data['message']}',backgroundColor: Colors.green);
                  Get.to(()=> HomePage());
                }
                else
                {
                  setState(() {
                  isLoading = false;
                });
                Get.snackbar('Error', '${response.data['message']}',backgroundColor: Colors.red);
                }
              }, child: Icon(Icons.login))
            ],
          ),
        ),
      ),
    );
  }
}