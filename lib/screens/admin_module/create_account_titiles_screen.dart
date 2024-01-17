import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zolar_roof/resources/style_resource.dart';

import '../../resources/color_resources.dart';

class CreateAccountTitles extends StatefulWidget {
  const CreateAccountTitles({super.key});

  @override
  State<CreateAccountTitles> createState() => _CreateAccountTitlesState();
}

class _CreateAccountTitlesState extends State<CreateAccountTitles> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          ContainerDesign(context,"Customer Basic Information"),
          SizedBox(height: 20,),
          ContainerDesign(context,"Solar Power Plant Details"),
          SizedBox(height: 20,),

          ContainerDesign(context," Monitoiring Remote Details"),
          SizedBox(height: 20,),
          ContainerDesign(context,"KSEB Details"),
          SizedBox(height: 20,),
          ContainerDesign(context,"Wheeling Details")

        ],
      ),
    );
  }
   ContainerDesign(BuildContext context,String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                ColorResource.appBarGradientDark,
                ColorResource.mediumBlue,
              ],
            )),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text,style: StyleResource.smallGreyBoldTextStyle(context).copyWith(color: Colors.white),),
            const Icon(Icons.arrow_drop_down_circle,color: Colors.white,size: 15,)
          ],
        ),
      ),
    );

  }
}
