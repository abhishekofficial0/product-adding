import 'package:ass_1/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import './screens/editProductScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => ProductProvider())],
      child: MaterialApp(
        home: const ProductsOverViewScreen(),
        routes: {
          ProductsOverViewScreen.routeName: (ctx) =>
              const ProductsOverViewScreen(),
          ProductEditScreen.routeName: (ctx) => const ProductEditScreen(),
        },
      ),
    );
  }
}
