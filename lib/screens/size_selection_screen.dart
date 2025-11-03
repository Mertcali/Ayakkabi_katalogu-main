import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../services/data_service.dart';
import '../models/shoe_model.dart';
import 'brand_selection_screen.dart';
import 'home_screen.dart';

class SizeSelectionScreen extends StatelessWidget {
  final String gender;
  final String category;

  const SizeSelectionScreen({
    super.key,
    required this.gender,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final sizeGroups = DataService.getSizeGroupsByGenderAndCategory(gender, category);
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
                      themeProvider.secondaryColor,
                      themeProvider.primaryColor,
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
                          Icons.straighten,
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        gender == 'cocuk' ? 'Numara Grubu Seçin' : 'Numara Aralığı Seçin',
                        style: const TextStyle(
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
                child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.home_outlined, color: Colors.white, size: 18),
                ),
                onPressed: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
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
                      gender == 'cocuk'
                          ? 'Çocuğunuzun yaşına uygun numara grubunu seçin.'
                          : 'Aradığınız numaraya uygun aralığı seçin. Sonraki adımda marka seçeceksiniz.',
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

          // Size Groups List
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final sizeGroup = sizeGroups[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _buildModernSizeGroupCard(
                      context,
                      themeProvider,
                      sizeGroup,
                      index,
                    ),
                  );
                },
                childCount: sizeGroups.length,
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 40)),
        ],
      ),
    );
  }

  Widget _buildModernSizeGroupCard(
    BuildContext context,
    ThemeProvider themeProvider,
    SizeGroup sizeGroup,
    int index,
  ) {
    final colors = _getCardColors(index);
    
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => BrandSelectionScreen(
              gender: gender,
              category: category,
              sizeGroup: sizeGroup.id,
            ),
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(22),
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
              blurRadius: 28,
              offset: const Offset(0, 12),
            ),
            BoxShadow(
              color: colors.first.withValues(alpha: 0.2),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                _getSizeGroupIcon(sizeGroup.name),
                color: Colors.white,
                size: 32,
              ),
            ),
            
            const SizedBox(width: 20),
            
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sizeGroup.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${sizeGroup.sizes.length} farklı numara',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.9),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            
            // Arrow
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Color> _getCardColors(int index) {
    final colorSets = [
      [const Color(0xFF6366F1), const Color(0xFF8B5CF6)],
      [const Color(0xFFEC4899), const Color(0xFFF97316)],
      [const Color(0xFF10B981), const Color(0xFF06B6D4)],
      [const Color(0xFFF59E0B), const Color(0xFFEF4444)],
    ];
    return colorSets[index % colorSets.length];
  }

  IconData _getSizeGroupIcon(String sizeGroupName) {
    // Çocuk numara aralıkları için
    if (sizeGroupName.toLowerCase().contains('bebe')) {
      return Icons.baby_changing_station;
    } else if (sizeGroupName.toLowerCase().contains('patik')) {
      return Icons.child_friendly;
    } else if (sizeGroupName.toLowerCase().contains('filet')) {
      return Icons.school;
    }
    
    // Yetişkin numara aralıkları için - cinsiyete göre
    if (gender == 'kadin') {
      return Icons.woman;
    } else if (gender == 'erkek') {
      if (sizeGroupName.contains('42-47')) {
        return Icons.man;
      }
      return Icons.person;
    }
    
    return Icons.straighten;
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
        return 'Spor Ayakkabı';
      case 'tekstil':
        return 'Tekstil Ayakkabı';
      case 'canta':
        return 'Çanta';
      case 'terlik':
        return 'Terlik';
      default:
        return category;
    }
  }
}
