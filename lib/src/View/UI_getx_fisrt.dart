import 'dart:math';
import 'package:backend/src/Model/ListProduct.dart';
import 'package:backend/src/Model/product.dart';
import 'package:backend/src/Model/productController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController qtycontroller = TextEditingController();
  TextEditingController pricecontroller = TextEditingController();
  TextEditingController totalcontroller = TextEditingController();

  ProductController productController = Get.put(ProductController());
  bool isFields = false;

  void clearFields() {
    namecontroller.clear();
    qtycontroller.clear();
    pricecontroller.clear();
    totalcontroller.clear();
  }

  // Function to calculate total price dynamically
  void calculateTotal() {
    if (qtycontroller.text.isNotEmpty && pricecontroller.text.isNotEmpty) {
      int qty = int.tryParse(qtycontroller.text) ?? 0;
      double price = double.tryParse(pricecontroller.text) ?? 0;
      setState(() {
        totalcontroller.text = (price * qty).toStringAsFixed(2);
      });
    }
  }

  bool validateInput() {
    if( namecontroller.text.isEmpty ||
        qtycontroller.text.isEmpty ||
        pricecontroller.text.isEmpty ||
        totalcontroller.text.isEmpty) {
      Get.snackbar(
        "Error", 
        "All fields must be filled out!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Hello GetX"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  label: Text("Enter Name"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: qtycontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Enter qty"),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  calculateTotal();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: pricecontroller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Enter Price"),
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  calculateTotal();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: totalcontroller,
                readOnly: true,
                decoration: const InputDecoration(
                  label: Text("Total auto calculate"),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(
                    color: Colors.blue,
                    child: const Text("Save"),
                    onPressed: () {
                      if (validateInput()) {
                        productController.addProductCard(Product(
                          id: Random().nextInt(1000),
                          name: namecontroller.text,
                          qty: int.parse(qtycontroller.text),
                          price: double.parse(pricecontroller.text),
                          total: double.parse(totalcontroller.text),
                        ));
                        clearFields(); // Clear fields after saving
                        Get.snackbar(
                          "Success",
                          "Product added successfully!",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white
                        );
                        Get.to(() => ListProduct());
                      }
                    },
                  ),
                  CupertinoButton(
                    color: Colors.red,
                    child: const Text("Clear"),
                    onPressed: () {
                      clearFields();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
