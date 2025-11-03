import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../theme/tokens.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.title, required this.subtitle, required this.imageProvider, this.onTap, this.metaLeft, this.metaRight});
  final String title;
  final String subtitle;
  final ImageProvider imageProvider;
  final VoidCallback? onTap;
  final String? metaLeft;
  final String? metaRight;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.surfaceColor,
        borderRadius: BorderRadius.circular(AppRadii.lg),
        border: Border.all(color: theme.borderColor.withValues(alpha: 0.2)),
        boxShadow: AppShadows.card(Colors.black),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(AppRadii.lg),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadii.md),
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: theme.textSecondaryColor),
                ),
                const SizedBox(height: AppSpacing.xs),
                Row(
                  children: [
                    if (metaLeft != null)
                      _metaChip(context, theme, metaLeft!),
                    if (metaRight != null) ...[
                      const SizedBox(width: AppSpacing.xs),
                      _metaChip(context, theme, metaRight!),
                    ],
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _metaChip(BuildContext context, ThemeProvider theme, String label) => Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs, vertical: 3),
        decoration: BoxDecoration(
          color: theme.surfaceVariantColor,
          borderRadius: BorderRadius.circular(AppRadii.sm),
          border: Border.all(color: theme.borderColor.withValues(alpha: 0.4)),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: theme.textSecondaryColor, fontWeight: FontWeight.w600),
        ),
      );
}


