import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/controller/todo_controller.dart';
import 'package:flutter_getx_todo/repository/todo_repository.dart';
import '../models/todo.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todoController = TodoController(TodoRepository());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('REST API'),
      ),
      body: FutureBuilder<List<Todo>>(
        future: todoController.fetchTodoList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('error'),
            );
          }
          return buildBodyContent(snapshot, todoController);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Todo todo = Todo(userId: 3, title: 'sample post', completed: false);
          todoController.postTodo(todo);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  SafeArea buildBodyContent(
      AsyncSnapshot<List<Todo>> snapshot, TodoController todoController) {
    return SafeArea(
      child: ListView.separated(
        itemBuilder: (context, index) {
          var todo = snapshot.data?[index];
          return Container(
            height: 100.0,
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(flex: 1, child: Text('${todo?.id}')),
                Expanded(flex: 3, child: Text('${todo?.title}')),
                Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          child: buildCallContainer('patch', Color(0xFFFFCC80)),
                          onTap: () {
                            // make snackbar
                            todoController
                                .updatePatchCompleted(todo!)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      duration:
                                          const Duration(microseconds: 500),
                                      content: Text('$value')));
                            });
                          },
                        ),
                        InkWell(
                            onTap: () {
                              todoController
                                  .updatePutController(todo!)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration:
                                            const Duration(microseconds: 500),
                                        content: Text('$value')));
                              });
                            },
                            child:
                                buildCallContainer('put', Color(0xFFE1BEE7))),
                        InkWell(
                            onTap: () {
                              todoController.deleteTodo(todo!);
                            },
                            child: buildCallContainer(
                                'delete', Color(0xFFFFCDD2))),
                      ],
                    )),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            thickness: 0.5,
            height: 0.5,
          );
        },
        itemCount: snapshot.data?.length ?? 0,
      ),
    );
  }

  Container buildCallContainer(String title, Color color) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      child: Center(child: Text('$title')),
    );
  }
}
