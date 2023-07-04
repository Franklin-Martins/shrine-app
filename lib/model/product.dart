enum Category{
  all,
  accessories,
  clothing,
  home
}

class Product {
  final Category category;
  final int id;
  final bool isFeatured;
  final String name;
  final int price;

  const Product({
    required this.category,
    required this.id,
    required this.isFeatured,
    required this.name,
    required this.price
  });

  String get assetName {
    return '$id-0.jpg';
  }

  String get assetPackage {
    return 'shrine_images';
  }

  @override
  String toString() {
    return "$name (id=$id)";
  }
}