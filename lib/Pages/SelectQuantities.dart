import 'package:flutter/material.dart';

import 'Home.dart';


class SelectQuantities extends StatefulWidget {
  const SelectQuantities({super.key});

  @override
  _SelectQuatitiesState createState() => _SelectQuatitiesState();
}

class _SelectQuatitiesState extends State<SelectQuantities> {
  List<String> type = [
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Temperature',
  ];
  List<String> type2 = ['Speed', 'Data', 'Time','Frequency'];

  Map<String, dynamic> MaterialDimensions = {
    '0': ['mm', 'cm', 'm', 'km', 'in', 'ft', 'yd', 'mi'], //Length
    '1': ['mm²', 'cm²', 'm²', 'ha', 'km²', 'in²', 'ft²', 'yd²'], //Area
    '2': ['mm³', 'cm³', 'ml', 'l', 'm³', 'in³', 'ft³', 'yd³'], //Volume
    '3': ['mg', 'g', 'kg', 't', 'oz', 'lb', 'st', 'ton'], //Mass
    '4': ['°C', '°F', 'K'], //Temperature
  };

  Map<String, dynamic> AbstractDimensions = {
    '0': ['mm/s', 'm/s', 'km/h', 'in/s', 'ft/s', 'yd/s', 'mph'], //Speed
    '1': ['b', 'B', 'kb', 'kB', 'Mb', 'MB', 'Gb', 'GB'], //Date
    '2': ['ns', 'µs', 'ms', 's', 'min', 'h', 'd', 'wk'], //Time
    '3': ['Hz', 'kHz', 'MHz', 'GHz'], //Frequency
  };

  Map<String, String> fromtoM = {
    '0': 'cm',
    '1': 'cm²',
    '2': 'cm³',
    '3': 'kg',
    '4': '°C',
  };

  Map<String, String> fromtoA = {'0': 'km/h', '1': 'MB', '2': 's', '3': 'Hz'};
  List<String> fromM = ['mm', 'cm', 'm', 'km', 'in', 'ft', 'yd', 'mi'];
  List<String> fromA = ['mm/s', 'm/s', 'km/h', 'in/s', 'ft/s', 'yd/s', 'mph'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Select Quatities Type')),
        backgroundColor: const Color(0xFF113953),
      ),
      backgroundColor: const Color(0xFF113953),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              width: 300,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home(quantities: MaterialDimensions, types: type, from: fromM, fromto: fromtoM, vfrom: 'cm',vto: 'cm', categorie: 'Material',)));
                },
                child: Text('Material Dimensions Quantities'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              height: 75,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home(quantities: AbstractDimensions, types: type2, from: fromA, fromto: fromtoA, vfrom: 'km/h',vto: 'km/h', categorie: 'Abstract',)));
                },
                child: Text('Abstract Dimensions Quantities'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
