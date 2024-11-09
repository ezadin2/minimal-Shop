import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tod/models/product.dart';

import '../models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});
//add to cart button
  void addToCart(BuildContext context){
    //sgow a dialog box to ask to confirm to add to cart
    showDialog(context: context, builder: (context)=>AlertDialog(
      content: Text("Add This item to cart?"),
      actions: [
        //cancel button
        MaterialButton(
          onPressed:() => Navigator.pop(context),
        child:Text("CANCEL"),
        ),
        //yes button
        MaterialButton(
          onPressed:() {

            //pop dialog box
            Navigator.pop(context);
            context.read<Shop>().addToCart(product);
          },
          child:Text("yes"),
        )
      ],
    ),);

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(25),
                    width: double.infinity,
                    child: Image.asset(product.imagePath)),
              ),
              //product name
              SizedBox(
                height: 20,
              ),
              Text(
                product.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              //product desciption
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          //product price add to the cart
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$' + product.price.toStringAsFixed(2)),
              Container(
                decoration:BoxDecoration(color: Theme.of(context).colorScheme.secondary,borderRadius: BorderRadius.circular(12)),
                  child: IconButton(onPressed: () => addToCart(context), icon: Icon(Icons.add)))
            ],
          ),
        ],
      ),
    );
  }
}
