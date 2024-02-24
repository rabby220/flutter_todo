import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todos_demo/app/modules/home/controllers/home_controller.dart';

class FavoriteView extends GetView<HomeController> {
  const FavoriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Todo'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.favoriteAllTodoList.isEmpty
            ? const Center(
                child: Icon(Icons.note),
              )
            : ListView.builder(
                itemCount: controller.favoriteAllTodoList.length,
                itemBuilder: (_, favoriteIndex) {
                  return Card(
                    child: ListTile(
                      title: Text(controller
                          .favoriteAllTodoList[favoriteIndex].jobTitle),
                      subtitle: Text(controller
                          .favoriteAllTodoList[favoriteIndex].jobDescription),
                      trailing: IconButton(
                        onPressed: () {
                          controller.removeFavoriteList(
                              controller.favoriteAllTodoList[favoriteIndex]);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
