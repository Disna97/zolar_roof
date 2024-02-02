import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class QuationProvider extends ChangeNotifier{
  TextEditingController kwhEnergy = TextEditingController();
  TextEditingController  username= TextEditingController();
  TextEditingController  phoneNumber= TextEditingController();
  TextEditingController  emailid= TextEditingController();
  TextEditingController  totalAmount= TextEditingController();
  TextEditingController  energyProduced= TextEditingController();
  TextEditingController solarTYpe = TextEditingController();
  TextEditingController  dailyUsedLimit= TextEditingController();
  TextEditingController solarEnergyForKseb = TextEditingController();
  TextEditingController  susidyAmount= TextEditingController();
  TextEditingController  subsidyCapacity= TextEditingController();
  intilaze(BuildContext context){
    kwhEnergy.clear();
    username.clear();
    phoneNumber.clear();
    emailid.clear();
    totalAmount.clear();
    energyProduced.clear();
    solarTYpe.clear();
    dailyUsedLimit.clear();
    solarEnergyForKseb.clear();
    susidyAmount.clear();
    subsidyCapacity.clear();
  }
}