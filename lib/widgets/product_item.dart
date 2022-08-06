import 'package:ass_1/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/editProductScreen.dart';

class ProductItem extends StatelessWidget {
 
 const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  

    final product = Provider.of<Product>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 30,
        right: 30,
      ),
      child: Container(
        height: 100,
        //width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              offset: Offset(1.0, 0),
            ),
          ],
        ),
        child: Row(
          children: [
            const SizedBox(width: 20),
            Container(
              height: 80,
              width: 80,
              // margin: ,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  product.imageUrl,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 10),
              child: Column(
                children: [
                  Row(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            ProductEditScreen.routeName,
                            arguments: product.id,
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Rs.${product.price}',
                        style: const TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '${product.units} units',
                        style: const TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
