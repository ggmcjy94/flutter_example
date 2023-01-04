import 'package:flutter/material.dart';
import 'package:flutter_login_page_refactoring/my_button/MyButton.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.2,
      ),
      body: _buildButton(),
    );
  }
  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          MyButton(
              image: Image.asset('images/glogo.png'),
              text: const Text(
                  "Login with Google",
                  style: TextStyle(color: Colors.black87, fontSize: 15.0)
              ),
              color: Colors.white,
              radius: 4.0,
              onPressed: () {
              }
          ),
          const SizedBox(
            height: 10.0,
          ),
          MyButton(
              image: Image.asset('images/flogo.png'),
              text: const Text(
                  "Login with Facebook",
                  style: TextStyle(color: Colors.white, fontSize: 15.0)
              ),
              color: Color(0xFF334D92),
              radius: 4.0,
              onPressed: () {
              }
          ),
          const SizedBox(
            height: 10.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                Text(
                  'Login with Email',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                ),
                Opacity(
                  opacity: 0.0,
                  child: Icon(
                    Icons.mail,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
