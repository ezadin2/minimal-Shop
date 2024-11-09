import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tod/component/my_drawer.dart';
import 'package:tod/component/my_product_tile.dart';
import 'package:tod/main.dart';
import 'package:tod/models/shop.dart';

class ShopPages extends StatelessWidget {
  const ShopPages({super.key});

  @override
  Widget build(BuildContext context) {
    //Access products in shop
    final products = context.watch<Shop>().shop;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Shop Page"),
          actions: [
            //go to cart Button
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart_page'),
                icon: Icon(Icons.shopping_cart_outlined))
          ],
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          //shop sub title

          //product list
          children: [
            SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              'Selected List of Premium Products',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            )),
            SizedBox(
              height: 550,
              child: ListView.builder(
                  itemCount: products.length,
                  padding: EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    //get each individual Products from the shop
                    final product = products[index];
                    //return as a product tile ui
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
