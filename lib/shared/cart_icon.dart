import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_flutter/providers/cart_provider.dart';

import '../screens/cart/cart_screen.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final numOfItemsInCart = ref.watch(cartNotifierProvider).length;

    return Stack(
      children: [
        IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:
              (context) => CartScreen()));
            },
            icon: Icon(Icons.shopping_bag_outlined)),
        Positioned(
          top: 5,
            left: 5,
            child: Container(
              width: 18,
              height: 18,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueAccent
              ),
              child: Center(
                child: Text(numOfItemsInCart.toString()),
              ),
            )),
      ],
    );
  }
}
