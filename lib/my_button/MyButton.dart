

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  const MyButton({Key? key,
    required this.image,
    required this.text,
    required this.color,
    required this.radius,
    required this.onPressed
  }) : super(key: key);

  final Widget image;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          image,
          text,
          Opacity(
            opacity: 0.0,
            child: Image.asset('images/glogo.png'),
          ),
        ],
      ),
    );
  }
}
