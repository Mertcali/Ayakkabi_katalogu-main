import '../models/shoe_model.dart';

class DataService {
  static final List<ShoeModel> _shoes = [
    // Nike Air Force 1 - Kadın - Her renk için ayrı ürün
    ShoeModel(
      id: 'nike_af1_kadin_beyaz_36-40',
      name: 'Nike Air Force 1 Beyaz',
      brand: 'Nike',
      color: 'Beyaz',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/nike_airforce1_36-40/beyaz.jpg',
      images: [
        'assets/images/kadin/spor/nike_airforce1_36-40/beyaz.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/beyaz_yan.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/beyaz_arka.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/beyaz_detay.jpg',
      ],
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'nike_af1_kadin_siyah_36-40',
      name: 'Nike Air Force 1 Siyah',
      brand: 'Nike',
      color: 'Siyah',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/nike_airforce1_36-40/siyah.jpg',
      images: [
        'assets/images/kadin/spor/nike_airforce1_36-40/siyah.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/siyah_yan.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/siyah_arka.jpg',
      ],
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'nike_af1_kadin_kirmizi_36-40',
      name: 'Nike Air Force 1 Kırmızı',
      brand: 'Nike',
      color: 'Kırmızı',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/nike_airforce1_36-40/kirmizi.jpg',
      images: [
        'assets/images/kadin/spor/nike_airforce1_36-40/kirmizi.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/kirmizi_yan.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/kirmizi_arka.jpg',
      ],
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'nike_af1_kadin_mavi_36-40',
      name: 'Nike Air Force 1 Mavi',
      brand: 'Nike',
      color: 'Mavi',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/nike_airforce1_36-40/mavi.jpg',
      images: [
        'assets/images/kadin/spor/nike_airforce1_36-40/mavi.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/mavi_yan.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/mavi_arka.jpg',
      ],
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'nike_af1_kadin_yesil_36-40',
      name: 'Nike Air Force 1 Yeşil',
      brand: 'Nike',
      color: 'Yeşil',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/nike_airforce1_36-40/yesil.jpg',
      images: [
        'assets/images/kadin/spor/nike_airforce1_36-40/yesil.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/yesil_yan.jpg',
      ],
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'nike_af1_kadin_sari_36-40',
      name: 'Nike Air Force 1 Sarı',
      brand: 'Nike',
      color: 'Sarı',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/nike_airforce1_36-40/sari.jpg',
      images: [
        'assets/images/kadin/spor/nike_airforce1_36-40/sari.jpg',
        'assets/images/kadin/spor/nike_airforce1_36-40/sari_yan.jpg',
      ],
      category: 'spor',
      gender: 'kadin',
    ),

    // Nike Air Force 1 - Erkek
    ShoeModel(
      id: 'nike_af1_erkek_beyaz_36-40',
      name: 'Nike Air Force 1 Beyaz',
      brand: 'Nike',
      color: 'Beyaz',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/nike_airforce1_36-40/beyaz.jpg',
      images: [
        'assets/images/erkek/spor/nike_airforce1_36-40/beyaz.jpg',
        'assets/images/erkek/spor/nike_airforce1_36-40/beyaz_yan.jpg',
        'assets/images/erkek/spor/nike_airforce1_36-40/beyaz_arka.jpg',
      ],
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'nike_af1_erkek_siyah_36-40',
      name: 'Nike Air Force 1 Siyah',
      brand: 'Nike',
      color: 'Siyah',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/nike_airforce1_36-40/siyah.jpg',
      images: [
        'assets/images/erkek/spor/nike_airforce1_36-40/siyah.jpg',
        'assets/images/erkek/spor/nike_airforce1_36-40/siyah_yan.jpg',
        'assets/images/erkek/spor/nike_airforce1_36-40/siyah_arka.jpg',
      ],
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'nike_af1_erkek_kirmizi_36-40',
      name: 'Nike Air Force 1 Kırmızı',
      brand: 'Nike',
      color: 'Kırmızı',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/nike_airforce1_36-40/kirmizi.jpg',
      images: [
        'assets/images/erkek/spor/nike_airforce1_36-40/kirmizi.jpg',
        'assets/images/erkek/spor/nike_airforce1_36-40/kirmizi_yan.jpg',
      ],
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'nike_af1_erkek_mavi_36-40',
      name: 'Nike Air Force 1 Mavi',
      brand: 'Nike',
      color: 'Mavi',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/nike_airforce1_36-40/mavi.jpg',
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'nike_af1_erkek_yesil_36-40',
      name: 'Nike Air Force 1 Yeşil',
      brand: 'Nike',
      color: 'Yeşil',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/nike_airforce1_36-40/yesil.jpg',
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'nike_af1_erkek_sari_36-40',
      name: 'Nike Air Force 1 Sarı',
      brand: 'Nike',
      color: 'Sarı',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/nike_airforce1_36-40/sari.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Converse Chuck Taylor - Kadın
    ShoeModel(
      id: 'converse_chuck_kadin_beyaz_36-40',
      name: 'Converse Chuck Taylor Beyaz',
      brand: 'Converse',
      color: 'Beyaz',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/converse_chuck_36-40/beyaz.jpg',
      images: [
        'assets/images/kadin/spor/converse_chuck_36-40/beyaz.jpg',
        'assets/images/kadin/spor/converse_chuck_36-40/beyaz_yan.jpg',
        'assets/images/kadin/spor/converse_chuck_36-40/beyaz_arka.jpg',
      ],
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'converse_chuck_kadin_siyah_36-40',
      name: 'Converse Chuck Taylor Siyah',
      brand: 'Converse',
      color: 'Siyah',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/converse_chuck_36-40/siyah.jpg',
      images: [
        'assets/images/kadin/spor/converse_chuck_36-40/siyah.jpg',
        'assets/images/kadin/spor/converse_chuck_36-40/siyah_yan.jpg',
      ],
      category: 'spor',
      gender: 'kadin',
    ),

    // Converse Chuck Taylor - Erkek
    ShoeModel(
      id: 'converse_chuck_erkek_beyaz_36-40',
      name: 'Converse Chuck Taylor Beyaz',
      brand: 'Converse',
      color: 'Beyaz',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/converse_chuck_36-40/beyaz.jpg',
      images: [
        'assets/images/erkek/spor/converse_chuck_36-40/beyaz.jpg',
        'assets/images/erkek/spor/converse_chuck_36-40/beyaz_yan.jpg',
      ],
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'converse_chuck_erkek_siyah_36-40',
      name: 'Converse Chuck Taylor Siyah',
      brand: 'Converse',
      color: 'Siyah',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/converse_chuck_36-40/siyah.jpg',
      images: [
        'assets/images/erkek/spor/converse_chuck_36-40/siyah.jpg',
        'assets/images/erkek/spor/converse_chuck_36-40/siyah_yan.jpg',
        'assets/images/erkek/spor/converse_chuck_36-40/siyah_arka.jpg',
      ],
      category: 'spor',
      gender: 'erkek',
    ),

    // Converse One Star - Kadın
    ShoeModel(
      id: 'converse_one_star_kadin_beyaz_36-40',
      name: 'Converse One Star Beyaz',
      brand: 'Converse',
      color: 'Beyaz',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/converse_one_star_36-40/beyaz.jpg',
      images: [
        'assets/images/kadin/spor/converse_one_star_36-40/beyaz.jpg',
        'assets/images/kadin/spor/converse_one_star_36-40/beyaz_yan.jpg',
      ],
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'converse_one_star_kadin_siyah_36-40',
      name: 'Converse One Star Siyah',
      brand: 'Converse',
      color: 'Siyah',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/converse_one_star_36-40/siyah.jpg',
      images: [
        'assets/images/kadin/spor/converse_one_star_36-40/siyah.jpg',
        'assets/images/kadin/spor/converse_one_star_36-40/siyah_yan.jpg',
        'assets/images/kadin/spor/converse_one_star_36-40/siyah_arka.jpg',
      ],
      category: 'spor',
      gender: 'kadin',
    ),

    // Converse One Star - Erkek
    ShoeModel(
      id: 'converse_one_star_erkek_beyaz_36-40',
      name: 'Converse One Star Beyaz',
      brand: 'Converse',
      color: 'Beyaz',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/converse_one_star_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'converse_one_star_erkek_siyah_36-40',
      name: 'Converse One Star Siyah',
      brand: 'Converse',
      color: 'Siyah',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/converse_one_star_36-40/siyah.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Puma RS-X - Kadın 36-40
    ShoeModel(
      id: 'puma_rsx_kadin_beyaz_36-40',
      name: 'Puma RS-X Beyaz',
      brand: 'Puma',
      color: 'Beyaz',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/puma_rsx_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'puma_rsx_kadin_siyah_36-40',
      name: 'Puma RS-X Siyah',
      brand: 'Puma',
      color: 'Siyah',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/puma_rsx_36-40/siyah.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'puma_rsx_kadin_mavi_36-40',
      name: 'Puma RS-X Mavi',
      brand: 'Puma',
      color: 'Mavi',
      sizeRange: '36-40',
      imagePath: 'assets/images/kadin/spor/puma_rsx_36-40/mavi.jpg',
      category: 'spor',
      gender: 'kadin',
    ),

    // Puma RS-X - Erkek 36-40
    ShoeModel(
      id: 'puma_rsx_erkek_beyaz_36-40',
      name: 'Puma RS-X Beyaz',
      brand: 'Puma',
      color: 'Beyaz',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/puma_rsx_36-40/beyaz.jpg',
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'puma_rsx_erkek_siyah_36-40',
      name: 'Puma RS-X Siyah',
      brand: 'Puma',
      color: 'Siyah',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/puma_rsx_36-40/siyah.jpg',
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'puma_rsx_erkek_mavi_36-40',
      name: 'Puma RS-X Mavi',
      brand: 'Puma',
      color: 'Mavi',
      sizeRange: '36-40',
      imagePath: 'assets/images/erkek/spor/puma_rsx_36-40/mavi.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Puma RS-X - Kadın 40-44
    ShoeModel(
      id: 'puma_rsx_kadin_beyaz_40-44',
      name: 'Puma RS-X Beyaz',
      brand: 'Puma',
      color: 'Beyaz',
      sizeRange: '40-44',
      imagePath: 'assets/images/kadin/spor/puma_rsx_40-44/beyaz.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'puma_rsx_kadin_siyah_40-44',
      name: 'Puma RS-X Siyah',
      brand: 'Puma',
      color: 'Siyah',
      sizeRange: '40-44',
      imagePath: 'assets/images/kadin/spor/puma_rsx_40-44/siyah.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'puma_rsx_kadin_mavi_40-44',
      name: 'Puma RS-X Mavi',
      brand: 'Puma',
      color: 'Mavi',
      sizeRange: '40-44',
      imagePath: 'assets/images/kadin/spor/puma_rsx_40-44/mavi.jpg',
      category: 'spor',
      gender: 'kadin',
    ),

    // Puma RS-X - Erkek 40-44
    ShoeModel(
      id: 'puma_rsx_erkek_beyaz_40-44',
      name: 'Puma RS-X Beyaz',
      brand: 'Puma',
      color: 'Beyaz',
      sizeRange: '40-44',
      imagePath: 'assets/images/erkek/spor/puma_rsx_40-44/beyaz.jpg',
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'puma_rsx_erkek_siyah_40-44',
      name: 'Puma RS-X Siyah',
      brand: 'Puma',
      color: 'Siyah',
      sizeRange: '40-44',
      imagePath: 'assets/images/erkek/spor/puma_rsx_40-44/siyah.jpg',
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'puma_rsx_erkek_mavi_40-44',
      name: 'Puma RS-X Mavi',
      brand: 'Puma',
      color: 'Mavi',
      sizeRange: '40-44',
      imagePath: 'assets/images/erkek/spor/puma_rsx_40-44/mavi.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Adidas Superstar - Kadın 40-44
    ShoeModel(
      id: 'adidas_superstar_kadin_beyaz_40-44',
      name: 'Adidas Superstar Beyaz',
      brand: 'Adidas',
      color: 'Beyaz',
      sizeRange: '40-44',
      imagePath: 'assets/images/kadin/spor/adidas_superstar_40-44/beyaz.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'adidas_superstar_kadin_mavi_40-44',
      name: 'Adidas Superstar Mavi',
      brand: 'Adidas',
      color: 'Mavi',
      sizeRange: '40-44',
      imagePath: 'assets/images/kadin/spor/adidas_superstar_40-44/mavi.jpg',
      category: 'spor',
      gender: 'kadin',
    ),
    ShoeModel(
      id: 'adidas_superstar_kadin_kirmizi_40-44',
      name: 'Adidas Superstar Kırmızı',
      brand: 'Adidas',
      color: 'Kırmızı',
      sizeRange: '40-44',
      imagePath: 'assets/images/kadin/spor/adidas_superstar_40-44/kirmizi.jpg',
      category: 'spor',
      gender: 'kadin',
    ),

    // Adidas Superstar - Erkek 40-44
    ShoeModel(
      id: 'adidas_superstar_erkek_beyaz_40-44',
      name: 'Adidas Superstar Beyaz',
      brand: 'Adidas',
      color: 'Beyaz',
      sizeRange: '40-44',
      imagePath: 'assets/images/erkek/spor/adidas_superstar_40-44/beyaz.jpg',
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'adidas_superstar_erkek_mavi_40-44',
      name: 'Adidas Superstar Mavi',
      brand: 'Adidas',
      color: 'Mavi',
      sizeRange: '40-44',
      imagePath: 'assets/images/erkek/spor/adidas_superstar_40-44/mavi.jpg',
      category: 'spor',
      gender: 'erkek',
    ),
    ShoeModel(
      id: 'adidas_superstar_erkek_kirmizi_40-44',
      name: 'Adidas Superstar Kırmızı',
      brand: 'Adidas',
      color: 'Kırmızı',
      sizeRange: '40-44',
      imagePath: 'assets/images/erkek/spor/adidas_superstar_40-44/kirmizi.jpg',
      category: 'spor',
      gender: 'erkek',
    ),

    // Adidas Labubu - Bebe (21-25)
    ShoeModel(
      id: 'adidas_labubu_bebe_mavi',
      name: 'Adidas Labubu Bebe Mavi',
      brand: 'Adidas',
      color: 'Mavi',
      sizeRange: '21-25',
      imagePath: 'assets/images/cocuk/spor/bebe/adidas_labubu_bebe/mavi.jpg',
      category: 'bebe',
      gender: 'cocuk',
    ),
    ShoeModel(
      id: 'adidas_labubu_bebe_siyah',
      name: 'Adidas Labubu Bebe Siyah',
      brand: 'Adidas',
      color: 'Siyah',
      sizeRange: '21-25',
      imagePath: 'assets/images/cocuk/spor/bebe/adidas_labubu_bebe/siyah.jpg',
      category: 'bebe',
      gender: 'cocuk',
    ),

    // Adidas Labubu - Patik (26-30)
    ShoeModel(
      id: 'adidas_labubu_patik_mavi',
      name: 'Adidas Labubu Patik Mavi',
      brand: 'Adidas',
      color: 'Mavi',
      sizeRange: '26-30',
      imagePath: 'assets/images/cocuk/spor/patik/adidas_labubu_patik/mavi.jpg',
      category: 'patik',
      gender: 'cocuk',
    ),
    ShoeModel(
      id: 'adidas_labubu_patik_siyah',
      name: 'Adidas Labubu Patik Siyah',
      brand: 'Adidas',
      color: 'Siyah',
      sizeRange: '26-30',
      imagePath: 'assets/images/cocuk/spor/patik/adidas_labubu_patik/siyah.jpg',
      category: 'patik',
      gender: 'cocuk',
    ),

    // Adidas Labubu - Filet (31-35)
    ShoeModel(
      id: 'adidas_labubu_filet_mavi',
      name: 'Adidas Labubu Filet Mavi',
      brand: 'Adidas',
      color: 'Mavi',
      sizeRange: '31-35',
      imagePath: 'assets/images/cocuk/spor/filet/adidas_labubu_filet/mavi.jpg',
      category: 'filet',
      gender: 'cocuk',
    ),
    ShoeModel(
      id: 'adidas_labubu_filet_siyah',
      name: 'Adidas Labubu Filet Siyah',
      brand: 'Adidas',
      color: 'Siyah',
      sizeRange: '31-35',
      imagePath: 'assets/images/cocuk/spor/filet/adidas_labubu_filet/siyah.jpg',
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

  static List<ShoeModel> getShoesByCategory(String category) {
    return _shoes.where((shoe) => shoe.category == category).toList();
  }

  static List<ShoeModel> getNewProducts({int limit = 10}) {
    // Return the last N products as "new"
    final allShoes = getAllShoes();
    if (allShoes.length <= limit) {
      return allShoes;
    }
    return allShoes.sublist(allShoes.length - limit);
  }

  static ShoeModel? getShoeById(String id) {
    try {
      return _shoes.firstWhere((shoe) => shoe.id == id);
    } catch (e) {
      return null;
    }
  }

  // Aynı marka, kategori ve cinsiyet için farklı renk/numara varyantlarını getir
  static List<ShoeModel> getProductVariants(ShoeModel product) {
    return _shoes.where((shoe) => 
      shoe.brand == product.brand &&
      shoe.category == product.category &&
      shoe.gender == product.gender &&
      shoe.name.split(' ').take(shoe.name.split(' ').length - 1).join(' ') == 
      product.name.split(' ').take(product.name.split(' ').length - 1).join(' ')
    ).toList();
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