import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
//import 'package:hive_flutter/hive_flutter.dart';



void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  //Hive.registerAdapter(TodoAdapter());
  await Hive.openBox('peopleBox');*/
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
