import 'package:flutter/material.dart';

class InputWidgetExample extends StatefulWidget {
  const InputWidgetExample({super.key});

  @override
  State<InputWidgetExample> createState() => _InputWidgetExampleState();
}

class _InputWidgetExampleState extends State<InputWidgetExample> {
  //  텍스트 에디트 컨트롤러
  final TextEditingController _controller = TextEditingController();
  //  상태 변수
  String _inputText = "";
  bool _isChecked = false;
  int _radioValue = 0;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    //  입력 양식이 키보드에 가리는 것을 방지하기 위해 SingleChildScrollView로 감싼다.
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: const InputDecoration(labelText: "문장을 입력하세요"),
            onChanged: (text) {
              setState(() {
                _inputText = text;
              });
            },
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Checkbox(
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Text("Check Me!"),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Radio<int>(
                value: 0,
                groupValue: _radioValue,
                onChanged: (int? value) {
                  setState(() {
                    _radioValue = value ?? 0;
                  });
                },
              ),
              Text("Option1"),
              Radio<int>(
                value: 1,
                groupValue: _radioValue,
                onChanged: (int? value) {
                  setState(() {
                    _radioValue = value ?? 1;
                  });
                },
              ),
              Text("Option2"),
            ],
          ),
          SizedBox(height: 20),
          Slider(
            value: _sliderValue,
            min: 0.0,
            max: 100.0,
            onChanged: (double value) {
              setState(() {
                _sliderValue = value;
              });
            },
          ),
          Text("Slider Value: ${_sliderValue.toStringAsFixed(1)}"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              //  AlertDialog 띄우기
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("입력 데이터들"),
                    content: Column(
                      children: <Widget>[
                        Text("TextInput: $_inputText"), //  텍스트 입력 상자 값
                        Text("Checkbox: $_isChecked"), //  체크 여부
                        Text("Radio: $_radioValue"), //  선택된 라디오 옵션
                        Text("Slider: ${_sliderValue.toStringAsFixed(1)}"), //
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); //  스택에서 제거
                        },
                        child: const Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text("입력 내용 확인 (AlertDialog"),
          ),
          SizedBox(height: 100),
          TextField(),
        ],
      ),
    );
  }
}
