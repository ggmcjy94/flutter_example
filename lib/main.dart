import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_first/bottom_app_bar_demo.dart';

import 'package:page_transition/page_transition.dart';

List<CameraDescription> cameras = [];
Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }

  runApp(MaterialApp(
    title: 'MyApp',
    home: MyScaffold(),
  ));
}



class MyScaffold extends StatefulWidget {
  const MyScaffold({Key? key}) : super(key: key);

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int _count =0;

  @override
  Widget build(BuildContext context) {
    //Material, Cupertino, Scaffold
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Example title',
          style: Theme.of(context).primaryTextTheme.titleMedium,
        ),
      ),
      body: Center(
        child: Text('you have pressed the button $_count times.'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0,),
      ),
      // backgroundColor: Colors.blueGrey.shade200,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            tooltip: 'Increment Counter',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: null,
              onPressed: () {
                setState(() {
                  Navigator.push(context, PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const BottomAppBarDemo(),
                  ));
                });
              },
            child: const Icon(Icons.navigate_next),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

