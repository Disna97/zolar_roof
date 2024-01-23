import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SolarCalculatorScreen extends StatefulWidget {
  @override
  _SolarCalculatorScreenState createState() => _SolarCalculatorScreenState();
}

class _SolarCalculatorScreenState extends State<SolarCalculatorScreen> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  double estimatedSolarProduction = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solar Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _fbKey,
          child: Column(
            children: [
              TextField(
                name: 'location',
                decoration: InputDecoration(labelText: 'Location'),
                validator: FormBuilderValidators.required(context),
              ),
              TextField(
                name: 'energyConsumption',
                decoration: InputDecoration(labelText: 'Energy Consumption (kWh)'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.numeric(context),
                ]),
              ),
              TextField(
                name: 'roofSize',
                decoration: InputDecoration(labelText: 'Roof Size (m²)'),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(context),
                  FormBuilderValidators.numeric(context),
                ]),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_fbKey.currentState!.saveAndValidate()) {
                    calculateSolarProduction();
                  }
                },
                child: Text('Calculate'),
              ),
              SizedBox(height: 20),
              Text('Estimated Solar Production: $estimatedSolarProduction kWh'),
            ],
          ),
        ),
      ),
    );
  }

  void calculateSolarProduction() {
    double locationFactor = 1.2; // Adjust based on location
    double energyConsumption = double.parse(_fbKey.currentState!.fields['energyConsumption']!.value.toString());
    double roofSize = double.parse(_fbKey.currentState!.fields['roofSize']!.value.toString());

    // Perform calculation (replace this with your own calculation logic)
    estimatedSolarProduction = (energyConsumption / roofSize) * locationFactor;

    setState(() {});
  }
}