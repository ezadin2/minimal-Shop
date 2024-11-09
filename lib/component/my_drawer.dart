import 'package:flutter/material.dart';
import 'package:tod/component/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
          children: [
            //Drawer header
            DrawerHeader(
                child: Center(
                    child: Icon(
                      Icons.shopping_bag,
                      size: 72,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ))),
            SizedBox(
              height: 25,
            ),
            MyListTile(text: 'shop', icon: Icons.home, onTap: () => Navigator.pop(context)),
            MyListTile(text: 'Cart', icon: Icons.shopping_cart, onTap: () {
              //pop Drawer first
             Navigator.pop(context);

              //go to cart page`
              Navigator.pushNamed(context,'/cart_page');
            }),
          ],
        ),
          //shop tile

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(text: 'Exit', icon: Icons.logout, onTap: () => Navigator.pushNamedAndRemoveUntil(context,'/intro_page',(route)=>false)),
          ),

          //cart tile

          //exit
        ],
      ),
    );
  }
}
