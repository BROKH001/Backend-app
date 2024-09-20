import 'package:backend/src/Model/product.dart';
import 'package:get/state_manager.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs();
  addProductCard (Product product){
    products.add(product);
    print("Add Item success!");
    update();
  }
  
}