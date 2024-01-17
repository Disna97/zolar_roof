import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/appfeedback_model.dart';
import '../../provider/admin_provider/compliant_status_provider.dart';
import '../../provider/userprovider/compliant_provider.dart';
import '../../resources/color_resources.dart';


class ServiceListPage extends StatefulWidget {
  @override
  State<ServiceListPage> createState() => _ServiceListPageState();
}
class _ServiceListPageState extends State<ServiceListPage> {
  List<String> selectedStatusList = List.generate(10000, (index) => "");
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<AppFeedback>>(
      stream: context.read<ComplaintViewModel>().getAppFeedbackStream(),
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
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: (){
                                setState(() {
                                  context.read<CompliantStatusProvider>().selectStatus(context, index);
                                });
                                Future.delayed(Duration(seconds: 2),(){
                                  setState(() {});
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    gradient:    const LinearGradient(colors: [
                                      ColorResource.orange_color,
                                      ColorResource.red_color
                                    ]),
                                    color: ColorResource.redTextColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text("Set Status",style: TextStyle(color: Colors.white),),
                                ),
                              ),
                            ),
                            Text(context.read<CompliantStatusProvider>().selectedStatusList[index]),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                onTap: (){

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      gradient:    const LinearGradient(colors: [
                                        ColorResource.orange_color,
                                        ColorResource.red_color
                                      ]),
                                      color: ColorResource.redTextColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text("Update Status",style: TextStyle(color: Colors.white),),
                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),

                      // Add more Text widgets for additional feedback properties if needed
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
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



