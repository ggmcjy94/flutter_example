import 'dart:convert';

import 'package:flutter_getx_todo/models/todo.dart';
import 'package:flutter_getx_todo/repository/repository.dart';
import 'package:get/utils.dart';
import 'package:http/http.dart' as http;

class TodoRepository extends Repository {
  String dataURL = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<Todo>> getTodoList() async {
    // Future ==> async
    var url = Uri.parse('$dataURL/todos');
    var response = await http.get(url);
    print('status code : ${response.statusCode}');
    return List<Todo>.from(
        json.decode(response.body).map((x) => Todo.fromJson(x)));
  }

  @override
  Future<String> patchCompleted(Todo todo) async {
    var url = Uri.parse('${dataURL}/todos/${todo.id}');
    String resData = '';
    await http.patch(
        url,
        body: {
        'completed': (!todo.completed!).toString(),
        },
      headers: {'Authorization' : 'your_token'}
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      return resData = result['completed'];
    });

    return resData;
  }

  @override
  Future<String> putCompleted(Todo todo) async {
    var url = Uri.parse('${dataURL}/todos/${todo.id}');
    String resData = '';
    await http.put(
        url,
        body: {
          'completed': (!todo.completed!).toString(),
        },
        headers: {'Authorization' : 'your_token'}
    ).then((response) {
      Map<String, dynamic> result = json.decode(response.body);
      print(result);
      return resData = result['completed'];
    });
    return resData;
  }

  @override
  Future<String> deletedTodo(Todo todo) async {
    var url = Uri.parse('${dataURL}/todos/${todo.id}');
    var result = 'false';
    await http.delete(url).then((value) {
      print (value.body);
      return result = 'true';
    });
    return result;
  }


  @override
  Future<String> postTodo(Todo todo) async {
    print('${todo.toJson()}');
    var url = Uri.parse('${dataURL}/todos/');
    var response = await http.post(url, body: todo.toJson());
    print(response.statusCode);
    print(response.body);
    return 'true';
  }


}
