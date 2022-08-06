import 'package:ass_1/providers/products_provider.dart';
import 'package:ass_1/widgets/product_listView.dart';
import 'package:flutter/material.dart';
import './editProductScreen.dart';

class ProductsOverViewScreen extends StatefulWidget {
  static const routeName = 'prod-overview';
  const ProductsOverViewScreen({Key? key}) : super(key: key);

  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {
  final String lol = '0';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ProductEditScreen.routeName,
                  arguments: '',
                );
              },
              icon: const Icon(Icons.add),
            ),
          ],
          title: const Text(
            'Abhishek Sports Shop',
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 500,
                child: ProductList(),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    ProductEditScreen.routeName,
                    arguments: '',
                  );
                },
                child: Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'Add Your Product',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
