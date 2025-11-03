class ShoeModel {
  final String id;
  final String name;
  final String brand;
  final List<String> colors;
  final List<String> sizes;
  final String imagePath;
  final String category;
  final String gender;

  ShoeModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.colors,
    required this.sizes,
    required this.imagePath,
    required this.category,
    required this.gender,
  });

  // Renk bazlı görsel yolu almak için
  String getImagePathForColor(String color) {
    // Mevcut imagePath'den klasör yolunu al
    final pathParts = imagePath.split('/');
    final directory = pathParts.sublist(0, pathParts.length - 1).join('/');
    
    // Renk adını küçük harfe çevir ve Türkçe karakterleri düzelt
    String colorFileName = color.toLowerCase();
    
    // Türkçe karakterleri düzelt
    final turkishCharMap = {
      'ı': 'i',
      'ş': 's', 
      'ğ': 'g',
      'ü': 'u',
      'ö': 'o',
      'ç': 'c',
      'kırmızı': 'kirmizi',
      'yeşil': 'yesil',
      'sarı': 'sari',
    };
    
    // Önce tam kelime eşleşmelerini kontrol et
    if (turkishCharMap.containsKey(colorFileName)) {
      colorFileName = turkishCharMap[colorFileName]!;
    } else {
      // Sonra tek karakter eşleşmelerini uygula
      for (final entry in turkishCharMap.entries) {
        if (entry.key.length == 1) {
          colorFileName = colorFileName.replaceAll(entry.key, entry.value);
        }
      }
    }
    
    final finalPath = '$directory/$colorFileName.jpg';
    // Debug: Generated path for color
    return finalPath;
  }
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