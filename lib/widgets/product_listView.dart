// ignore_for_file: file_names

import 'package:ass_1/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final _products = productsData.products;
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: _products[i],
        child: const ProductItem(),
      ),
    );
  }
}
