import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CompliantStatusProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<String> selectedStatusList = List.generate(10000, (index) => "");
  String selectedValue = "";

  selectStatus(BuildContext context, int index) async {
    String selectedStatus = selectedStatusList[index];
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('Unsolved'),
                leading: Radio(
                  value: 'Unsolved',
                  groupValue: selectedStatus,
                  onChanged: (value) {
                    selectedStatusList[index] = value!;


                    Navigator.of(context).pop(selectedStatusList[index]);
                    notifyListeners(); // Notify listeners here
                  },
                ),
              ),
              ListTile(
                title: Text('Progress'),
                leading: Radio(
                  value: 'Progress',
                  groupValue: selectedStatus,
                  onChanged: (value) {
                    selectedStatusList[index] = value!;

                    Navigator.of(context).pop(selectedStatusList[index] );
                    notifyListeners(); // Notify listeners here
                  },
                ),
              ),
              ListTile(
                title: Text('Completed'),
                leading: Radio(
                  value: 'Completed',
                  groupValue: selectedStatus,
                  onChanged: (value) {
                    selectedStatusList[index] = value!;

                    Navigator.of(context).pop(selectedStatusList[index]);
                    notifyListeners(); // Notify listeners here
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Future<void> sendComplaintStatus(BuildContext context,
      String reviewGrade,
      String reviewMessage,
      String userId,
      String username,
      String client_code,
      String status) async {
    await _firestore.collection('appfeedback').add({
      'grade': reviewGrade,
      'message': reviewMessage,
      'userId': userId,
      'username':username,
      'client_code':client_code,
      'status':status
    }).whenComplete(() {
      print("Feedback data added successfully");
     
    });
  }

}
