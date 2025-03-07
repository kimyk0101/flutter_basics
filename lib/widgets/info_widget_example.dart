import 'dart:convert';

import 'package:flutter/material.dart';

class InfoWidgetExample extends StatelessWidget {
  const InfoWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text(
    //     "정보 표시 위젯 예시",
    //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //   ),
    // );
    return Column(
      children: <Widget>[
        Text(
          'Image Widget: from Assets',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Tooltip(
          message: "안드로이드 로고입니다.",
          child: Image.asset('assets/images/android.png'),
        ),
        SizedBox(height: 20),
        Text(
          "Image Widget: form Network",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Tooltip(
          message: "네트워크로부터 불러온 이미지",
          child: Image.network(
            "https://mblogthumb-phinf.pstatic.net/MjAyMTA4MDJfMTM3/MDAxNjI3ODY3Mjg4NzA2.LYzEC3n2-LZ9nekwfwcviDfRQRC91Eec4TO5SmYQuIkg.EtgVKqrz_PmQeiZ-hJCGf9qvFjA__prA-70BuwnqjXQg.JPEG.wenice777/3.jpeg?type=w800",
            width: 200,
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Icon Widgets",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.favorite, color: Colors.red),
            Icon(Icons.mail, color: Colors.blue),
            Icon(Icons.settings, color: Colors.green),
          ],
        ),
      ],
    );
  }
}
