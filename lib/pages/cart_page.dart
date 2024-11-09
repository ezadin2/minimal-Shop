import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tod/component/my_button.dart';
import 'package:tod/models/product.dart';
import 'package:tod/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Remove item from the cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item from the cart?"),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text("CANCEL"),
          ),
          // Yes button
          MaterialButton(
            onPressed: () {
              // Pop dialog box
              Navigator.pop(context);
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("YES"),
          )
        ],
      ),
    );
  }

  // User clicks the "Pay" button
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("User wants to pay! Connect this app to your payment backend."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Cart list
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your Cart is Empty.."))
                : ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                // Get individual item
                final item = cart[index];
                // Return as a cart tile UI
                return ListTile(
                  leading: Image.asset(
                    item.imagePath,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(item.name),
                  subtitle: Text("\$${item.price.toStringAsFixed(2)}"),
                  trailing: IconButton(
                    onPressed: () => removeItemFromCart(context, item),
                    icon: Icon(Icons.remove),
                  ),
                );
              },
            ),
          ),
          // Pay button
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              child: Text("Pay Now"),
              onTap: () => payButtonPressed(context),
            ),
          ),
        ],
      ),
    );
  }
}
