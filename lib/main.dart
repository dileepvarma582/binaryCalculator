import 'package:flutter/material.dart';
import 'baseConverter.dart';
import 'binaryCalculator.dart';
import 'package:flutter/services.dart';
void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new MyApp());
  });
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Text("Base Calculator"),
            bottom: TabBar(
              tabs: [
                Tab(icon: Text("Base Converter")),
                Tab(icon: Text("Binary Calculator")),
              ],
            ),
          ),

          body: TabBarView(
            children: <Widget>[
              BaseConverter(),
              BinaryCalculator(),
            ],
          ),
        ),
      ),
    );
  }
}
