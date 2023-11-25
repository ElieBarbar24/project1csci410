import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
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

    String valueout = '0';
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
        ],
      ),
    );
  }
}
