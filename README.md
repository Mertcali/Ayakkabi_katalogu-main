# Ayakkabı Kataloğu - Turkish Shoe Catalog

Modern, clean, and mobile-friendly cross-platform Flutter app for a Turkish shoe catalog. The application is fully in Turkish and designed for both iOS and Android platforms.

## Features

### Ana Sayfa (Home Page)
- **Kampanya** - Campaign section (placeholder)
- **Aksesuar** - Accessories section (placeholder)  
- **Özel Numara** - Special sizes section (placeholder)
- **Cinsiyet Seçimi** - Gender selection:
  - Kadın (Women)
  - Erkek (Men)
  - Çocuk (Children)

### Cinsiyet Seçimi (Gender Selection)
When user selects **Kadın**, **Erkek**, or **Çocuk**, shows these subcategories:
- **Spor Ayakkabı** (Sports Shoes) - Currently functional
- **Tekstil** (Textile) - Placeholder
- **Çanta** (Bags) - Placeholder
- **Terlik** (Slippers) - Placeholder

### Spor Ayakkabı Sayfası (Sports Shoes Page)
- **Kadın & Erkek**: Size range buttons (36-40, 40-44)
- **Çocuk**: Bebe, Patik, Filet categories

### Modeller Sayfası (Models Page)
- Vertical list of available shoe models
- One model per row with image and name
- Navigation to detail page

### Ürün Detay Sayfası (Product Detail Page)
- Shoe images with navigation dots
- Available color options (clickable buttons)
- Size selection
- Add to favorites and cart buttons

## Sample Data

The app includes sample data for:

### Nike Ayakkabı (Kadın & Erkek)
- Size range: 36-40
- 6 colors: Beyaz, Siyah, Kırmızı, Mavi, Yeşil, Sarı

### Converse (Kadın & Erkek)
- Size range: 36-40
- 2 models: Chuck Taylor, One Star
- Each model has 2 colors

### Puma (Kadın & Erkek)
- Size ranges: 36-40 and 40-44
- 3 colors: Beyaz, Siyah, Mavi

### Nike Air Force 1 (Kadın & Erkek)
- Size ranges: 36-40 and 40-44
- 6 colors: Beyaz, Siyah, Kırmızı, Mavi, Yeşil, Sarı

### Adidas Superstar (Kadın & Erkek)
- Size range: 40-44
- 8 colors: Beyaz, Siyah, Kırmızı, Mavi, Yeşil, Sarı, Turuncu, Mor

### Adidas Labubu (Çocuk)
- **Bebe**: Sizes 21-25, 6 colors
- **Patik**: Sizes 26-30, 6 colors  
- **Filet**: Sizes 31-35, 6 colors

## Navigation Features

- Back button in top-left corner on every screen
- Android physical back button support
- Theme toggle button in app bar ("Tasarımı Değiştir")
- Light/dark theme switching with persistent storage

## Image Organization

To add your product images, organize them in the following structure:

```
assets/images/
├── kadin/
│   └── spor/
│       ├── nike_air_max.jpg
│       ├── converse_chuck.jpg
│       ├── converse_one_star.jpg
│       ├── puma_rsx.jpg
│       ├── nike_af1.jpg
│       └── adidas_superstar.jpg
├── erkek/
│   └── spor/
│       ├── nike_air_max.jpg
│       ├── converse_chuck.jpg
│       ├── converse_one_star.jpg
│       ├── puma_rsx.jpg
│       ├── nike_af1.jpg
│       └── adidas_superstar.jpg
└── cocuk/
    ├── bebe/
    │   └── adidas_labubu_bebe.jpg
    ├── patik/
    │   └── adidas_labubu_patik.jpg
    └── filet/
        └── adidas_labubu_filet.jpg
```

### Image Naming Convention
- Use descriptive names that match the product
- Include brand name in filename
- Use lowercase with underscores
- Example: `nike_air_max.jpg`, `converse_chuck_taylor.jpg`

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Android Studio / VS Code
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd ayakkabi_katalogu
```

2. Install dependencies:
```bash
flutter pub get
```

3. Add your product images to the `assets/images/` directory following the structure above.

4. Update the image paths in `lib/services/data_service.dart` to match your actual image filenames.

5. Run the app:
```bash
flutter run
```

### Building for Production

#### Android
```bash
flutter build apk --release
```

#### iOS
```bash
flutter build ios --release
```

## App Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   └── shoe_model.dart       # Data models
├── providers/
│   └── theme_provider.dart   # Theme management
├── screens/
│   ├── home_screen.dart      # Main home screen
│   ├── gender_selection_screen.dart
│   ├── size_selection_screen.dart
│   ├── models_screen.dart    # Shoe models list
│   └── shoe_detail_screen.dart
└── services/
    └── data_service.dart     # Sample data and data access
```

## Customization

### Adding New Products
1. Add your images to the appropriate directory
2. Update `lib/services/data_service.dart` with new product data
3. Follow the existing data structure

### Modifying Categories
1. Update `DataService.getCategoriesByGender()` method
2. Add corresponding UI elements in `gender_selection_screen.dart`

### Theme Customization
1. Modify `lib/providers/theme_provider.dart`
2. Update theme colors and styles in individual screens

## Technical Details

- **Framework**: Flutter 3.7.2+
- **State Management**: Provider
- **Local Storage**: SharedPreferences
- **Image Caching**: CachedNetworkImage
- **Platform Support**: iOS, Android, Web, Desktop

## Future Enhancements

- Shopping cart functionality
- Wishlist management
- Product search and filtering
- User authentication
- Payment integration
- Push notifications
- Offline support
- Multi-language support

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.
