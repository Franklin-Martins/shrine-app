import 'package:flutter/material.dart';
import 'package:shrine/supplemental/cute_corners_border.dart';

import 'home.dart';
import 'login.dart';
import 'colors.dart';
import 'backdrop.dart';
import './model/product.dart';
import './category_menu_page.dart';

class ShrineApp extends StatefulWidget {
  const ShrineApp({super.key});

  @override
  State<ShrineApp> createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category){
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'shrine',
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context)=> const LoginPage(),
        '/':(BuildContext context) => Backdrop(
          currentCategory: Category.all,
          backLayer: CategoryMenuPage(
            currentCategory: _currentCategory, 
            onCategoryTap: _onCategoryTap
          ),
          frontLayer: HomePage(category: _currentCategory),
          frontTitle: const Text('Shrine'),
          backTitle: const Text('Shrine'),
        )
      },
      theme: _kShrineTheme,
    );
  }
}

final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme(){
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kShrineBrown900
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: kShrineBrown900,
      )
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kShrinePink100
    )
  );
}

TextTheme _buildShrineTextTheme(TextTheme base){
  return base.copyWith(
    headlineSmall: base.headlineSmall!.copyWith(
      fontWeight: FontWeight.w500,
    ),
    titleLarge: base.titleLarge!.copyWith(
      fontSize: 18.0,
    ),
    bodySmall: base.bodySmall!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0
    ),
    bodyLarge: base.bodyLarge!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}