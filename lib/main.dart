import 'package:flutter/material.dart';
import 'builddatepicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test App",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  final TextEditingController _dateinput = TextEditingController();
  final TextEditingController _dateinput1 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("DatePicker"),
          backgroundColor: Colors.blueAccent, //background color of app bar
        ),
        body: Container(
            padding: const EdgeInsets.all(15),
            child: Center(
                child: Column(
              children: [
                DatePicker(
                  dateFormat: 'dd-MM-yyyy',
                  textcontroller1: _dateinput,
                  textcontroller2: _dateinput1,
                  startdate: (strt) {
                    print(strt);
                  },
                  enddate: (end) {
                    print(end);
                  },
                ),
              ],
            ))));
  }
}
