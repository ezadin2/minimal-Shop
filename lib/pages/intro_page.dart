import 'package:flutter/material.dart';
import 'package:tod/component/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 25),
            //title
            Text(
              "Minimal shop",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            //subtitle
            SizedBox(
              height: 10,
            ),
            Text(
              "Premium Quility Products",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            //button
            SizedBox(
              height: 25,
            ),
            MyButton(
               onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
