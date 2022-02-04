import 'dart:convert';
import 'package:flutter/material.dart';
import 'models/metero_response.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Weather> items = MeteroResponse.fromJson(jsonDecode('{api.openweathermap.org/data/2.5/weather?lat=37.3826&lon=-5.9962937&appid=81bf7e6f9900a2832fc3a8f623c7b62f}')).weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Text(items.elementAt(index).description);
          },
        ),
    );
    
  }
}