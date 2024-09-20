
import 'package:backend/src/Model/productController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListProduct extends StatelessWidget {
  ListProduct({super.key});
  final ProductController productController = Get.find<ProductController>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product List"),
        centerTitle: true,
      ),
      body: Card(
        child: ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index){
            var pro = productController.products[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    pro.qty.toString(),
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                title: Text(pro.name),
                subtitle: Text(pro.total.toString()),
              ),
            );
          }
        ),
      ),
    );
  }
}