import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/utils/utils.dart';

class ServiceProvider extends ChangeNotifier{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendServiceData(BuildContext context,
      String comment,
      String date,
      String userId,
      String username,
      String time,
     ) async {
    await _firestore.collection('request_panel_wash').add({
     'date':date,
      'time':time,
      'comment':comment,
      'userId': userId,
      'username':username,

    }).whenComplete(() {
      print("Serivce Request added successfully");
      Constants.showLoginErrorToast("Serivce Request added successfully");

    });
  }
  Future<void> sendGeneralServiceData(BuildContext context,
      String comment,
      String date,
      String userId,
      String username,
      String time,
     ) async {
    await _firestore.collection('request_general').add({
     'date':date,
      'time':time,
      'comment':comment,
      'user_id': userId,
      'user_name':username,

    }).whenComplete(() {
      print("General Serivce Request added successfully");
      Constants.showLoginErrorToast("Serivce Request added successfully");

    });
  }
}