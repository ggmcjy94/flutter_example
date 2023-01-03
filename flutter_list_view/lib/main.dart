import 'package:flutter/material.dart';
import 'package:flutter_list_view/animal_page.dart';

import 'model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyPage(),
    );
  }
}

// listview -> 다른 페이지 로 이동 (데이터 전달)
class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  static List<String> animalName = [
    'Bear',
    'Camel',
    'Deer',
    'Fox',
    'Kangaroo',
    'Koala',
    'Lion',
    'Tiger'
  ];

  static List<String> animalImagePath = [
    'image/bear.png',
    'image/camel.png',
    'image/deer.png',
    'image/fox.png',
    'image/kangaroo.png',
    'image/koala.png',
    'image/lion.png',
    'image/tiger.png'
  ];

  static List<String> animalLocation = [
    'forest and mountain',
    'dessert',
    'forest',
    'snow mountain',
    'Australia',
    'Australia',
    'Africa',
    'Korea'
  ];

  final List<Animal> animalData = List.generate(
      animalLocation.length,
      (index) => Animal(
          animalName[index], animalImagePath[index], animalLocation[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: animalData.length,
        itemBuilder: (context, index) {
          return Card(
            // 행의 높이가 고정
            child: ListTile(
              title: Text(animalData[index].name),
              //leading 왼쪽
              leading: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(animalData[index].imgPath),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnimalPage(animal: animalData[index],)));
                debugPrint(animalData[index].name);
              },
            ),
          );
        },
      ),
    );
  }
}

// list view -> popup 창 띄우기
class ListViewPage1 extends StatefulWidget {
  const ListViewPage1({Key? key}) : super(key: key);

  @override
  State<ListViewPage1> createState() => _ListViewPageState1();
}

class _ListViewPageState1 extends State<ListViewPage1> {
  var titleList = [
    'lee1',
    'lee2',
    'lee3',
    'lee4',
    'lee5',
    'lee6',
    'lee7',
    'lee8',
    'lee9',
    'lee10',
  ];

  var imageList = [
    'image/1.png',
    'image/2.png',
    'image/3.png',
    'image/4.png',
    'image/5.png',
    'image/6.png',
    'image/7.png',
    'image/8.png',
    'image/9.png',
    'image/10.png',
  ];

  var description = [
    '1.There are different avg=70957.06ms min=70957.06ms max=70957.06ms count=1',
    '2.There are different avg=70957.06ms min=70957.06ms max=70957.06ms count=1',
    '3.There are different avg=70957.06ms min=70957.06ms max=70957.06ms count=1',
    '4.There are different avg=70957.06ms min=70957.06ms max=70957.06ms count=1',
    '5.There are different avg=70957.06ms min=70957.06ms max=70957.06ms count=1',
    '6.There are different avg=70957.06ms min=70957.06ms max=70957.06ms count=1',
    '7.There are different avg=70957.06ms min=70957.06ms max=70957.06ms count=1',
    '8.There are different avg=70957.06ms min=70957.06ms max=70957.06ms count=1',
    '9.There are different avg=70957.06ms min=70957.06ms max=70957.06ms count=1',
    '10.There are different avg=70957.06ms min=70957.06ms max=70957.06ms count=1',
  ];

  void showPopup(context, title, image, description) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //이미지 사각형
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      description,
                      maxLines: 3,
                      style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                      label: const Text('close')),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView', style: TextStyle(color: Colors.grey)),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      // list view 리스트뷰 안에 모든 차일드를 생성 해서 보여줌
      // listview.builder 그때 그때 필요한 만큼만 데이터를 저장소나 서버에서 불러옴
      body: ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (context, index) {
          // Inkwell 잉크가 퍼지는 듯한 애니메이션을 보여줌
          return GestureDetector(
            onTap: () {
              debugPrint(titleList[index]);
              showPopup(context, titleList[index], imageList[index],
                  description[index]);
            },
            child: Card(
              child: Row(
                children: [
                  // 공간을 확보하기 위해서는 container 보다 sizedbox 가 더 효율적
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(imageList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          titleList[index],
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //반응형 앱
                        SizedBox(
                          width: width,
                          child: Text(
                            description[index],
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[500]),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
