import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.location_on, color: Colors.brown),
            SizedBox(width: 8),
            Text(
              'New York, USA',
              style: TextStyle(color: Colors.brown),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.brown),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.brown),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'New Collection',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            const SizedBox(height: 10),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // image: const DecorationImage(
                //   image: AssetImage(''), // Replace with your image asset
                //   fit: BoxFit.cover,
                // ),
              ),
              child: Container(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.brown.withOpacity(0.7),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Shop Now',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryItem(Icons.home, 'T-Shirt'),
                _buildCategoryItem(Icons.newspaper, 'Dress'),
                _buildCategoryItem(Icons.looks, 'Jacket'),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Flash Sale',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Add a Flash Sale section with countdown and product cards
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.brown.shade100,
          child: Icon(icon, size: 30, color: Colors.brown),
        ),
        const SizedBox(height: 10),
        Text(title),
      ],
    );
  }
}
