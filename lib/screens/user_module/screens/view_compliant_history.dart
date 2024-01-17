import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zolar_roof/constants/constants.dart';

import '../../../model/appfeedback_model.dart';
import '../../../provider/userprovider/compliant_provider.dart';
import '../../../provider/userprovider/login_provider.dart';




class ViewCompliantHistory extends StatefulWidget {
  @override
  State<ViewCompliantHistory> createState() => _ViewCompliantHistoryState();
}

class _ViewCompliantHistoryState extends State<ViewCompliantHistory> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<AppFeedback>>(
        stream: context.read<LoginProvider>().getCompliantHistory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final feedbackList = snapshot.data ?? [];


            return ListView.builder(
              itemCount: feedbackList.length,
              itemBuilder: (context, index) {
                final feedback = feedbackList[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Colors.grey, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextRow('User Name', feedback.userName),
                        buildTextRow('Client Code', feedback.clentCode),
                        buildTextRow('Grade', feedback.reviewGrade),
                        buildTextRow('Message', feedback.reviewMessage),



                        // Add more Text widgets for additional feedback properties if needed
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );



  }
  Widget buildTextRow(String label, String value) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$label:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(value),
        ),
      ],
    );
  }

}



