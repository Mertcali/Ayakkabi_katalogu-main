import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../providers/cart_provider.dart';
import '../models/shoe_model.dart';
import 'home_screen.dart';
import 'cart_screen.dart';

class ShoeDetailScreen extends StatefulWidget {
  final ShoeModel shoe;

  const ShoeDetailScreen({
    super.key,
    required this.shoe,
  });

  @override
  State<ShoeDetailScreen> createState() => _ShoeDetailScreenState();
}

class _ShoeDetailScreenState extends State<ShoeDetailScreen> {
  String? selectedColor;
  String? selectedSize;
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    if (widget.shoe.colors.isNotEmpty) {
      selectedColor = widget.shoe.colors.first;
    }
    if (widget.shoe.sizes.isNotEmpty) {
      selectedSize = widget.shoe.sizes.first;
    }
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    
    return Scaffold(
      backgroundColor: themeProvider.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: themeProvider.surfaceVariantColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: themeProvider.textColor,
              size: 18,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.shoe.name,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
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
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: themeProvider.textColor,
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
                  Text(
                    'Sepetim',
                    style: TextStyle(
                      color: themeProvider.textColor,
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
                color: themeProvider.surfaceVariantColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.home_outlined,
                color: themeProvider.textColor,
                size: 18,
              ),
            ),
            onPressed: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false,
            ),
            tooltip: 'Ana Sayfaya Dön',
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Product Image Section
          SliverToBoxAdapter(
            child: _buildModernImageSection(themeProvider),
          ),
          
          // Product Details
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildModernShoeDetails(themeProvider),
                const SizedBox(height: 32),
                _buildModernColorSection(themeProvider),
                const SizedBox(height: 32),
                _buildModernSizeSection(themeProvider),
                const SizedBox(height: 32),
                _buildModernActionButtons(themeProvider),
                const SizedBox(height: 40),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernImageSection(ThemeProvider themeProvider) {
    return SizedBox(
      width: double.infinity,
      height: 400,
      child: Stack(
        children: [
          // Swipeable images with PageView
          PageView.builder(
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            pageSnapping: true,
            itemCount: widget.shoe.colors.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
                selectedColor = widget.shoe.colors[index];
              });
            },
            itemBuilder: (context, index) {
              final color = widget.shoe.colors[index];
              return Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: Image.asset(
                    widget.shoe.getImagePathForColor(color),
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: 400,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              themeProvider.primaryColor.withValues(alpha: 0.1),
                              themeProvider.secondaryColor.withValues(alpha: 0.1),
                            ],
                          ),
                        ),
                        child: Icon(
                          Icons.sports_soccer,
                          size: 80,
                          color: themeProvider.primaryColor,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
          
          // Gradient overlay
          IgnorePointer(
            child: Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.3),
                ],
              ),
            ),
            ),
          ),
          
          // Color indicator
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                selectedColor ?? 'Renk Seçin',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // Navigation dots
          if (widget.shoe.colors.length > 1)
            Positioned(
              bottom: 20,
              right: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.swipe,
                      color: Colors.white,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    ...List.generate(widget.shoe.colors.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          width: _currentPage == index ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: _currentPage == index 
                                ? Colors.white 
                                : Colors.white.withValues(alpha: 0.4),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildModernShoeDetails(ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.shoe.name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: themeProvider.textColor,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.shoe.brand,
          style: TextStyle(
            fontSize: 18,
            color: themeProvider.textSecondaryColor,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.1,
          ),
        ),
        const SizedBox(height: 16),
        
        // Features
        Row(
          children: [
            _buildFeatureChip(Icons.palette, '${widget.shoe.colors.length} Renk', themeProvider),
            const SizedBox(width: 12),
            _buildFeatureChip(Icons.straighten, '${widget.shoe.sizes.length} Numara', themeProvider),
          ],
        ),
      ],
    );
  }

  Widget _buildFeatureChip(IconData icon, String label, ThemeProvider themeProvider) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: themeProvider.primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: themeProvider.primaryColor.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: themeProvider.primaryColor),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: themeProvider.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernColorSection(ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Renk Seçimi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: themeProvider.textColor,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: widget.shoe.colors.asMap().entries.map((entry) {
            final index = entry.key;
            final color = entry.value;
            final isSelected = _currentPage == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = color;
                  _currentPage = index;
                });
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  gradient: isSelected 
                    ? LinearGradient(
                        colors: [themeProvider.primaryColor, themeProvider.secondaryColor],
                      )
                    : null,
                  color: isSelected ? null : themeProvider.surfaceColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? Colors.transparent : themeProvider.textSecondaryColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: themeProvider.primaryColor.withValues(alpha: 0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ] : null,
                ),
                child: Text(
                  color,
                  style: TextStyle(
                    color: isSelected ? Colors.white : themeProvider.textColor,
                    fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                    fontSize: 14,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildModernSizeSection(ThemeProvider themeProvider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Numara Seçimi',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: themeProvider.textColor,
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: widget.shoe.sizes.map((size) {
            final isSelected = selectedSize == size;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedSize = size;
                });
              },
              child: Container(
                width: 60,
                height: 40,
                decoration: BoxDecoration(
                  gradient: isSelected 
                    ? LinearGradient(
                        colors: [themeProvider.primaryColor, themeProvider.secondaryColor],
                      )
                    : null,
                  color: isSelected ? null : themeProvider.surfaceColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? Colors.transparent : themeProvider.textSecondaryColor.withValues(alpha: 0.3),
                    width: 1,
                  ),
                  boxShadow: isSelected ? [
                    BoxShadow(
                      color: themeProvider.primaryColor.withValues(alpha: 0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ] : null,
                ),
                child: Center(
                  child: Text(
                    size,
                    style: TextStyle(
                      color: isSelected ? Colors.white : themeProvider.textColor,
                      fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
                      fontSize: 14,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildModernActionButtons(ThemeProvider themeProvider) {
    return Column(
      children: [
        // Add to favorites button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _showComingSoon(context),
            icon: const Icon(Icons.favorite_border),
            label: const Text('Favorilere Ekle'),
            style: ElevatedButton.styleFrom(
              backgroundColor: themeProvider.surfaceColor,
              foregroundColor: themeProvider.textColor,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              shadowColor: Colors.black.withValues(alpha: 0.1),
            ),
          ),
        ),
        const SizedBox(height: 12),
        
        // Add to cart button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _addToCart(context),
            icon: const Icon(Icons.shopping_cart),
            label: const Text('Sepete Ekle'),
            style: ElevatedButton.styleFrom(
              backgroundColor: themeProvider.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              shadowColor: themeProvider.primaryColor.withValues(alpha: 0.3),
            ),
          ),
        ),
      ],
    );
  }

  void _addToCart(BuildContext context) {
    if (selectedColor == null || selectedSize == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Lütfen renk ve numara seçin!'),
          backgroundColor: Colors.orange,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
      return;
    }

    final cart = Provider.of<CartProvider>(context, listen: false);
    cart.addToCart(widget.shoe, selectedColor!, selectedSize!);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Ürün sepete eklendi!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        action: SnackBarAction(
          label: 'Sepete Git',
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const CartScreen()),
            );
          },
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Bu özellik yakında gelecek!'),
        backgroundColor: themeProvider.primaryColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
} 