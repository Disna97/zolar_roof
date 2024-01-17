import 'package:shared_preferences/shared_preferences.dart';
import 'package:zolar_roof/constants/constants.dart';
class SharedPref{
  Future<void> saveLoggedInState(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Constants.loggedInKey, isLoggedIn);
  }
  Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(Constants.loggedInKey) ?? false;
  }

}