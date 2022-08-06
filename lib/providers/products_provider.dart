import 'package:flutter/material.dart';

import '../models/product.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Football',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/1998_-_Tricolore_%28France%29_%284170715889%29.jpg/255px-1998_-_Tricolore_%28France%29_%284170715889%29.jpg',
      price: '200',
    units: '3',
    ),
  ];

  List<Product> get products {
    return [..._products];
  }

  void addProduct(Product product) {
    final newProduct = Product(
      id: DateTime.now().toString(),
      name: product.name,
      imageUrl: product.imageUrl,
      price: product.price,
      units: product.units,
    );
    _products.add(newProduct);
    notifyListeners();
  }

  Product findByid(String id) {
    return _products.firstWhere((prod) => prod.id == id);
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _products.indexWhere((prod) => prod.id == id);
    // ignore: unrelated_type_equality_checks
    if (prodIndex >= 0) {
      _products[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }
}
