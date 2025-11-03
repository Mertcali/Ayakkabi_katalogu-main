# Image Organization

This directory contains all product images for the Turkish Shoe Catalog app.

## Directory Structure

```
assets/images/
├── kadin/                    # Women's shoes
│   └── spor/                # Sports shoes
│       ├── nike_air_max.jpg
│       ├── converse_chuck.jpg
│       ├── converse_one_star.jpg
│       ├── puma_rsx.jpg
│       ├── nike_af1.jpg
│       └── adidas_superstar.jpg
├── erkek/                    # Men's shoes
│   └── spor/                # Sports shoes
│       ├── nike_air_max.jpg
│       ├── converse_chuck.jpg
│       ├── converse_one_star.jpg
│       ├── puma_rsx.jpg
│       ├── nike_af1.jpg
│       └── adidas_superstar.jpg
└── cocuk/                    # Children's shoes
    ├── bebe/                # Baby shoes
    │   └── adidas_labubu_bebe.jpg
    ├── patik/               # Slippers
    │   └── adidas_labubu_patik.jpg
    └── filet/               # Sandals
        └── adidas_labubu_filet.jpg
```

## Image Requirements

- **Format**: JPG, PNG, or WebP
- **Size**: Recommended 800x600 pixels or higher
- **Aspect Ratio**: 4:3 or 16:9 for best display
- **File Size**: Keep under 2MB per image for optimal performance
- **Naming**: Use lowercase with underscores (e.g., `nike_air_max.jpg`)

## Adding New Images

1. Place your images in the appropriate subdirectory
2. Update the image paths in `lib/services/data_service.dart`
3. Ensure the filename matches the path specified in the data service

## Image Loading

The app uses placeholder icons for demonstration. To use actual images:

1. Replace the placeholder icons in the UI with actual image widgets
2. Use `Image.asset()` for local images
3. Use `CachedNetworkImage` for remote images

Example:
```dart
Image.asset(
  'assets/images/kadin/spor/nike_air_max.jpg',
  fit: BoxFit.cover,
)
``` 