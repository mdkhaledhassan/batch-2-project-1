import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/api-list.dart';
import 'package:project_1/home_page.dart';
import 'package:project_1/main.dart';
import 'package:project_1/models/profile_model.dart';

import 'models/privacy_policy_model.dart';

class ApiService{
  login({required String phonenumber,required String password}) async {
    try{
      var response = await Dio().post(
        ApiList.login,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
        data: {
          'phonenumber' : phonenumber,
          'password' : password
        }
      );

      return response;
    }catch(e){
      print(e);
    }
  }

  register({required String name,required String phonenumber,required String password}) async {
    try{
      var response = await Dio().post(
        ApiList.register,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
        data: {
          'name' : name,
          'phonenumber' : phonenumber,
          'password' : password
        }
      );

      return response;
    }catch(e){
      print(e);
    }
  }

  Future<ProfileModel?> getProfile({required String userId})async
  {
    var response;
    try{
    response = await Dio().get(
        ApiList.profile + '$userId',
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if(response.statusCode == 200)
      {
        print(response.data);
        return ProfileModel.fromJson(response.data);
      }
      
    }catch(e){
      print(e);
    }

    return ProfileModel.fromJson(response.data);

  }

  Future<PrivacyPolicyModel?> getPrivacyPolicy()async
  {
    var response;
    try{
    response = await Dio().get(
        ApiList.privacyPolicy,
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "Access-Control-Allow-Origin": "*",
          },
          validateStatus: (status) {
            return status! < 500;
          },
        ),
      );
      if(response.statusCode == 200)
      {
        print('privacy policy${response.data}');
        return PrivacyPolicyModel.fromJson(response.data);
      }
      
    }catch(e){
      print(e);
    }

    return PrivacyPolicyModel.fromJson(response.data);

  }
}