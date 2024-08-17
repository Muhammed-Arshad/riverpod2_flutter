import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_flutter/providers/cart_provider.dart';
import 'package:riverpod2_flutter/shared/cart_icon.dart';

import '../../providers/product_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final allProducts = ref.watch(productsProvider);
    final cartProduct = ref.watch(cartNotifierProvider);



    return Scaffold(
      appBar: AppBar(
        title: Text("Garage sale products"),
        actions: [
          CartIcon()
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: allProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.9
            ),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.all(20),
                color: Colors.blueGrey.withOpacity(0.05),
                child: Column(
                  children: [
                    Container(height: 60,width: 60,color: Colors.blue),
                    Text(allProducts[index].title),
                    Text("\$${allProducts[index].price}"),

                    if(cartProduct.contains(allProducts[index]))
                      TextButton(onPressed: (){
                        ref.read(cartNotifierProvider.notifier).removeProduct(allProducts[index]);
                      }, child: Text('Remove')),
                    if(!cartProduct.contains(allProducts[index]))
                      TextButton(onPressed: (){
                        ref.read(cartNotifierProvider.notifier).addProduct(allProducts[index]);
                      }, child: Text('Add to Cart'))

                  ],
                ),
              );
            }),
      ),
    );
  }
}
