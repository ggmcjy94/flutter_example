import 'package:flutter/material.dart';
import 'package:flutter_kakao_app/components/bottom_icon_button.dart';
import 'package:flutter_kakao_app/components/round_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/user.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(user.backgroundImage),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(
            FontAwesomeIcons.xmark,
            size: 30,
            color: Colors.white,
          ),
          actions: [
            RoundIconButton(icon: FontAwesomeIcons.gift),
            SizedBox(
              width: 15,
            ),
            RoundIconButton(icon: FontAwesomeIcons.gear),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        body: Column(
          children: [
            Spacer(),
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(user.backgroundImage),
                  fit: BoxFit.cover
                ),
              ),
            ),
            SizedBox(height: 8,),
            Text(
              user.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              user.intro,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
              maxLines: 1,
            ),
            if (user.name == me.name) _buildMyIcons() else _buildFriendsIcons(),
          ],
        ),
      ),
    );
  }

  Widget _buildMyIcons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(
              icon: FontAwesomeIcons.comment,
              text: "나와의 채팅"
          ),
          SizedBox(
            width: 50,
          ),
          BottomIconButton(
              icon: FontAwesomeIcons.pen, 
              text: "프로필 편집"
          ),
        ],
      ),
    );
  }
  
  Widget _buildFriendsIcons() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BottomIconButton(icon: FontAwesomeIcons.comment, text: "1:1채팅"),
          SizedBox(width: 50,),
          BottomIconButton(icon: FontAwesomeIcons.phone, text: "통화하기"),
        ],
      ),
    );
  }
}
