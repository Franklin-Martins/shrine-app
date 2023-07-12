import 'package:flutter/material.dart';

import './colors.dart';
import './model/product.dart';

class CategoryMenuPage extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCategoryTap;
  final List<Category> _categories = Category.values;
  const CategoryMenuPage({
    required this.currentCategory,
    required this.onCategoryTap,
    Key? key
  }): super(key: key);

  Widget _buildCategory(Category category, BuildContext context){
    final categoryString = category.toString().replaceAll('Category.', '').toUpperCase();
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: ()=> onCategoryTap(category),
      child: currentCategory == category
      ? Column(
        children: <Widget>[
          const SizedBox(height: 16.0,),
          Text(
            categoryString,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 14.0,),
          Container(
            width: 70.0,
            height: 2.0,
            color: kShrinePink400,
          )
        ],
      )
      : Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          categoryString,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: kShrineBrown900.withAlpha(153),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: kShrinePink100,
        padding: const EdgeInsets.only(top: 40.0),
        child: ListView(
          children: _categories.map((Category category)=> _buildCategory(category, context)).toList(),
        ),
      ),
    );
  }
}