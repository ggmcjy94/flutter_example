


import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildFollowButton(),
        _buildMessageButton(),
      ],
    );
  }

  Widget _buildFollowButton() {
    return InkWell(
      onTap: () {

      },
      child: Container(
        alignment: Alignment.center, // 컨테이너 내부 Text 위젯 정렬
        width: 150,
        height: 45,
        child: Text(
          "Follow",
          style: TextStyle(color:  Colors.white),
        ),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10) // 박스 둥글게
        ),
      ),
    );
  }

  Widget _buildMessageButton() {
    return InkWell(
      onTap: () {

      },
      child: Container(
        alignment: Alignment.center, // 컨테이너 내부 Text 위젯 정렬
        width: 150,
        height: 45,
        child: Text(
          "Message",
          style: TextStyle(color:  Colors.black),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10), // 박스 둥글게
            border: Border.all() // 컨테이너 테두리 선긋기
        ),
      ),
    );
  }
}
