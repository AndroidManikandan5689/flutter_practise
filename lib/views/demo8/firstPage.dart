import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fssapp/views/api/apipage.dart';
import 'package:fssapp/views/buttons/buttonstype.dart';
import 'package:fssapp/views/demo8/secondPage.dart';

import '../api/apipage.dart';

void main() => runApp(FirstPage());

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Named Routes - 1
      // routes: {
      //   '/': (context) => secondPage(context),
      //   '/button': (context) => buttonsPage(context)
      // },

      home: Scaffold(
        appBar: AppBar(
          title: const Text("First Page"),
        ),
        body: Column(
          children: [
            secondPage(context),
            buttonsPage(context),
            OpenApiPage(context)
          ],
        ),
      ),
    );
  }

  SizedBox buttonsPage(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
          onPressed: () {
            //Navigator Push/Pop - 2
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => ButtonsList()));

            //Navigator with PageRouteBuilder
            Navigator.of(context).push(_createRoute());

          },
          child: const Text("Buttons")),
    );
  }

  SizedBox secondPage(BuildContext cxt) {
    return SizedBox(
      width: 300,
      height: 50,
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(cxt,
                  MaterialPageRoute(builder: (context) => const SecondPage()));
            },
            child: const Text("Go to Second Page")),
      ),
    );
  }

  SizedBox OpenApiPage(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ApiPage()));
            },
            child: const Text("API")),
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const SecondPage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child;
        });
  }
}
