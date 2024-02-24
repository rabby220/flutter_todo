import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todos_demo/models/todo_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../controllers/home_controller.dart';
import 'favorite_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.jobTitle,
                        decoration: InputDecoration(
                          hintText: 'Job Title',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: controller.jobDescription,
                        decoration: InputDecoration(
                          hintText: 'Job description',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      if (controller.jobTitle.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter your Job Name");
                      } else if (controller.jobDescription.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Enter your Job Description");
                      } else {
                        controller.addTodoList(
                          TodoModel(
                            jobTitle: controller.jobTitle.text,
                            jobDescription: controller.jobDescription.text,
                          ),
                        );
                        controller.jobTitle.clear();
                        controller.jobDescription.clear();
                        Fluttertoast.showToast(msg: "Data Added Successfully");
                        Get.back();
                      }
                    },
                    child: const Text("Add"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Cancel"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(const FavoriteView());
          },
          icon: const Icon(Icons.favorite_border),
        ),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: controller.allTodoList.length,
            itemBuilder: (_, index) {
              return Card(
                child: ListTile(
                  title: Text(controller.allTodoList[index].jobTitle),
                  subtitle: Text(controller.allTodoList[index].jobDescription),
                  trailing: IconButton(
                    onPressed: () {
                      //delete todo items
                      //controller.allTodoList.removeAt(index);

                     // controller.deleteTodoList(controller.allTodoList[index]);
                      //addFavoriteList
                      controller.addFavoriteList(controller.allTodoList[index]);
                    },
                    icon: const Icon(Icons.favorite_border),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
