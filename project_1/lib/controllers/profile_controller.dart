import 'package:get/get.dart';
import 'package:project_1/api_service.dart';
import 'package:project_1/models/profile_model.dart';

class ProfileController extends GetxController{
  final profileModel = ProfileModel().obs;

  getProfile({required String userId}) async {
    var profileData = await ApiService().getProfile(userId: userId);

    profileModel.value = profileData!;

    refresh();
  }
}