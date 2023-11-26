import 'package:flutter/material.dart';
import 'package:project1csci410/Data.dart';
import 'package:project1csci410/Pages/History.dart';
import 'package:project1csci410/UnitConverter/AreaConverter.dart';
import 'package:project1csci410/UnitConverter/DataConverter.dart';
import 'package:project1csci410/UnitConverter/FrequencyConverter.dart';
import 'package:project1csci410/UnitConverter/LengthConverter.dart';
import 'package:project1csci410/UnitConverter/SpeedConverter.dart';
import 'package:project1csci410/UnitConverter/TemperatureConverter.dart';
import 'package:project1csci410/UnitConverter/TimeConverter.dart';
import 'package:project1csci410/UnitConverter/VolumeConverter.dart';
import 'package:project1csci410/UnitConverter/WeightConverter.dart';

class Home extends StatefulWidget {
  Home(
      {Key? key,
      required this.quantities,
      required this.types,
      required this.from,
      required this.fromto,
      required this.vfrom,
      required this.vto,
      required this.categorie})
      : super(key: key);
  final List<String> types;
  final Map<String, dynamic> quantities;
  final List<String> from;
  final Map<String, String> fromto;
  final String vfrom;
  final String vto;
  final String categorie;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String categorie;
  late List<String> type;
  late Map<String, dynamic> units;
  late List<String> from;
  late Map<String, String> fromto;
  late List<String> to;
  late String vfrom;
  late String vto;
  int listIndex = 0;

  @override
  void initState() {
    type = widget.types;
    units = widget.quantities;
    from = widget.from;
    fromto = widget.fromto;
    to = widget.from;
    vfrom = widget.vfrom;
    vto = widget.vto;
    super.initState();
  }

  String valuein = '0';

  calculate() {
    if (widget.categorie.compareTo('Material') == 0) {
      if (listIndex == 0) {
        double res = double.parse(valuein);
        double answer = LengthConverter(res).convert(vfrom!, vto!);
        valueout = answer.toString();
      } else if (listIndex == 1) {
        double res = double.parse(valuein);
        double answer = AreaConverter(res).convert(vfrom!, vto!);
        valueout = answer.toString();
      } else if (listIndex == 2) {
        double res = double.parse(valuein);
        double answer = VolumeConverter(res).convert(vfrom!, vto!);
        valueout = answer.toString();
      } else if (listIndex == 3) {
        double res = double.parse(valuein);
        double answer = WeightConverter(res).convert(vfrom!, vto!);
        valueout = answer.toString();
      } else if (listIndex == 4) {
        double res = double.parse(valuein);
        double answer = TemperatureConverter(res).convert(vfrom!, vto!);
        valueout = answer.toString();
      }
    } else {
      if (listIndex == 0) {
        double res = double.parse(valuein);
        double answer = SpeedConverter(res).convert(vfrom!, vto!);
        valueout = answer.toString();
      } else if (listIndex == 1) {
        double res = double.parse(valuein);
        double answer = DataConverter(res).convert(vfrom!, vto!);
        valueout = answer.toString();
      } else if (listIndex == 2) {
        double res = double.parse(valuein);
        double answer = TimeConverter(res).convert(vfrom!, vto!);
        valueout = answer.toString();
      } else if (listIndex == 3) {
        double res = double.parse(valuein);
        double answer = FrequencyConverter(res).convert(vfrom!, vto!);
        valueout = answer.toString();
      }
    }
  }

  String valueout = '0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Unit Converter',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: const Color(0xFF113953),
      ),
      backgroundColor: const Color(0xFF113953),
      body: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              for (var i = 0; i < type.length; i++)
                Container(
                  margin: const EdgeInsets.all(2),
                  child: ChoiceChip(
                    label: Text(
                      '${type[i]}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    selected: listIndex == i,
                    onSelected: ((bool selected) {
                      setState(() {
                        if (selected) {
                          listIndex = i;
                          from = units['$i'];
                          to = units['$i'];
                          vfrom = fromto['$i']!;
                          vto = fromto['$i']!;
                          valuein = '0';
                          valueout = '0';
                        }
                      });
                    }),
                    selectedColor: Colors.grey[600],
                    backgroundColor: Colors.black,
                    elevation: 5.0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                  ),
                ),
            ]),
          ),
          const SizedBox(
            height: 25,
          ),
          const Divider(
            color: Colors.white,
            indent: 20,
            endIndent: 20,
            height: 20,
            thickness: 2,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 325,
              margin: const EdgeInsets.only(left: 10),
              child: SelectableText(
                valuein,
                style: const TextStyle(color: Colors.white, fontSize: 40),
                showCursor: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: DropdownButton(
                dropdownColor: Colors.black,
                value: vfrom,
                onChanged: (String? selected) {
                  setState(() {
                    vfrom = selected!;
                    // calculate();
                  });
                },
                items: from.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
              ),
            ),
            const Spacer(
              flex: 10,
            ),
          ]),
          const SizedBox(
            height: 25,
          ),
          const Divider(
            color: Colors.grey,
            indent: 20,
            endIndent: 20,
            height: 10,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 325,
              margin: const EdgeInsets.only(left: 10),
              child: SelectableText(
                valueout,
                style: const TextStyle(color: Colors.white, fontSize: 40),
                showCursor: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: DropdownButton(
                dropdownColor: Colors.black,
                value: vto,
                onChanged: (String? selected) {
                  setState(() {
                    vto = selected!;
                  });
                },
                items: to.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(color: Colors.white)),
                  );
                }).toList(),
              ),
            ),
            const Spacer(
              flex: 10,
            ),
          ]),
          const SizedBox(
            height: 100,
          ),
          Table(
            defaultColumnWidth: const FractionColumnWidth(.23),
            children: [
              TableRow(children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        if (valuein.compareTo('0') == 0) {
                          valuein = '7';
                          calculate();
                        } else {
                          valuein = "${valuein}7";
                          calculate();
                        }
                      });
                    },
                    fillColor: Colors.black,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      '7',
                      style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      if (valuein.compareTo('0') == 0) {
                        valuein = '8';
                        calculate();
                      } else {
                        valuein = "${valuein}8";
                        calculate();
                      }
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    '8',
                    style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      if (valuein.compareTo('0') == 0) {
                        valuein = '9';
                        calculate();
                      } else {
                        valuein = "${valuein}9";
                        calculate();
                      }
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    '9',
                    style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      if (valuein.length == 1) {
                        valuein = '0';
                        calculate();
                        return;
                      } else {
                        valuein = valuein.substring(0, valuein.length - 1);
                        calculate();
                      }
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  child: const Icon(
                    Icons.backspace_outlined,
                    size: 35,
                    color: Color(0xFFBDBDBD),
                  ),
                ),
              ]),
              TableRow(children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        if (valuein.compareTo('0') == 0) {
                          valuein = '4';
                          calculate();
                        } else {
                          valuein = "${valuein}4";
                          calculate();
                        }
                      });
                    },
                    fillColor: Colors.black,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      '4',
                      style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      if (valuein.compareTo('0') == 0) {
                        valuein = '5';
                        calculate();
                      } else {
                        valuein = "${valuein}5";
                        calculate();
                      }
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    '5',
                    style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      if (valuein.compareTo('0') == 0) {
                        valuein = '6';
                        calculate();
                      } else {
                        valuein = "${valuein}6";
                        calculate();
                      }
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    '6',
                    style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      valuein = "0";
                      calculate();
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'C',
                    style: TextStyle(color: Colors.red[500], fontSize: 30),
                  ),
                ),
              ]),
              TableRow(children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: RawMaterialButton(
                    onPressed: () {
                      setState(() {
                        if (valuein.compareTo('0') == 0) {
                          valuein = '1';
                          calculate();
                        } else {
                          valuein = "${valuein}1";
                          calculate();
                        }
                      });
                    },
                    fillColor: Colors.black,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      '1',
                      style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      if (valuein.compareTo('0') == 0) {
                        valuein = '2';
                        calculate();
                      } else {
                        valuein = "${valuein}2";
                        calculate();
                      }
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    '2',
                    style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      if (valuein.compareTo('0') == 0) {
                        valuein = '3';
                        calculate();
                      } else {
                        valuein = "${valuein}3";
                        calculate();
                      }
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    '3',
                    style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      String temp;
                      temp = vfrom!;
                      vfrom = vto;
                      vto = temp;
                      calculate();
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(21.0),
                  child: const Icon(
                    Icons.multiple_stop,
                    size: 25,
                    color: Color(0xFFBDBDBD),
                  ),
                ),
              ]),
              TableRow(children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: RawMaterialButton(
                    onPressed: () {
                      if (valuein.compareTo('0') == 0) return;
                      setState(() {
                        valuein = "${valuein}0";
                        calculate();
                      });
                    },
                    fillColor: Colors.black,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16.0),
                    child: const Text(
                      '0',
                      style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                    ),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    setState(() {
                      valuein = "$valuein.";
                      calculate();
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(16.0),
                  child: const Text(
                    '.',
                    style: TextStyle(color: Color(0xFFBDBDBD), fontSize: 30),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>History()));
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(21.0),
                  child: const Icon(
                    Icons.history,
                    size:25,
                    color:Color(0xFFBDBDBD),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    history.add({
                      "From":'$valuein $vfrom',
                      "To": '$valueout $vto',
                      "Date": '${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}'
                    });
                  },
                  fillColor: Colors.black,
                  shape: const CircleBorder(),
                  padding: EdgeInsets.all(21.0),
                  child: const Icon(
                    Icons.save,
                    size:25,
                    color:Colors.white,
                  ),
                ),
              ])
            ],
          )
        ],
      ),
    );
  }
}
