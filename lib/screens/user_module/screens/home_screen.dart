import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/provider/userprovider/login_provider.dart';
import 'package:zolar_roof/resources/drawable_resoruces.dart';
class HomeScreen extends StatefulWidget {


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageUrls = [
    DrawableResource.swiper2,
    DrawableResource.swiper3,
    DrawableResource.logoimage,

  ];
  DocumentSnapshot? userSnapshot;

  firbasevalue()async {
     userSnapshot = await FirebaseFirestore.instance.collection('users').doc(context.read<LoginProvider>().userId).get();

    return userSnapshot;
  }
@override
  void initState() {
    // TODO: implement initState
  firbasevalue();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              height: 200,
              width: Constants.setWidth(context),
              child: CarouselSlider(
                  options: CarouselOptions(
                  height: 200.0,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 500),
                  viewportFraction: 0.8,
                ),
                items: imageUrls.map((imageUrl) {
                  return Container(
                    color: Colors.red,
                   child: Image.asset(imageUrl,fit: BoxFit.cover,),
                  );
                }).toList(),
              ),
            ),
            Container(
              height: 700,
              child: DefaultTabController(
                length: 7,
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    bottom: TabBar(
                      isScrollable: true,
                      tabs: [
                        Tab(text: 'Customer Basic Information'),
                        Tab(text: 'Solar Power Plant Details'),
                        Tab(text: 'Monitoring Remote Details'),
                        Tab(text: 'KSEB Details'),
                        Tab(text: 'Wheeling Details'),
                        Tab(text: 'Subsidy Details'),
                        Tab(text: ''),
                      ],
                    ),
                  ),
                  body: FutureBuilder(
                    future: firbasevalue(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return TabBarView(
                          children: [
                            _customerBasicInformation(),
                            _solarPowerPlantDetails(),
                            _monitoringRemoteDetails(),
                            _ksebDetails(),
                            _wheelingDetails(),
                            _subsidyDetails(),
                            Text(""),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildTextRow(String label, String value) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '$label',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(":"),
        ), Expanded(
          flex: 3,
          child: Text(value),
        ),
      ],
    );
  }
  _silderWidget(){
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: imageUrls.map((imageUrl) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );

  }

  _customerBasicInformation(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          buildTextRow("Customer Name",userSnapshot!['name'] ?? ""),
                  SizedBox(height: 10,),
                  buildTextRow("Customer Code", userSnapshot!['client_code'] ?? ""),
                  SizedBox(height: 10,),
                  buildTextRow("User EmailId", userSnapshot!['username'] ?? ""),
                  SizedBox(height: 10,),
          buildTextRow("Mobile Number", userSnapshot!['mobileNumber'].toString() ?? ""),
          SizedBox(height: 10,),
          buildTextRow("Customer Address", userSnapshot!['customerAddress']?? ""),
          SizedBox(height: 10,),


        ],
      ),
    );
  }
  _solarPowerPlantDetails(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
           buildTextRow("Pv Plant Address",userSnapshot!['pv_plant_address'] ?? ""),
                  SizedBox(height: 10,),
                  buildTextRow("GPS Location", userSnapshot!['gps_location'] ?? ""),
                  SizedBox(height: 10,),
                  buildTextRow("Solar Power Plant ID", userSnapshot!['solar_plant_id'] ?? ""),
                  SizedBox(height: 10,),
          buildTextRow("Plant Capacity", userSnapshot!['plant_capacity'].toString() ?? ""),
          SizedBox(height: 10,),
          buildTextRow("Inverter Make & Model", userSnapshot!['inverter_making']?? ""),

          SizedBox(height: 10,),
          buildTextRow("Inverter Serial Number", userSnapshot!['inverter_serial_number']?? ""),
          SizedBox(height: 10,),
          buildTextRow("Solar Panel Brand & Model", userSnapshot!['pv_modues_making']?? ""),
          SizedBox(height: 10,),
          buildTextRow("PV Capacity(DC Side/ Panel)", userSnapshot!['pv_module_capacity']?? ""),
          SizedBox(height: 10,),

          buildTextRow("PV Modules Serial No:", userSnapshot!['pv_module_serial_number']?? ""),
          SizedBox(height: 10,),


        ],
      ),
    );
  }
  _monitoringRemoteDetails(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          buildTextRow("Data Logger Serial Number",userSnapshot!['data_logger_serial_number'] ?? ""),
          SizedBox(height: 10,),
          buildTextRow("Data Logger Chl Digits",userSnapshot!['data_logger_check_digits'] ?? ""),
          SizedBox(height: 10,),
          buildTextRow("RM Portal Name",userSnapshot!['rm_portal_number'] ?? ""),
          SizedBox(height: 10,),
          buildTextRow("Customer's RM Mobile App",userSnapshot!['customer_rm_mobile_app'] ?? ""),
          SizedBox(height: 10,),
          buildTextRow("Portal/App(Username)",userSnapshot!['portal_app_username'] ?? ""),
          SizedBox(height: 10,),
          buildTextRow("Portal/App(Password)",userSnapshot!['portal_app_passworb'] ?? ""),
        ],
      ),
    );
  }
  _ksebDetails(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          buildTextRow("KSEB Consumer Number",userSnapshot!['kseb_customer_number'] ?? ""),
          SizedBox(height: 10,),
          buildTextRow("KSEB Section Office",userSnapshot!['kseb_section_office'] ?? ""),
          SizedBox(height: 10,),
          buildTextRow("Last Connected Load",userSnapshot!['last_connected_load'] ?? ""),
          SizedBox(height: 10,),
          buildTextRow("Phase of KSEB Connection",userSnapshot!['phase_of_kseb_connection'] ?? ""),
          SizedBox(height: 10,),
          buildTextRow("Transformer",userSnapshot!['transformer'] ?? ""),
          SizedBox(height: 10,),
          buildTextRow("Pole Number",userSnapshot!['pole_number'] ?? ""),


        ],
      ),
    );

  }
  _wheelingDetails(){
    return Padding( padding: const EdgeInsets.all(10.0),
    child: Column(
      children: [
        buildTextRow("Is wheeling opted",userSnapshot!['is_wheel_opted'] ?? ""),
        SizedBox(height: 10,),
        buildTextRow("Wheeled Consumer Number/s",userSnapshot!['wheeled_consumer_number'] ?? ""),
        SizedBox(height: 10,),
        buildTextRow("Wheeled Section",userSnapshot!['wheeled_section'] ?? ""),

      ],
    ),);
  }
  _subsidyDetails(){
    return Padding( padding: const EdgeInsets.all(10.0),child: Column(
      children: [
        buildTextRow("Is this aSubsidy Project",userSnapshot!['is_this_a_subsidy_project'] ?? ""),
        SizedBox(height: 10,),
        buildTextRow("Eligible Subsidy Capacity",userSnapshot!['is_edible_capacity'] ?? ""),
        SizedBox(height: 10,),
        buildTextRow("Subsidy Amount",userSnapshot!['subsidy_amount'] ?? ""),
        SizedBox(height: 10,),
        buildTextRow("Subsidy Relase Date",userSnapshot!['subsidy_release_data'] ?? ""),

      ],
    ),);
  }
}
