import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';

part 'product_provider.g.dart';

const List<Product> allProduct = [
  Product(title: "Groovy shorts", price: 12, image: "image", id: '1'),
  Product(title: "Karati kit", price: 22, image: "image", id: '2'),
  Product(title: "Denim jeans", price: 33, image: "image", id: '3'),
  Product(title: "Red backpack", price: 42, image: "image", id: '4'),
  Product(title: "Drum & Sticks", price: 54, image: "image", id: '5'),
  Product(title: "Blue suitcase", price:13, image: "image", id: '6'),
  Product(title: "Roller skate", price: 18, image: "image", id: '7'),
  Product(title: "Electric guitar", price: 11, image: "image", id: '8')
];


@riverpod
List<Product> products(ref){
  return allProduct;
}
