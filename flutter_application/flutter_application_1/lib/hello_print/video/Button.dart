import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'firstAPP',
      home: Scaffold(body: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        // for multiple button
        mainAxisAlignment: MainAxisAlignment.center, //for taking  button middle
        children: [
          CustomButton('OK'),
          SizedBox(
            // for space
            height: 10,
          ),
          CustomButton("save"),
          SizedBox(
            height: 10,
          ),
          CustomButton("click"),
          SizedBox(
            height: 10,
          ),
          CustomButton('NO'),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  CustomButton(this.title);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('onTap');
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color.fromARGB(255, 244, 193, 193),
        ),
        child: Center(child: Text(title)),
      ),
    );
  }
}
