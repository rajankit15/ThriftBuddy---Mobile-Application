import 'package:at_project/reusable_widgets/product_container.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category"),
      ),
      body: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              mainAxisExtent: 200),
          itemBuilder: (context, index) {
            return displayContainer();
          }),
    );
  }

  Widget displayContainer() {
    return Container(
      margin: const EdgeInsets.all(4),
      color: Colors.amber,
    );
  }
}
