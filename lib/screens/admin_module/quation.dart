import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/provider/admin_provider/quation_provider.dart';
import 'package:zolar_roof/screens/user_module/screens/print_screen.dart';
import 'package:zolar_roof/utils/utils.dart';

import '../../provider/admin_provider/print_screen.dart';
import '../../resources/color_resources.dart';
import '../../resources/style_resource.dart';

class QuatationScreen extends StatelessWidget {
  const QuatationScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: Consumer<QuationProvider>(
          builder: (context,data,_) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Constants.textFormFeildsDesign(context,data.emailid,"EmailId",Icons.email),
                  const SizedBox(
                    height: 10,
                  ),

                  Constants.textFormFeildsDesign(context,data.username,"UserName",Icons.account_box_outlined),
                  const SizedBox(
                    height: 10,
                  ),

                  Constants.textFormFeildsDesign(context,data.phoneNumber,"Phone Number",Icons.phone),
                  const SizedBox(
                    height: 10,
                  ),



                  Constants.textFormFeildsDesign(context,data.kwhEnergy,"KWH Energy",Icons.energy_savings_leaf),
                  const SizedBox(
                    height: 10,
                  ),

                  Constants.textFormFeildsDesign(context,data.dailyUsedLimit,"Dail Used Limit",Icons.ac_unit),
                  const SizedBox(
                    height: 10,
                  ),

                  Constants.textFormFeildsDesign(context,data.energyProduced,"Energy Produced",Icons.e_mobiledata),
                  const SizedBox(
                    height: 10,
                  ),

                  Constants.textFormFeildsDesign(context,data.solarEnergyForKseb,"Solar Energy For Kseb",Icons.solar_power),
                  const SizedBox(
                    height: 10,
                  ),

                  Constants.textFormFeildsDesign(context,data.solarTYpe,"Solar Type",Icons.solar_power_outlined),
                  const SizedBox(
                    height: 10,
                  ),

                  Constants.textFormFeildsDesign(context,data.subsidyCapacity,"Solar Capacity",Icons.solar_power_sharp),
                  const SizedBox(
                    height: 10,
                  ),

                  Constants.textFormFeildsDesign(context,data.subsidyCapacity,"Subsidy Capacity",Icons.reduce_capacity),
                  const SizedBox(
                    height: 10,
                  ),

                  Constants.textFormFeildsDesign(context,data.susidyAmount,"Subsidy Amount",Icons.price_change),
                  const SizedBox(
                    height: 10,
                  ),

                  Constants.textFormFeildsDesign(context,data.totalAmount,"Total Amount",Icons.price_check),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(padding: const EdgeInsets.only(left: 25,right: 25,),child: Constants.buttonDesign(context, "Print", (){
                    Utils.navigateTo(context, QuotationSummaryScreen());

                  }),)
                ],
              ),


            );
          }
        ),
      ),
    );
  }

}
