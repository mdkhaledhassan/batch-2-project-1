import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:project_1/api_service.dart';
import 'package:project_1/home_page.dart';
import 'package:project_1/main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
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
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center ,
              children: [
                TextFormField(
                  controller: nameController,
                ),
                TextFormField(
                  controller: phoneController,
                ),
                TextFormField(
                  controller: password,
                ),
                SizedBox(
                            height: 20,
                          ),
                ElevatedButton(onPressed: () async {
            
                  setState(() {
                    isLoading = true;
                  });
                  var response  = await ApiService().register(name: nameController.text,phonenumber: phoneController.text, password: password.text);
            
            
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
                }, child: Icon(Icons.app_registration_rounded)),
                SizedBox(
                    height: 20,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}