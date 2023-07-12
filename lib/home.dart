import 'package:flutter/material.dart';
import 'package:shrine/model/product.dart';
import 'package:shrine/model/products_repository.dart';
import 'package:shrine/supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category category;
  const HomePage({
    this.category = Category.all,
    Key? key
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return AsymmetricView(products: ProductsRepository.loadProducts(category));
  }
}