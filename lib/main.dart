import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fssapp/views/demo8/firstPage.dart';
import 'package:fssapp/views/localization/customlocalization.dart';
import 'package:fssapp/views/localization/localization.dart';
import 'models/Users.dart';

int a = 10;
Random random = Random();
// void main() => runApp(const FirstPage());

//Demo 8 Navigation using Material Router
// void main() {
//   runApp(const MaterialApp(
//     title: 'Navigation Basics',
//     home: FirstPage(),
//   ));
// }

//Demo 9 Internalization Multi language
void main() {
  runApp(const MaterialApp(
    title: 'Navigation Basics',
    home: CustomLocalizationWidget(),
  ));
}

//17-May-2023
// Demo 1 - Statelesst App
class StatelessApp2 extends StatelessWidget {
  const StatelessApp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(child: Text("Something")),
    // );

    return MaterialApp(
      home: Text("Android Mani"),
    );
  }
}

// Demo 2 - Stateful App
class StateFulApp extends StatefulWidget {
  const StateFulApp({Key? key}) : super(key: key);

  @override
  State<StateFulApp> createState() => _StateFulAppState();
}

class _StateFulAppState extends State<StateFulApp> {
  String value = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          Text("India"),
          Text("Tamilnadu"),
          Text("$value"),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                this.value = "Hello";
                print(this.value);
              });
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}

// Demo 3 - Safe Area
class SafeAreaApp extends StatelessWidget {
  const SafeAreaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SafeArea(child: Text("Android Mani")));
  }
}

// Demo 4 - Scaffold
class ScaffoldApp extends StatelessWidget {
  const ScaffoldApp({Key? key}) : super(key: key);

  void _MenuIcon() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {
          //     print("clicked");
          //   },
          // ),
          title: Text("FSS"),
          actions: [
            IconButton(onPressed: _MenuIcon, icon: Icon(Icons.search)),
            IconButton(onPressed: _MenuIcon, icon: Icon(Icons.add))
          ],
        ),
        drawer: Drawer(),
        // bottomNavigationBar: BottomNavigationBar(items: Items),
      ),
    );
  }
}

// Demo 5 - Dart Variables
class VariablesApp extends StatefulWidget {
  const VariablesApp({Key? key}) : super(key: key);

  @override
  State<VariablesApp> createState() => _VariablesAppState();
}

class _VariablesAppState extends State<VariablesApp> {
  int _counter = 0;

  // int a = null; //Non-nullable variable

  Object country = "India";
  var abc = "test";
  int? bcd = null; //int? bcd = null;
  String firstName = "Mani";
  static const test = 100;
  final userName = "AndroidMani";

  var mani = Users()
  ..name = "test";

  // Cascade notation
  var user = Users()
    ..id = 1
    ..name = "manie"
    ..age = 20;

  var paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

  var sb = StringBuffer()
    ..write('test')
    ..write('good');

  void _OperatorsEx() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Variables"),
        ),
        body: Column(
          children: [
            Text("Counter --> $_counter"),
            Text("Country $country"),
            Text("Abc $abc"),
            Text("FirstName $firstName"),
            Text("Value $userName"),
            Text(this.sb.length.toString() as String)
          ],
        ),
      ),
    );
  }
}

//18-May-2023
//Demo 6 for Stateless vs Stateful Widget
class FssApp extends StatelessWidget {
  const FssApp({super.key});

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Number is " + (a % 2 == 0 ? "Even" : "Odd")),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              a = random.nextInt(10);
              print(a);
            },
            child: Icon(Icons.send),
          )),
    );
  }
}

//Demo 7 Row and Column
class RowWidgetEx extends StatelessWidget {
  const RowWidgetEx({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.deepOrange[200],
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.deepPurple[100],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
