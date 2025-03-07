import 'package:flutter/material.dart';

class InputWidgetExample extends StatefulWidget {
  const InputWidgetExample({super.key});

  @override
  State<InputWidgetExample> createState() => _InputWidgetExampleState();
}

class _InputWidgetExampleState extends State<InputWidgetExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "입력 위젯 예시",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
