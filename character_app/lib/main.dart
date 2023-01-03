import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 띠 삭제
      title: 'BBANTO',
      home: Grade(),
    );
  }
}


class Grade extends StatelessWidget {
  const Grade({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[500],
      appBar: AppBar(
        title: Text('BBANTO'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0, //입체감
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:   [
            Center(
              child: CircleAvatar( // 이미지
                backgroundImage: AssetImage('assets/fire.png'),
                radius: 60.0,
              ),
            ),
            Divider( // 선
              height: 60.0, // 위 30 아래 30
              color: Colors.grey[850],
              thickness: 2.0,//두께
              endIndent: 30.0, // 끝에서 간격
            ),
            Text('Name',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0 //철자 간격
            ),
            ),
            SizedBox(
              height: 10.0,
            ),// 가로 세로 간격 조절 박스
            Text('BBANTO',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(
              height: 30,
            ),
            Text('BBANTO POWER LEVEL',
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 2.0 //철자 간격
              ),
            ),
            SizedBox(
              height: 10.0,
            ),// 가로 세로 간격 조절 박스
            Text('14',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('using lightsaber',
                style: TextStyle(
                  fontSize: 16.0,
                  letterSpacing: 1.0,
                ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('face hero tattoo',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle_outline),
                SizedBox(
                  width: 10.0,
                ),
                Text('fire flames',
                  style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/pet.png'),
                radius: 40.0,
                backgroundColor: Colors.amber[800], // 사진이라 안먹음
              ),
            )
          ],
        ),
      )
    );
  }
}


class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BBANTO'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        elevation: 0.0, // 앱 바 띄우기 조절
      ),
      body: Center( // 가로축
        child: Column(
            // 위젯들을 세로축으로
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello'),
              Text('Hello'),
              Text('Hello'),
            ],
          ),
      ),
    );
  }
}





