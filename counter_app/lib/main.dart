import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You have pushed the button this many times;'),
              Text('$count' ,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  count++;
                  print("$count");
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (count > 0) {
                    count--;
                  } else {
                    toastShow();
                  }
                });
              },
            ),
            ElevatedButton(
              child: const Text('초기화'),
              onPressed: () {
                setState(() {
                  count = 0;
                });
              }
            ),
          ],
        )
      ),
    );
  }

  void toastShow() {
    Fluttertoast.showToast(
      msg: "현재 값이 0 입니다.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      fontSize: 16.0
    );
  }
}
