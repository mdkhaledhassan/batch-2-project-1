import 'package:get/get.dart';
import 'package:project_1/api_service.dart';

import '../models/privacy_policy_model.dart';

class InfoController extends GetxController{
  final privacyPolicyModel = PrivacyPolicyModel().obs;

  getPrivacyPolicy() async {
    var infoData = await ApiService().getPrivacyPolicy();

    privacyPolicyModel.value = infoData!;

    refresh();
  }

  @override
  void onInit() {
    getPrivacyPolicy();
    super.onInit();
  }
}