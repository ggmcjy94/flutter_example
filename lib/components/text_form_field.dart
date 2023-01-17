import 'package:flutter/material.dart';
import 'package:flutter_login_app/size.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  const CustomTextFormField({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text!),
        const SizedBox(height: small_gap,),
        TextFormField(
          validator: (value) => value!.isEmpty ? "Please enter some $text": null,
          obscureText: 
          text == "Password" ? true : false,
          decoration: InputDecoration(
            hintText: "Enter $text",
            enabledBorder: OutlineInputBorder(
              // text form field 디자인
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              // 터치시 text form field 디자인
              borderRadius: BorderRadius.circular(20),
            ),
            errorBorder: OutlineInputBorder(
              // 에러 발생시 form 디자인
              borderRadius: BorderRadius.circular(20),
            ),
            focusedErrorBorder: OutlineInputBorder(
              // 에러 발생후 손가락을 터치했을 때 form 디자인
              borderRadius: BorderRadius.circular(20),
            )
          ),
        )
      ],
    );
  }
}
