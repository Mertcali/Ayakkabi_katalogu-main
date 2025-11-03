class ShoeModel {
  final String id;
  final String name;
  final String brand;
  final String color;
  final String sizeRange;
  final String imagePath; // Ana görsel (geriye dönük uyumluluk için)
  final List<String> images; // Ürünün tüm görselleri
  final String category;
  final String gender;

  ShoeModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.color,
    required this.sizeRange,
    required this.imagePath,
    List<String>? images, // Opsiyonel, verilmezse imagePath kullanılır
    required this.category,
    required this.gender,
  }) : images = images ?? [imagePath];
}

class CategoryModel {
  final String id;
  final String name;
  final String gender;
  final bool isActive;

  CategoryModel({
    required this.id,
    required this.name,
    required this.gender,
    this.isActive = true,
  });
}

class SizeGroup {
  final String id;
  final String name;
  final List<String> sizes;
  final String gender;
  final String category;

  SizeGroup({
    required this.id,
    required this.name,
    required this.sizes,
    required this.gender,
    required this.category,
  });
} 