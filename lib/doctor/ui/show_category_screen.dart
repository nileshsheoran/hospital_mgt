import 'package:flutter/material.dart';

import '../../database/database_helper.dart';
import '../model/category_model.dart';

class ShowCategoryScreen extends StatefulWidget {
  const ShowCategoryScreen({super.key});

  @override
  State<ShowCategoryScreen> createState() => _ShowCategoryScreenState();
}

class _ShowCategoryScreenState extends State<ShowCategoryScreen> {
  List<Category> categoryList = [];

  @override
  void initState() {
    showCategoryData();
    super.initState();
  }
Future showCategoryData()async{
  categoryList=await DatabaseHelper. getCategoryData();
    setState(() {});
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: ListView.builder(
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            Category categoryModal = categoryList[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      categoryModal.category,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 220,
                    ),
              ]
            ),
                    Row(
                    children:[
                    Text(
                      categoryModal.id.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
            ]
              ),
            );
          }),
    ));
  }
}
