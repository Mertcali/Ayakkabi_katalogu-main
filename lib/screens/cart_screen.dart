import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import '../providers/theme_provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.surfaceVariantColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: theme.textColor,
              size: 18,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Sepetim',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          if (cart.items.isNotEmpty)
            IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: theme.surfaceVariantColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.delete_outline,
                  color: theme.errorColor,
                  size: 20,
                ),
              ),
              onPressed: () => _showClearCartDialog(context, cart, theme),
            ),
          const SizedBox(width: 16),
        ],
      ),
      body: cart.items.isEmpty
          ? _buildEmptyCart(context, theme)
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return _buildCartItem(context, theme, cart, item, index);
                    },
                  ),
                ),
                _buildCheckoutSection(context, theme, cart),
              ],
            ),
    );
  }

  Widget _buildEmptyCart(BuildContext context, ThemeProvider theme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.primaryColor.withValues(alpha: 0.1),
                  theme.secondaryColor.withValues(alpha: 0.1),
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.shopping_bag_outlined,
              size: 80,
              color: theme.primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Sepetiniz Boş',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ürün eklemek için alışverişe başlayın',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: theme.textSecondaryColor,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              backgroundColor: theme.primaryColor,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Alışverişe Başla'),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem(
    BuildContext context,
    ThemeProvider theme,
    CartProvider cart,
    CartItem item,
    int index,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.surfaceColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.primaryColor.withValues(alpha: 0.1),
                    theme.secondaryColor.withValues(alpha: 0.1),
                  ],
                ),
              ),
              child: Image.asset(
                item.shoe.getImagePathForColor(item.selectedColor),
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.image_outlined,
                  color: theme.primaryColor,
                  size: 32,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          
          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.shoe.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  item.shoe.brand,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: theme.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildTag(context, theme, item.selectedColor),
                    const SizedBox(width: 8),
                    _buildTag(context, theme, 'No: ${item.selectedSize}'),
                  ],
                ),
              ],
            ),
          ),
          
          // Quantity & Delete
          Column(
            children: [
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: theme.errorColor,
                  size: 20,
                ),
                onPressed: () => cart.removeFromCart(index),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: theme.surfaceVariantColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => cart.updateQuantity(index, item.quantity - 1),
                      child: Icon(
                        Icons.remove,
                        size: 16,
                        color: theme.textColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      '${item.quantity}',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () => cart.updateQuantity(index, item.quantity + 1),
                      child: Icon(
                        Icons.add,
                        size: 16,
                        color: theme.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(BuildContext context, ThemeProvider theme, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: theme.surfaceVariantColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: theme.borderColor.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: theme.textSecondaryColor,
        ),
      ),
    );
  }

  Widget _buildCheckoutSection(
    BuildContext context,
    ThemeProvider theme,
    CartProvider cart,
  ) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.surfaceColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 30,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Toplam Ürün',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: theme.textSecondaryColor,
                  ),
                ),
                Text(
                  '${cart.itemCount} Adet',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _shareViaWhatsApp(context, cart),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      backgroundColor: const Color(0xFF25D366),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.share, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          'WhatsApp',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () => _showCheckoutDialog(context, theme),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      backgroundColor: theme.primaryColor,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.check_circle_outline),
                        const SizedBox(width: 8),
                        Text(
                          'Siparişi Tamamla',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showClearCartDialog(BuildContext context, CartProvider cart, ThemeProvider theme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sepeti Temizle'),
        content: const Text('Sepetteki tüm ürünler silinecek. Emin misiniz?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('İptal'),
          ),
          ElevatedButton(
            onPressed: () {
              cart.clearCart();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.errorColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('Temizle'),
          ),
        ],
      ),
    );
  }

  Future<void> _shareViaWhatsApp(BuildContext context, CartProvider cart) async {
    if (cart.items.isEmpty) return;

    // Sepet detaylarını oluştur
    String message = '🛍 *SEPETİM*\n\n';
    
    for (int i = 0; i < cart.items.length; i++) {
      final item = cart.items[i];
      message += '${i + 1}. *${item.shoe.name}*\n';
      message += '   • Marka: ${item.shoe.brand}\n';
      message += '   • Renk: ${item.selectedColor}\n';
      message += '   • Numara: ${item.selectedSize}\n';
      message += '   • Adet: ${item.quantity}\n\n';
    }
    
    message += '━━━━━━━━━━━━━━━━\n';
    message += '📦 *Toplam: ${cart.itemCount} Ürün*\n\n';
    message += '_Ayakkabı Kataloğu ile oluşturuldu_';

    try {
      // Tüm ürün görsellerini yükle
      List<img.Image> images = [];
      
      for (var item in cart.items) {
        try {
          // Asset'ten görseli yükle
          final imagePath = item.shoe.getImagePathForColor(item.selectedColor);
          final byteData = await rootBundle.load(imagePath);
          final bytes = byteData.buffer.asUint8List();
          
          // Image paketini kullanarak görseli decode et
          final decodedImage = img.decodeImage(bytes);
          if (decodedImage != null) {
            images.add(decodedImage);
          }
        } catch (e) {
          debugPrint('Görsel yüklenemedi: $e');
        }
      }
      
      if (images.isNotEmpty) {
        // Tüm resimleri tek bir kolaj resminde birleştir
        final collageImage = await _createImageCollage(images);
        
        if (collageImage != null) {
          // Kolaj resmini dosyaya kaydet
          final tempDir = await getTemporaryDirectory();
          final timestamp = DateTime.now().millisecondsSinceEpoch;
          final file = File('${tempDir.path}/sepet_kolaj_$timestamp.jpg');
          
          // JPEG olarak encode et
          final jpegBytes = img.encodeJpg(collageImage, quality: 90);
          await file.writeAsBytes(jpegBytes);
          
          // Tek resim ve metin olarak paylaş
          await Share.shareXFiles(
            [XFile(file.path)],
            text: message,
            subject: 'Sepetim - Ayakkabı Kataloğu',
          );
          
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sepetiniz başarıyla paylaşıldı!'),
                backgroundColor: Colors.green,
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 2),
              ),
            );
          }
        }
      } else {
        // Görsel yoksa sadece metni paylaş
        await Share.share(
          message,
          subject: 'Sepetim - Ayakkabı Kataloğu',
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Paylaşım hatası: ${e.toString()}'),
            backgroundColor: Colors.orange,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  // Resimleri grid düzeninde birleştir
  Future<img.Image?> _createImageCollage(List<img.Image> images) async {
    if (images.isEmpty) return null;
    
    try {
      // Her resmi aynı boyuta getir (kare)
      const imageSize = 400;
      List<img.Image> resizedImages = [];
      
      for (var image in images) {
        final resized = img.copyResize(
          image,
          width: imageSize,
          height: imageSize,
          interpolation: img.Interpolation.linear,
        );
        resizedImages.add(resized);
      }
      
      // Grid düzeni hesapla (2 sütun)
      const columns = 2;
      final rows = (resizedImages.length / columns).ceil();
      
      // Kolaj boyutları
      final collageWidth = columns * imageSize + (columns + 1) * 10; // 10px padding
      final collageHeight = rows * imageSize + (rows + 1) * 10;
      
      // Beyaz arka planlı kolaj oluştur
      final collage = img.Image(
        width: collageWidth,
        height: collageHeight,
      );
      
      // Beyaz arkaplan
      img.fill(collage, color: img.ColorRgb8(255, 255, 255));
      
      // Resimleri yerleştir
      for (int i = 0; i < resizedImages.length; i++) {
        final row = i ~/ columns;
        final col = i % columns;
        
        final x = col * imageSize + (col + 1) * 10;
        final y = row * imageSize + (row + 1) * 10;
        
        img.compositeImage(
          collage,
          resizedImages[i],
          dstX: x,
          dstY: y,
        );
      }
      
      return collage;
    } catch (e) {
      debugPrint('Kolaj oluşturma hatası: $e');
      return null;
    }
  }

  void _showCheckoutDialog(BuildContext context, ThemeProvider theme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sipariş Onayı'),
        content: const Text('Siparişiniz başarıyla oluşturuldu!'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.successColor,
              foregroundColor: Colors.white,
            ),
            child: const Text('Tamam'),
          ),
        ],
      ),
    );
  }
}

