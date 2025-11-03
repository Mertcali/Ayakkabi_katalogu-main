import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/cart_provider.dart';
import 'models_screen.dart';
import 'home_screen.dart';
import 'cart_screen.dart';

class BrandSelectionScreen extends StatelessWidget {
  final String gender;
  final String category;
  final String? sizeGroup;

  const BrandSelectionScreen({
    super.key,
    required this.gender,
    required this.category,
    this.sizeGroup,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    final brands = _getAvailableBrands();
    final title = _getScreenTitle();

    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Modern App Bar
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            backgroundColor: themeProvider.primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      themeProvider.accentColor,
                      themeProvider.secondaryColor,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.branding_watermark_outlined,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Marka Seçin',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withValues(alpha: 0.9),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartScreen()),
                ),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                          if (cart.itemCount > 0)
                            Positioned(
                              right: -4,
                              top: -2,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Color(0xFFFF0080), Color(0xFFFF8C00)],
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 16,
                                  minHeight: 16,
                                ),
                                child: Text(
                                  '${cart.itemCount}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Sepetim',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                onPressed:
                    () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    ),
              ),
              const SizedBox(width: 16),
            ],
          ),

          // Info Card
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: themeProvider.surfaceVariantColor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: themeProvider.borderColor.withValues(alpha: 0.3),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: themeProvider.primaryColor,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Lütfen bir marka seçin. Sonraki adımda modeller listelenecek.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: themeProvider.textSecondaryColor,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Brands Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.0,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                final brand = brands[index];
                return _buildModernBrandCard(
                  context,
                  themeProvider,
                  brand,
                  _getBrandColors(brand),
                  () => _navigateToModels(context, brand),
                );
              }, childCount: brands.length),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  Widget _buildModernBrandCard(
    BuildContext context,
    ThemeProvider themeProvider,
    String brand,
    List<Color> colors,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: themeProvider.surfaceColor,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: colors[0].withValues(alpha: 0.3), width: 2),
          boxShadow: [
            BoxShadow(
              color: colors[0].withValues(alpha: 0.3),
              blurRadius: 28,
              offset: const Offset(0, 12),
            ),
            BoxShadow(
              color: colors[0].withValues(alpha: 0.15),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon with gradient
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: colors[0].withValues(alpha: 0.3),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(_getBrandIcon(brand), size: 40, color: Colors.white),
            ),
            const SizedBox(height: 16),
            // Brand name
            Text(
              brand,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w800,
                color: themeProvider.textColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              'Modelleri Gör',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: themeProvider.textSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _getAvailableBrands() {
    if (gender == 'cocuk') {
      return ['Adidas'];
    } else {
      return ['Nike', 'Converse', 'Puma', 'Adidas'];
    }
  }

  String _getScreenTitle() {
    final genderTitle = _getGenderTitle(gender);
    final categoryTitle = _getCategoryTitle(category);
    return '$genderTitle → $categoryTitle';
  }

  String _getGenderTitle(String gender) {
    switch (gender) {
      case 'kadin':
        return 'Kadın';
      case 'erkek':
        return 'Erkek';
      case 'cocuk':
        return 'Çocuk';
      default:
        return '';
    }
  }

  String _getCategoryTitle(String category) {
    switch (category) {
      case 'spor':
        return 'Spor';
      case 'tekstil':
        return 'Tekstil';
      case 'canta':
        return 'Çanta';
      case 'terlik':
        return 'Terlik';
      default:
        return category;
    }
  }

  IconData _getBrandIcon(String brand) {
    switch (brand) {
      case 'Nike':
        return Icons.sports_soccer;
      case 'Converse':
        return Icons.sports_basketball;
      case 'Puma':
        return Icons.sports_handball;
      case 'Adidas':
        return Icons.sports_tennis;
      default:
        return Icons.branding_watermark;
    }
  }

  List<Color> _getBrandColors(String brand) {
    switch (brand) {
      case 'Nike':
        return [const Color(0xFF6366F1), const Color(0xFF8B5CF6)];
      case 'Converse':
        return [const Color(0xFF06B6D4), const Color(0xFF0891B2)];
      case 'Puma':
        return [const Color(0xFFEC4899), const Color(0xFFBE185D)];
      case 'Adidas':
        return [const Color(0xFF10B981), const Color(0xFF047857)];
      default:
        return [const Color(0xFF6366F1), const Color(0xFF8B5CF6)];
    }
  }

  void _navigateToModels(BuildContext context, String brand) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => ModelsScreen(
              gender: gender,
              category: category,
              sizeGroup: sizeGroup,
              brand: brand,
            ),
      ),
    );
  }
}
