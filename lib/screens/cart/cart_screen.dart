import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_flutter/providers/cart_provider.dart';
import 'package:riverpod2_flutter/providers/product_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {

  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {

    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your cart'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((product) {
                return Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Row(
                    children: [
                      Container(height: 60,width: 60,color: Colors.blue,),
                      SizedBox(width: 10,),
                      Text('${product.title}...'),
                      Expanded(child: SizedBox()),
                      Text('\$${product.price}')
                    ],
                  ),
                );
              }).toList()
            )
          ],
        ),
      ),
    );
  }
}
