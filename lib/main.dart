import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appbar',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar 부분
      appBar: AppBar(
        title: Text('Appbar icon menu'),
        centerTitle: true,
        elevation: 0.0,
        // leading 왼쪽
        // actions 복수의 오른쪽 아이콘
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print('Shopping cart is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search is clicked');
            },
          ),
        ],
      ),
      //자동으로 leading menu icon 생김
      //drawer 부분
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              //단수
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/이력서사진.jpeg'),
                backgroundColor: Colors.white,
              ),
              //복수
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/fire.png'),
                  backgroundColor: Colors.white,
                ),
              ],
              accountName: Text('HYUNSEOK'),
              accountEmail: Text('hyun@gmail.com'),
              onDetailsPressed: () {
                print('arrow is clicked');
              },
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),
            //ListTile
            // onTab 길게 누르기 두번 클릭 on pressed 버튼에 사용
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('Home'),
              onTap: () {
                print('home is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.grey[850],
              ),
              title: Text('Setting'),
              onTap: () {
                print('Setting is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.grey[850],
              ),
              title: Text('Q&A'),
              onTap: () {
                print('Q&A is clicked');
              },
              trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      // snackBar 부분
      // body: Builder(
      //   builder: (BuildContext ctx) {
      //     return Center(
      //       child: TextButton(
      //         child: Text(
      //           'Show',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.red,
      //           ),
      //         ),
      //         onPressed: () {
      //           ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
      //             content: Text('Hellow'),
      //           ));
      //         },
      //       ),
      //     );
      //   },
      // )

      body: Center(
        child: TextButton(
            onPressed: () {
              flutterToast();
            },
          child: Text('Toast'),
        ),
      ),
      // MySnackBar(),
    );
  }
}

//Toastmessage
void flutterToast() {
  print("object");
  Fluttertoast.showToast(
      msg: 'Flutter',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT
  );
}

//snack bar 부분
class MySnackBar extends StatelessWidget {
  const MySnackBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Show'),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('hellow',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
            ),
            backgroundColor: Colors.teal,
            duration: Duration(microseconds: 1000),
          ));
        },
      ),
    );
  }
}
