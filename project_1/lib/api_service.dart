import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/api-list.dart';
import 'package:project_1/home_page.dart';
import 'package:project_1/main.dart';

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
}