import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zolar_roof/provider/admin_provider/compliant_status_provider.dart';
import 'package:zolar_roof/provider/admin_provider/quation_provider.dart';
import 'package:zolar_roof/provider/admin_provider/signin_provider.dart';
import 'package:zolar_roof/provider/userprovider/compliant_provider.dart';
import 'package:zolar_roof/provider/userprovider/login_provider.dart';
import 'package:zolar_roof/provider/userprovider/service_provider.dart';
import 'package:zolar_roof/screens/select_type_screen.dart';
import 'package:zolar_roof/screens/user_module/screens/login_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:const FirebaseOptions(apiKey: "AIzaSyDs7Ef83EiKJxOlJtS1H4NZ2zSdPpQN9gw",
      appId: "1:331103619229:android:927c7238170eaecbe56c74",
      messagingSenderId: "331103619229",
      projectId: "zolar-roof-6f718") );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignInProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => ComplaintViewModel()),
        ChangeNotifierProvider(create: (context) => CompliantStatusProvider()),
        ChangeNotifierProvider(create: (context) => ServiceProvider()),
        ChangeNotifierProvider(create: (context) => QuationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  SelectTypeScreen()
      ),
    );
  }
}


