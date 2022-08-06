import 'package:flutter/cupertino.dart';

class Product extends ChangeNotifier {
  String id;
  String name;
  String imageUrl;
  String price;
  String units;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.units,
  });
}
