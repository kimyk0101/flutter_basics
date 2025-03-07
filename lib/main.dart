import 'package:flutter/material.dart';
import 'package:flutter_basics/widget_gallery.dart';

void main() {
  runApp(const MyApp());
}

//  상태 없는 위젯
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  MaterialApp: 앱의 전체적 테마와 라우팅 설정
    return MaterialApp(
      title: 'Flutter Demo',
      //  앱 전체의 테마 정보
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      //  앱의 기본 화면
      home: const MyHomePage(title: 'Flutter Demo Home Page'),

      //  라우팅 정보 추가
      routes: {
        '/gallery': (context) => const WidgetGallery(title: "WidgetGallery"),
      },
    );
  }
}

//  상태 있는 위젯
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  //  위젯의 상태 생성
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//  State: 위젯의 상태를 관리하는 클래스
class _MyHomePageState extends State<MyHomePage> {
  //  State 변수
  //  내부 state 변경을 위해서는 반드시 setState 함수를 사용
  int _counter = 0;

  //  FAB onPressed Callback Function
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  //  UI 렌더링 메서드
  @override
  Widget build(BuildContext context) {
    //  Scaffold: 페이지를 구성하는 위젯
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            // const Spacer(),
            const SizedBox(height: 20),

            //  이벤트 테스트 패널
            GestureDetector(
              //  일반 위젯에게 사용자 인터렉션을 허용하는 위젯
              //  tap, double tap, long press 이벤트 발생 시
              //  SnackBar로 이벤트를 표시
              onTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Panel Tapped!")));
              },
              onDoubleTap: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Panel Double Tapped!")));
              },
              onLongPress: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Panel Long Pressed!")));
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 100,
                color: Colors.purple,
                child: const Center(
                  child: Text(
                    "제스처 테스터",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ScaffoldMessenger.of(
                //   context,
                // ).showSnackBar(SnackBar(content: Text("위젯 갤러리로..")));
                Navigator.pushNamed(context, '/gallery');
              },
              child: Text("위젯 갤러리로 이동"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
