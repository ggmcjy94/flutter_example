import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String result = 'no data found';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future test'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  futureTest();
                },
                child: const Text(
                  'Future test',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                result,
                style: const TextStyle(fontSize: 20.0, color: Colors.redAccent),
              ),
              const Divider(
                height: 20.0,
                thickness: 2.0,
              ),
              FutureBuilder(
                  future: myFuture(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Text(
                        snapshot.data!,
                        style: const TextStyle(fontSize: 20.0, color: Colors.blue),
                      );
                    }
                    return const CircularProgressIndicator();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> futureTest() async {
    print('object');
    await Future.delayed(Duration(seconds: 3)).then((value) {
      print('Here comes second');
      setState(() {
        result = 'The data is fetched';
        print(result);
        print('Here comes third');
      });
    });
    print('Here comes first');
    print('Here is the last one');
  }

  Future<String> myFuture() async {
    await Future.delayed(Duration(seconds: 10));
    return 'another Future completed';
  }
}
