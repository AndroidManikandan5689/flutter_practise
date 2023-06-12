import 'dart:convert'; //json
import 'dart:html';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fssapp/utils/constants.dart';
import 'package:fssapp/views/api/product.dart';

import 'package:http/http.dart' as http;

Future<List<Product>> fetchProducts() async {
  final response = await http.get(Uri.parse(BASE_URL));

  // print(response.body);

  if (response.statusCode == 200) {
    try {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Product>((json) => Product.fromMap(json)).toList();
    } catch (e) {
      print(e);
      throw Exception('Unable to fetch products from the REST API');
    }
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  // final Future<List<Product>> products = fetchProducts();

  @override
  Widget build(BuildContext context) {
    // final List<Product> ls = products;
    // print(products);
    // print(http.read(Uri.parse('https://flutter.dev/')));
    return MaterialApp(
      title: 'Flutter Network',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: FutureBuilder(
              future: fetchProducts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return loader();
                } else {
                  return productList(snapshot);
                }
              }),
        ),
      ),
      // home: MyHomePage(title: "Product", products: products),
    );
  }

  ListView productList(AsyncSnapshot<dynamic> snapshot) {
    return ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: ((context, index) => ListTile(
            title: Text(snapshot.data[index].title),
            subtitle: Text(snapshot.data[index].description),
            contentPadding: const EdgeInsets.only(bottom: 20.0),
            leading: Image.network(snapshot.data[index].image)

            // SizedBox(
            //     height: 100.0,
            //     width: 100.0, // fixed width and height
            //     child: Image.network(snapshot.data[index].image))

            // ConstrainedBox(
            //   constraints: BoxConstraints(
            //     minWidth: 44,
            //     maxWidth: 44,
            //     minHeight: 64,
            //     maxHeight: 64
            //   ),
            //   child: Image.network(snapshot.data[index].image),
            // ),
            )));
  }

  Container loader() {
    return Container(
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
