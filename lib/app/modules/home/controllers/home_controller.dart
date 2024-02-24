import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todos_demo/models/todo_model.dart';

class HomeController extends GetxController {

  final TextEditingController jobTitle = TextEditingController();
  final TextEditingController jobDescription = TextEditingController();


  final RxList<TodoModel> _todoList = <TodoModel>[].obs;
   RxList<TodoModel> get allTodoList => _todoList;

  final RxList<TodoModel> _favoriteTodoList = <TodoModel>[].obs;
  RxList<TodoModel> get favoriteAllTodoList => _favoriteTodoList;

  void addTodoList(TodoModel todoModel) {
    _todoList.add(todoModel);
  }

  void updateTodoList(TodoModel todoModel, int index) {
    _todoList[index] = todoModel;
  }

  void deleteTodoList(TodoModel todoModel) {
    final index = _todoList.indexOf(todoModel);
    _todoList.removeAt(index);
  }

  void addFavoriteList(TodoModel todoModel) {
    _favoriteTodoList.add(todoModel);

  }

  void removeFavoriteList(TodoModel todoModel) {
    final removeFavoriteIndex = _favoriteTodoList.indexOf(todoModel);
    _favoriteTodoList.removeAt(removeFavoriteIndex);
  }


}
