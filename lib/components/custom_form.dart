import 'package:flutter/material.dart';
import 'package:flutter_login_app/components/text_form_field.dart';
import 'package:flutter_login_app/size.dart';



class CustomForm extends StatelessWidget {

  CustomForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      // 글로벌 key 를 form 태그에 연결하여 해당 key 로 form의 상태관리 할 수 있음
      key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(text: "Email"),
            SizedBox(height: medium_gap,),
            CustomTextFormField(text: "Password"),
            SizedBox(height: large_gap,),
            TextButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, "/home");
                  }
                },
                child: Text("Login"),
            ),
          ],
        )
    );
  }
}
