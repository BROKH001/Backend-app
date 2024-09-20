import 'package:backend/src/Model/getx.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 0.obs();
  Controller controller = Get.put(Controller());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  child: IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Controller>(
              builder: (_) => Text(
                "${controller.counter}",
                style: const TextStyle(fontSize: 40),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CupertinoButton(
              color: Colors.blue,
              child: const Text("Next"),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: const  Icon(Icons.remove),
            onPressed: () {
              controller.decrement();
            },
          ),
          FloatingActionButton(
            child: const  Icon(Icons.add),
            onPressed: () {
              controller.increment();
            },
          ),
        ],
      ),
    );
  }
}
