import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/appfeedback_model.dart';
import '../../resources/color_resources.dart';
import '../../resources/style_resource.dart';
import 'login_provider.dart';

class ComplaintViewModel extends ChangeNotifier{
  int selectedIndexs = 0;
  String? reviewGrade = "";
  bool? submitButtonCompleted = false;
  List<String> selectedStatusList = List.generate(10000, (index) => "");
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final TextEditingController reviewMessageController = TextEditingController();

  selectedIndex(int index) {
    selectedIndexs = index;

    switch (selectedIndexs) {
      case 0:
        reviewGrade = 'Inverter Fault';
        break;
      case 1:
        reviewGrade = 'Panel Fault';
        break;
      case 2:
        reviewGrade = 'KSEB Related';
        break;
      case 3:
        reviewGrade = 'Electrical Failure/ Hazards';
      case 4:
        reviewGrade = "Billing Related";
      case 5 :
        reviewGrade = "Others";
        break;
      default:
        reviewGrade = 'Unknown';
    }

    print('Review Grade: $reviewGrade');

    print("selectedIndexs" + selectedIndexs.toString());
    notifyListeners();
  }




  Future<void> sendAppFeedbackData(BuildContext context,
      String reviewGrade,
      String reviewMessage,
      String userId,
      String username,
      String client_code,
      String status) async {
    await _firestore.collection('appfeedback').add({
      'reviewGrade': reviewGrade,
      'reviewMessage': reviewMessage,
      'userId': userId,
      'username':username,
      'client_code':client_code,
      'status':"yyyy"
    }).whenComplete(() {
      print("Feedback data added successfully");
      _showDialog(context, reviewGrade);
    });
  }
  Stream<List<AppFeedback>> getAppFeedbackStream() {
    return FirebaseFirestore.instance.collection('appfeedback').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AppFeedback(
          reviewGrade: doc['reviewGrade'] ?? '',
          reviewMessage: doc['reviewMessage'] ?? '',
          userId: doc['userId'] ?? '',
          userName: doc['username'] ??'',
          clentCode: doc['client_code'] ??'',
          status: doc['status'] ??'',

        );
      }).toList();
    });
  }

  _showDialog(context, String reviewGrade) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (
              context,
              setState,
              ) {
            return WillPopScope(
              onWillPop: () async {
                return false;
              },
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                child: Container(
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                reviewGrade == "Poor"
                                    ? "Sorry for your inconvenience"
                                    : "Thanks for your valuable feedback",
                                style: StyleResource.smallBlackNormalTextStyle1(context)
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 12.0, top: 10, bottom: 15),
                          child: Text(
                            reviewGrade == "Poor"
                                ? "Will check your feedback and update you soon"
                                : "We're glad you enjoyed our product, and we appreciate your response.",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 41.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(colors: [
                                        ColorResource.orange_color,
                                        ColorResource.red_color
                                      ]),
                                      color: ColorResource.redTextColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("OK",
                                        style: TextStyle(
                                            color:
                                            ColorResource.whiteTextColor)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}