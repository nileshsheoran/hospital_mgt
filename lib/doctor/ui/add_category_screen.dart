import 'package:flutter/material.dart';

import '../../database/database_helper.dart';
import '../model/category_model.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  late TextEditingController idController;
  late TextEditingController categoryController;

  @override
  void initState() {
    idController = TextEditingController();
    categoryController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: idController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Enter Id',
              ),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: 'Enter Category',
              ),
            ),
            ElevatedButton(
                onPressed: () async{
                  Category categoryModel = Category(
                      id: int.parse(idController.text),
                      category: categoryController.text);
                  await DatabaseHelper.addCategory(categoryModel);
                },
                child: const Text('Add')),
          ],
        ),
      ),
    ));
  }
}
