import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod2_flutter/models/product.dart';

class CartNotifier extends Notifier<Set<Product>>{

  //initial value
  @override
  Set<Product> build() {
    return const {
      Product(title: "Denim jeans", price: 33, image: "image", id: '3')
    };
  }

  void addProduct(Product product){
    if(!state.contains(product)){
      state = {...state,product};
    }
  }

  void removeProduct(Product product){
    if(state.contains(product)){
      state = state.where((p) => p.id != product.id).toSet();
    }
  }

}

final cartNotifierProvider = NotifierProvider<CartNotifier,Set<Product>>((){
  return CartNotifier();
});