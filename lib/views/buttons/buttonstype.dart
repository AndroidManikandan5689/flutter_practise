import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

const List<String> countryList = <String>[
  'India',
  'USA',
  'China',
  'Canada',
  'Dubai'
];

Object dropdownvalue = 'India';

class ButtonsList extends StatefulWidget {
  const ButtonsList({super.key});

  @override
  State<ButtonsList> createState() => _ButtonsListState();
}

class _ButtonsListState extends State<ButtonsList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buttons"),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.amber[600],
                width: 200,
                height: 50,
                child: TextButton(
                    onPressed: () {}, child: const Text("Flat/Text Button")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Raised/Elivated Button")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                    onPressed: () {},
                    child: Icon(Icons.add),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.amber),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                    onPressed: () {},
                    child: const Text(
                      "Outline Button",
                      style: TextStyle(color: Colors.blue),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                  color: const Color(0xFFFF00FF),
                ),
              ),
              dropdownWidget()

              //POPUP Menu
            ],
          ),
        ),
      ),
    );
  }

  DropdownButton<Object> dropdownWidget() {
    return DropdownButton(
      focusColor: Colors.white,
      icon: const Icon(Icons.keyboard),
      dropdownColor: Colors.amber,
      // value: dropdownvalue,
      items: countryList.map((String country) {
        return DropdownMenuItem(
            value: countryList[0],
            child: Text(
              country,
              style: const TextStyle(color: Colors.black),
            ));
      }).toList(),
      onChanged: (selectedValue) {
        setState(() {
        dropdownvalue = selectedValue!;
        });
      },
    );
  }
}

class DropdownEx extends StatefulWidget {
  const DropdownEx({super.key});

  @override
  State<DropdownEx> createState() => _DropdownExState();
}

class _DropdownExState extends State<DropdownEx> {
  String dropdownValue = countryList.first;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: countryList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
