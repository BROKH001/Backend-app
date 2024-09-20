
class Product {
  late int id;
  late String name;
  late int qty;
  late double price;
  late double total;

  Product({
    required this.id,
    required this.name,
    required this.qty,
    required this.price,
    required this.total,
  });
}

List<Product> lists = [
  Product(id: 0, name: "",  qty: 0, price: 0, total: 0)
];
