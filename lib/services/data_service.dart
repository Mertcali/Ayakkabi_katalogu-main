import '../models/shoe_model.dart';

class DataService {
  static final List<ShoeModel> _shoes = [
    // Nike Air Force 1 - 36-40, 6 renk (Kadın & Erkek)
    ShoeModel(
      id: 'nike_af1_kadin_36-40',
      name: 'Nike Air Force 1',
      brand: 'Nike',
      colors: ['Beyaz', 'Siyah', 'Kırmızı', 'Mavi', 'Yeşil', 'Sarı'],
      sizes: ['36', '37', '38', '39', '40'],
      imagePath: 'assets/images/kadin/spor/nike_airforce1_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'nike_af1_erkek_36-40',
      name: 'Nike Air Force 1',
      brand: 'Nike',
      colors: ['Beyaz', 'Siyah', 'Kırmızı', 'Mavi', 'Yeşil', 'Sarı'],
      sizes: ['36', '37', '38', '39', '40'],
      imagePath: 'assets/images/erkek/spor/nike_airforce1_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Converse Chuck Taylor - 36-40, 2 renk (Kadın & Erkek)
    ShoeModel(
      id: 'converse_chuck_kadin_36-40',
      name: 'Converse Chuck Taylor',
      brand: 'Converse',
      colors: ['Beyaz', 'Siyah'],
      sizes: ['36', '37', '38', '39', '40'],
      imagePath: 'assets/images/kadin/spor/converse_chuck_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'converse_chuck_erkek_36-40',
      name: 'Converse Chuck Taylor',
      brand: 'Converse',
      colors: ['Beyaz', 'Siyah'],
      sizes: ['36', '37', '38', '39', '40'],
      imagePath: 'assets/images/erkek/spor/converse_chuck_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Converse One Star - 36-40, 2 renk (Kadın & Erkek)
    ShoeModel(
      id: 'converse_one_star_kadin_36-40',
      name: 'Converse One Star',
      brand: 'Converse',
      colors: ['Beyaz', 'Siyah'],
      sizes: ['36', '37', '38', '39', '40'],
      imagePath: 'assets/images/kadin/spor/converse_one_star_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'converse_one_star_erkek_36-40',
      name: 'Converse One Star',
      brand: 'Converse',
      colors: ['Beyaz', 'Siyah'],
      sizes: ['36', '37', '38', '39', '40'],
      imagePath: 'assets/images/erkek/spor/converse_one_star_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Puma RS-X - 36-40, 3 renk (Kadın & Erkek)
    ShoeModel(
      id: 'puma_rsx_kadin_36-40',
      name: 'Puma RS-X',
      brand: 'Puma',
      colors: ['Beyaz', 'Siyah', 'Mavi'],
      sizes: ['36', '37', '38', '39', '40'],
      imagePath: 'assets/images/kadin/spor/puma_rsx_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'puma_rsx_erkek_36-40',
      name: 'Puma RS-X',
      brand: 'Puma',
      colors: ['Beyaz', 'Siyah', 'Mavi'],
      sizes: ['36', '37', '38', '39', '40'],
      imagePath: 'assets/images/erkek/spor/puma_rsx_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Puma RS-X - 40-44, 3 renk (Kadın & Erkek)
    ShoeModel(
      id: 'puma_rsx_kadin_40-44',
      name: 'Puma RS-X',
      brand: 'Puma',
      colors: ['Beyaz', 'Siyah', 'Mavi'],
      sizes: ['40', '41', '42', '43', '44'],
      imagePath: 'assets/images/kadin/spor/puma_rsx_40-44/beyaz.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'puma_rsx_erkek_40-44',
      name: 'Puma RS-X',
      brand: 'Puma',
      colors: ['Beyaz', 'Siyah', 'Mavi'],
      sizes: ['40', '41', '42', '43', '44'],
      imagePath: 'assets/images/erkek/spor/puma_rsx_40-44/beyaz.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Adidas Superstar - 40-44, 3 renk (Kadın & Erkek) - Sadece mevcut renkler
    ShoeModel(
      id: 'adidas_superstar_kadin_40-44',
      name: 'Adidas Superstar',
      brand: 'Adidas',
      colors: ['Beyaz', 'Mavi', 'Kırmızı'],
      sizes: ['40', '41', '42', '43', '44'],
      imagePath: 'assets/images/kadin/spor/adidas_superstar_40-44/beyaz.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'adidas_superstar_erkek_40-44',
      name: 'Adidas Superstar',
      brand: 'Adidas',
      colors: ['Beyaz', 'Mavi', 'Kırmızı'],
      sizes: ['40', '41', '42', '43', '44'],
      imagePath: 'assets/images/erkek/spor/adidas_superstar_40-44/beyaz.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Adidas Labubu (Çocuk) - Bebe (21-25), Patik (26-30), Filet (31-35), 2 renk
    ShoeModel(
      id: 'adidas_labubu_bebe',
      name: 'Adidas Labubu Bebe',
      brand: 'Adidas',
      colors: ['Mavi', 'Siyah'],
      sizes: ['21', '22', '23', '24', '25'],
      imagePath: 'assets/images/cocuk/spor/bebe/adidas_labubu_bebe/mavi.jpg',
      category: 'bebe',
      gender: 'cocuk',
    ),
    ShoeModel(
      id: 'adidas_labubu_patik',
      name: 'Adidas Labubu Patik',
      brand: 'Adidas',
      colors: ['Mavi', 'Siyah'],
      sizes: ['26', '27', '28', '29', '30'],
      imagePath: 'assets/images/cocuk/spor/patik/adidas_labubu_patik/mavi.jpg',
      category: 'patik',
      gender: 'cocuk',
    ),
    ShoeModel(
      id: 'adidas_labubu_filet',
      name: 'Adidas Labubu Filet',
      brand: 'Adidas',
      colors: ['Mavi', 'Siyah'],
      sizes: ['31', '32', '33', '34', '35'],
      imagePath: 'assets/images/cocuk/spor/filet/adidas_labubu_filet/mavi.jpg',
      category: 'filet',
      gender: 'cocuk',
    ),
  ];

  static List<ShoeModel> getAllShoes() {
    // Expose a read-only view of all shoes
    return List<ShoeModel>.unmodifiable(_shoes);
  }

  static List<ShoeModel> getShoesByGenderAndCategory(String gender, String category) {
    return _shoes.where((shoe) => 
      shoe.gender == gender && shoe.category == category
    ).toList();
  }

  static List<ShoeModel> getShoesByGender(String gender) {
    return _shoes.where((shoe) => shoe.gender == gender).toList();
  }

  static ShoeModel? getShoeById(String id) {
    try {
      return _shoes.firstWhere((shoe) => shoe.id == id);
    } catch (e) {
      return null;
    }
  }

  static List<CategoryModel> getCategoriesByGender(String gender) {
    return [
      CategoryModel(
        id: 'spor',
        name: 'Spor Ayakkabı',
        gender: gender,
        isActive: true,
      ),
      CategoryModel(
        id: 'tekstil',
        name: 'Tekstil Ayakkabı',
        gender: gender,
        isActive: false,
      ),
      CategoryModel(
        id: 'canta',
        name: 'Çanta',
        gender: gender,
        isActive: false,
      ),
      CategoryModel(
        id: 'terlik',
        name: 'Terlik',
        gender: gender,
        isActive: false,
      ),
    ];
  }

  static List<SizeGroup> getSizeGroupsByGenderAndCategory(String gender, String category) {
    if (gender == 'cocuk') {
      // Çocuk için Bebe, Patik, Filet numara aralıkları
      return [
        SizeGroup(
          id: 'bebe',
          name: 'Bebe',
          sizes: ['16', '17', '18', '19', '20', '21', '22', '23', '24', '25'],
          gender: gender,
          category: category,
        ),
        SizeGroup(
          id: 'patik',
          name: 'Patik',
          sizes: ['26', '27', '28', '29', '30', '31', '32'],
          gender: gender,
          category: category,
        ),
        SizeGroup(
          id: 'filet',
          name: 'Filet',
          sizes: ['33', '34', '35', '36', '37', '38'],
          gender: gender,
          category: category,
        ),
      ];
    } else if (gender == 'kadin') {
      // Kadın için numara aralıkları
      return [
        SizeGroup(
          id: '36-41',
          name: 'Numara 36-41',
          sizes: ['36', '37', '38', '39', '40', '41'],
          gender: gender,
          category: category,
        ),
      ];
    } else {
      // Erkek için numara aralıkları
      return [
        SizeGroup(
          id: '36-41',
          name: 'Numara 36-41',
          sizes: ['36', '37', '38', '39', '40', '41'],
          gender: gender,
          category: category,
        ),
        SizeGroup(
          id: '42-47',
          name: 'Numara 42-47',
          sizes: ['42', '43', '44', '45', '46', '47'],
          gender: gender,
          category: category,
        ),
      ];
    }
  }
} 