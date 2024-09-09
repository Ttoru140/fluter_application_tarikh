import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(body: MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton("OK"),
          SizedBox(
            height: 10,
          ),
          CustomButton("Click"),
          SizedBox(
            height: 10,
          ),
          CustomButton("Save"),
          SizedBox(
            height: 10,
          ),
          CustomButton("NO"),
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
        print('OnTap');
      },
      child: Container(
        height: 40,
        width: 100,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: const Color.fromARGB(255, 243, 33, 100)),
        child: Center(child: Text(title)),
      ),
    );
  }
}
