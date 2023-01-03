import 'package:flutter/material.dart';
import 'ScreenA.dart';
import 'ScreenB.dart';
import 'ScreenC.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // home args initialRoute args 두개 동시에 받으면 에러남
    return MaterialApp(
      title: 'MyApp',
      theme: ThemeData(primaryColor: Colors.white),
      // initialRoute: '/',
      // routes: {
      //   '/' : (context) => ScreenA(),
      //   '/b' : (context) => ScreenB(),
      //   '/c' : (context) => ScreenC(),
      // },
      home: MyPage(),
    );
  }
}

// scaffold Messenger
class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Messenger'),
      ),
      body: HomeBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.thumb_up),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Like a new Snack bar!'),
            duration: Duration(seconds: 5),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourPage()),
                );
              },
            ),
          ));
        },
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Go to the third page'),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ThirdPage()));
        },
      ),
    );
  }
}

// navigator
class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text('Go to the Second page'),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => SecondPage()));
            }),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
      ),
      body: Center(
        child: ElevatedButton(
            child: Text('Go to the First page'),
            onPressed: () {
              Navigator.pop(ctx);
            }),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Third Page'),
        ),
        body: Center(
          child: Text(
            '좋아요가 추가 되었습니다.',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.redAccent,
            ),
          ),
        ),
      ),
    );
  }
}

class FourPage extends StatelessWidget {
  const FourPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ScaffoldMessenger Scaffold 를 따로 관리 해줌
    return ScaffoldMessenger(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Four Page'),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '좋아요를 취소 하시겠습니까?',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.redAccent,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('좋아요가 취소 되었습니다.'),
                        duration: Duration(seconds: 3),
                      ),
                    );
                  },
                  child: Text('취소하기'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
