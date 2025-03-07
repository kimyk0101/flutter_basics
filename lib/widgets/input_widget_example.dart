import 'package:flutter/material.dart';

class InputWidgetExample extends StatefulWidget {
  const InputWidgetExample({super.key});

  @override
  State<InputWidgetExample> createState() => _InputWidgetExampleState();
}

class _InputWidgetExampleState extends State<InputWidgetExample> {
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text(
    //     "입력 위젯 예시",
    //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //   ),
    // );
    return Column(
      children: <Widget>[
        TextField(),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Checkbox(value: true, onChanged: (bool? value) {}),
            Text("Check Me!"),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            Radio<int>(value: 0, groupValue: 0, onChanged: (int? value) {}),
            Text("Option1"),
            Radio<int>(value: 1, groupValue: 0, onChanged: (int? value) {}),
            Text("Option2"),
          ],
        ),
        SizedBox(height: 20),
        Slider(value: 50, min: 0, max: 100, onChanged: (double value) {}),
        SizedBox(height: 20),
        ElevatedButton(onPressed: () {}, child: Text("입력 내용 확인 (AlertDialog")),
      ],
    );
  }
}
