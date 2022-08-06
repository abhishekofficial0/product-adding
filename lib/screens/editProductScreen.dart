// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/products_provider.dart';

class ProductEditScreen extends StatefulWidget {
  static const routeName = 'edit-screen';
  const ProductEditScreen({Key? key}) : super(key: key);

  @override
  _ProductEditScreenState createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {
  final _imageUrlController = TextEditingController();
  var _isInit = true;
  final _form = GlobalKey<FormState>();
  var _initialValues = {
    'name': '',
    'imageUrl': '',
    'price': '',
    'units': '',
  };

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments as String;
      if (productId != '') {
        _product = Provider.of<ProductProvider>(context).findByid(productId);
        _initialValues = {
          'name': _product.name,
          'imageUrl': '',
          'price': _product.price,
          'units': _product.units,
        };
        _imageUrlController.text = _product.imageUrl;
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  var _product = Product(
    id: '',
    name: '',
    imageUrl: '',
    price: '',
    units: '',
  );

  void _saveForm() {
    final _isValid = _form.currentState?.validate();
    if (!_isValid!) {
      return;
    }
    _form.currentState?.save();
    if (_product.id != '') {
      Provider.of<ProductProvider>(context, listen : false)
          .updateProduct(_product.id, _product);
    } else {
      Provider.of<ProductProvider>(context, listen: false).addProduct(_product);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: _form,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Center(
                child: _imageUrlController.text.isEmpty
                    ? const Text('Enter The Url')
                    : FittedBox(
                        child: Image(
                          image: NetworkImage(_imageUrlController.text),
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                // initialValue: _imageUrlController.text,
                controller: _imageUrlController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Image Url',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) {
                  _product = Product(
                    id: _product.id,
                    name: _product.name,
                    imageUrl: value!,
                    price: _product.price,
                    units: _product.units,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 300,
              child: TextFormField(
                initialValue: _initialValues['name'],
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Name of the Product',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onSaved: (value) {
                  _product = Product(
                    id: _product.id,
                    name: value!,
                    imageUrl: _product.imageUrl,
                    price: _product.price,
                    units: _product.units,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 175,
                  child: TextFormField(
                    initialValue: _initialValues['price'],
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Price',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (value) {
                      _product = Product(
                        id: _product.id,
                        name: _product.name,
                        imageUrl: _product.imageUrl,
                        price: value!,
                        units: _product.units,
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                SizedBox(
                  width: 85,
                  child: TextFormField(
                    initialValue: _initialValues['units'],
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: 'Units',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onSaved: (value) {
                      _product = Product(
                        id: _product.id,
                        name: _product.name,
                        imageUrl: _product.imageUrl,
                        price: _product.price,
                        units: value!,
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                _saveForm();
              },
              child: Container(
                height: 60,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                ),
                child: const Center(
                  child: Text(
                    'Add ',
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
    ));
  }
}
