import 'package:flutter/material.dart';
import 'package:flutter_profile_app/components/profile_buttons.dart';
import 'package:flutter_profile_app/components/profile_count_info.dart';
import 'package:flutter_profile_app/components/profile_drawer.dart';
import 'package:flutter_profile_app/components/profile_header.dart';
import 'package:flutter_profile_app/components/profile_tab.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ProfileDrawer(),
      appBar: _buildProfileAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          ProfileHeader(),
          SizedBox(
            height: 20,
          ),
          ProfileCountInfo(),
          SizedBox(
            height: 20,
          ),
          ProfileButtons(),
          Expanded(child: ProfileTab())
        ],
      ),
    );
  }

  AppBar _buildProfileAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1.0,
      leading: Icon(Icons.arrow_back_ios),
      title: Text(
        "Profile",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }
}
