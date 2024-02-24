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
            itemBuilder: (_, item) {
              return Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(controller.allTodoList[item].jobTitle),
                    Text(controller.allTodoList[item].jobDescription),
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: Column(
                                children: [
                                  TextFormField(decoration: InputDecoration(
                                    hintText: 'Job Title',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                    controller: controller.jobTitle,
                                  ),
                                 const SizedBox(height: 10,),
                                  TextFormField(decoration: InputDecoration(
                                    hintText: 'Job description',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                    controller: controller.jobDescription,
                                  ),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (controller.jobTitle.text.isEmpty &&
                                        controller
                                            .jobDescription.text.isEmpty) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Please Enter your Job Name and Job Description");
                                    } else {
                                      controller.updateTodoList(
                                          TodoModel(
                                              jobTitle:
                                                  controller.jobTitle.text,
                                              jobDescription: controller
                                                  .jobDescription.text),
                                          item);
                                      controller.jobTitle.clear();
                                      controller.jobDescription.clear();
                                      Get.back();
                                    }
                                  },
                                  child: const Text("Update"),
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
                      icon: const Icon(Icons.drive_file_rename_outline),
                    ),
                    IconButton(
                      onPressed: () {
                        controller.deleteTodoList(controller.allTodoList[item]);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
