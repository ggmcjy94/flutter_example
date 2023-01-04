import 'package:flutter/material.dart';
import 'package:flutter_responsuve_lec/responsive/desktop_body.dart';
import 'package:flutter_responsuve_lec/responsive/mobile_body.dart';
import 'package:flutter_responsuve_lec/responsive/responsive_layout.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}


class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MobileBody(),
        desktopBody: DeskTopBody(),
      ),
    );
  }

}

class _MyPageState1 extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('MediaQuery'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('width: '+MediaQuery.of(context).size.width.toString()),
            Text('heigh: '+MediaQuery.of(context).size.height.toString()),
            Text('aspectRatio: '+MediaQuery.of(context).size.aspectRatio.toStringAsFixed(2)),
            Text('orientation: '+MediaQuery.of(context).orientation.toString()),
          ],
        ),
      ),
    );
  }
}
