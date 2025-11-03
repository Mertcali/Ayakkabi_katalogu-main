import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/cart_provider.dart';
import '../models/shoe_model.dart';
import '../services/data_service.dart';
import 'gender_selection_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _newProductsController;
  Timer? _autoScrollTimer;
  int _currentPage = 0;
  List<ShoeModel> _newProducts = [];

  @override
  void initState() {
    super.initState();
    _newProductsController = PageController(viewportFraction: 0.85);
    _loadNewProducts();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _newProductsController.dispose();
    super.dispose();
  }

  void _loadNewProducts() {
    // Tüm ürünleri al
    final allShoes = DataService.getAllShoes();
    
    // İlk 6 ürünü "yeni" olarak işaretle
    setState(() {
      _newProducts = allShoes.take(6).toList();
    });
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_newProducts.isEmpty) return;
      
      final nextPage = (_currentPage + 1) % _newProducts.length;
      
      if (_newProductsController.hasClients) {
        _newProductsController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Minimal AppBar
            SliverAppBar(
              floating: true,
              backgroundColor: theme.backgroundColor,
              elevation: 0,
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF4E65FF), Color(0xFF6B48FF)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.storefront, color: Colors.white, size: 24),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Store',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: theme.textColor,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: theme.surfaceVariantColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      theme.isWinterMode ? Icons.light_mode : Icons.dark_mode,
                      color: theme.textColor,
                      size: 20,
                    ),
                  ),
                  onPressed: () => theme.toggleTheme(),
                ),
                Stack(
                  children: [
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: theme.surfaceVariantColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          Icons.shopping_bag_outlined,
                          color: theme.textColor,
                          size: 20,
                        ),
                      ),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CartScreen()),
                      ),
                    ),
                    if (cart.itemCount > 0)
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xFFFF0080), Color(0xFFFF8C00)],
                            ),
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 18,
                            minHeight: 18,
                          ),
                          child: Text(
                            '${cart.itemCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
              ],
            ),

            // Promosyon Carousel
            SliverToBoxAdapter(
              child: _buildPromotionCarousel(context, theme),
            ),

            // Kategoriler Başlığı
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                child: Text(
                  'Kategoriler',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: theme.textColor,
                    fontSize: 22,
                  ),
                ),
              ),
            ),

            // Gender Categories Grid
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                delegate: SliverChildListDelegate([
                  _buildGenderCard(
                    context,
                    theme,
                    'Erkek',
                    'erkek',
                    Icons.man,
                    const [Color(0xFF4E65FF), Color(0xFF6B48FF)],
                  ),
                  _buildGenderCard(
                    context,
                    theme,
                    'Kadın',
                    'kadin',
                    Icons.woman,
                    const [Color(0xFFFF6B9D), Color(0xFFFFC371)],
                  ),
                  _buildGenderCard(
                    context,
                    theme,
                    'Garson',
                    'garson',
                    Icons.restaurant,
                    const [Color(0xFF00B4DB), Color(0xFF0083B0)],
                  ),
                  _buildGenderCard(
                    context,
                    theme,
                    'Filet',
                    'cocuk',
                    Icons.child_friendly,
                    const [Color(0xFF11D0D5), Color(0xFF7B2CBF)],
                  ),
                  _buildGenderCard(
                    context,
                    theme,
                    'Patik',
                    'cocuk',
                    Icons.child_care,
                    const [Color(0xFFFF0080), Color(0xFFFF8C00)],
                  ),
                  _buildGenderCard(
                    context,
                    theme,
                    'Bebe',
                    'cocuk',
                    Icons.baby_changing_station,
                    const [Color(0xFFFFBE0B), Color(0xFFFFD60A)],
                  ),
                ]),
              ),
            ),

            // Özellikler Başlığı
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                child: Text(
                  'Öne Çıkanlar',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w900,
                    color: theme.textColor,
                    fontSize: 22,
                  ),
                ),
              ),
            ),

            // Features Grid
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildListDelegate([
                  _buildFeatureCard(
                    context,
                    theme,
                    'Kampanya',
                    'İndirimli Ürünler',
                    Icons.local_offer,
                    const [Color(0xFFFF0080), Color(0xFFFF8C00)],
                  ),
                  _buildFeatureCard(
                    context,
                    theme,
                    'Aksesuar',
                    'Çanta & Bakım',
                    Icons.shopping_bag_outlined,
                    const [Color(0xFF00B4DB), Color(0xFF0083B0)],
                  ),
                  _buildFeatureCard(
                    context,
                    theme,
                    'Özel Numara',
                    'Geniş Seçenek',
                    Icons.straighten,
                    const [Color(0xFF00F260), Color(0xFF0575E6)],
                  ),
                  _buildFeatureCard(
                    context,
                    theme,
                    'Yeni Gelenler',
                    'Son Eklenenler',
                    Icons.new_releases_outlined,
                    const [Color(0xFFFFD200), Color(0xFFF7971E)],
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderCard(
    BuildContext context,
    ThemeProvider theme,
    String title,
    String gender,
    IconData icon,
    List<Color> colors,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => GenderSelectionScreen(
              gender: gender,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: theme.surfaceColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: colors.first.withValues(alpha: 0.3),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: colors.first.withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: colors,
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 32),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: theme.textColor,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context,
    ThemeProvider theme,
    String title,
    String subtitle,
    IconData icon,
    List<Color> colors,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: colors.first.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: Colors.white.withValues(alpha: 0.9),
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromotionCarousel(BuildContext context, ThemeProvider theme) {
    if (_newProducts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Promosyon Başlığı
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Row(
            children: [
              Icon(
                Icons.campaign_outlined,
                color: theme.primaryColor,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Kampanyalar',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: theme.textColor,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 202,
          child: PageView.builder(
            controller: _newProductsController,
            physics: const BouncingScrollPhysics(),
            itemCount: _newProducts.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final product = _newProducts[index];
              return Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: _buildNewProductCard(
                  context,
                  theme,
                  product,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildNewProductCard(
    BuildContext context,
    ThemeProvider theme,
    ShoeModel product,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Image.asset(
          product.imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.primaryColor.withValues(alpha: 0.3),
                    theme.secondaryColor.withValues(alpha: 0.3),
                  ],
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.image_outlined,
                  color: theme.primaryColor,
                  size: 60,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}
