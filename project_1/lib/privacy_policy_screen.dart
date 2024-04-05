import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:project_1/controllers/info_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});

  InfoController infoController = Get.put(InfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Obx(
      ()=> SingleChildScrollView(
        child: Column(
            children: [
              Html(
                data: """ ${infoController.privacyPolicyModel.value.data.toString()} """,
              )
            ],
          ),
      ),
      ),
    );
  }
}