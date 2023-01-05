import 'package:flutter/material.dart';
import 'package:flutter_getx/controller1.dart';
import 'package:flutter_getx/personal_card.dart';
import 'package:get/get.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      home: PersonalCard(),
    );
  }
  Scaffold home1() {
    // Controller controller = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Text('Getx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetBuilder<Controller1>(
              init: Controller1(),
              builder: (_) => Text('Controller value is: ${Get.find<Controller1>().x}'),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.find<Controller1>().increment();
                },
                child: Text('Add number')),
          ],
        ),
      ),
    );
  }



}


