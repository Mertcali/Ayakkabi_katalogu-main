import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/cart_provider.dart';
import '../models/shoe_model.dart';
import '../services/data_service.dart';
import 'gender_selection_screen.dart';
import 'cart_screen.dart';
import 'shoe_detail_screen.dart';

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

            // Yeni Ürünler Carousel
            SliverToBoxAdapter(
              child: _buildNewProductsCarousel(context, theme),
            ),

            // Cinsiyet Seçimi Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cinsiyet Seçimi',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: theme.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Gender Categories Grid
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    'Kadın',
                    'kadin',
                    Icons.woman,
                    const [Color(0xFFFF6B9D), Color(0xFFFFC371)],
                  ),
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
                    'Çocuk',
                    'cocuk',
                    Icons.child_care,
                    const [Color(0xFF11D0D5), Color(0xFF7B2CBF)],
                  ),
                ]),
              ),
            ),

            // Özellikler Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Özel Koleksiyonlar',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: theme.textColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'İndirimler ve özel ürünler',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: theme.textSecondaryColor,
                      ),
                    ),
                  ],
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
                    false,
                  ),
                  _buildFeatureCard(
                    context,
                    theme,
                    'Aksesuar',
                    'Çanta & Bakım',
                    Icons.shopping_bag_outlined,
                    const [Color(0xFF00B4DB), Color(0xFF0083B0)],
                    false,
                  ),
                  _buildFeatureCard(
                    context,
                    theme,
                    'Özel Numara',
                    'Geniş Seçenek',
                    Icons.straighten,
                    const [Color(0xFF00F260), Color(0xFF0575E6)],
                    false,
                  ),
                  _buildFeatureCard(
                    context,
                    theme,
                    'Yeni Gelenler',
                    'Son Eklenenler',
                    Icons.new_releases_outlined,
                    const [Color(0xFFFFD200), Color(0xFFF7971E)],
                    false,
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
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => GenderSelectionScreen(gender: gender),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              const begin = Offset(1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.easeInOutCubic;
              var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(24),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 32),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
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
    bool isActive,
  ) {
    return GestureDetector(
      onTap: () => _showComingSoon(context, theme),
      child: Container(
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
        child: Stack(
          children: [
            Padding(
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
            if (!isActive)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'YAKINDA',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewProductsCarousel(BuildContext context, ThemeProvider theme) {
    if (_newProducts.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF0080), Color(0xFFFF8C00)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.auto_awesome, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                'Yeni Ürünler',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: theme.textColor,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.surfaceVariantColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      size: 14,
                      color: theme.textColor.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Otomatik',
                      style: TextStyle(
                        fontSize: 11,
                        color: theme.textColor.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
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
    final gradientColors = [
      [Color(0xFFFF6B6B), Color(0xFFFF8E53)],
      [Color(0xFF4E65FF), Color(0xFF92EFFD)],
      [Color(0xFFFF0080), Color(0xFFFF8C00)],
      [Color(0xFF11998E), Color(0xFF38EF7D)],
      [Color(0xFFFC466B), Color(0xFF3F5EFB)],
      [Color(0xFFFFBE0B), Color(0xFFFFD60A)],
    ];
    
    final colors = gradientColors[_newProducts.indexOf(product) % gradientColors.length];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ShoeDetailScreen(shoe: product),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: colors.first.withValues(alpha: 0.4),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Decorative elements
            Positioned(
              right: -30,
              top: -30,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.05),
                ),
              ),
            ),
            Positioned(
              left: -20,
              bottom: -20,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withValues(alpha: 0.05),
                ),
              ),
            ),
            
            // Product Image
            Positioned(
              right: 20,
              top: 20,
              bottom: 20,
              width: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  product.imagePath,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.white.withValues(alpha: 0.2),
                      child: const Icon(
                        Icons.sports_soccer,
                        color: Colors.white,
                        size: 60,
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Content
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'YENİ',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: colors.first,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: 150,
                    child: Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product.brand,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.95),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ürüne Git',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: colors.first,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: colors.first,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context, ThemeProvider theme) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Bu özellik yakında eklenecek!'),
        backgroundColor: theme.primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
