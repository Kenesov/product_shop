import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../l10n/app_localizations.dart';
import '../models/product.dart';
import '../screens/cart_screen.dart';
import '../widgets/primary_button.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () => Navigator.pop(context)),
        actions: const [Icon(Icons.share), SizedBox(width: 16)],
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: const BoxDecoration(color: Color(0xFFE3F2FD), borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
            child: Center(child: Image.network(product.imageUrl, height: 300, fit: BoxFit.contain)),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text(t.furniture, style: TextStyle(color: Colors.grey[600])),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star_half, color: Colors.amber, size: 20),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Text('${product.reviewCount} ${t.translateReview(product.reviewCount)}'),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Chip(
                    backgroundColor: AppColors.primary,
                    label: Text('\$${product.price}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: PrimaryButton(
              text: t.addToCart,
              onPressed: () {
                cartItems.add(product);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CartScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

extension on AppLocalizations {
  String translateReview(int count) => count == 1 ? 'review' : 'reviews';
}