import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../l10n/app_localizations.dart';
import '../models/product.dart';
import '../widgets/language_picker.dart';
import '../widgets/primary_button.dart';

List<Product> cartItems = [];

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final total = cartItems.fold(0.0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
        title: Text(t.yourCart),
        actions: const [LanguagePicker(), SizedBox(width: 16)],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(t.items(cartItems.length), style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (_, i) {
                final p = cartItems[i];
                return ListTile(
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(image: NetworkImage(p.imageUrl), fit: BoxFit.cover),
                    ),
                  ),
                  title: Text(p.title),
                  subtitle: Row(
                    children: [
                      IconButton(icon: const Icon(Icons.remove_circle_outline), onPressed: () {}),
                      const Text('1'),
                      IconButton(icon: const Icon(Icons.add_circle_outline), onPressed: () {}),
                    ],
                  ),
                  trailing: Text('\$${p.price}', style: const TextStyle(fontWeight: FontWeight.bold)),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]),
            child: Column(
              children: [
                PrimaryButton(text: t.checkOut, onPressed: () {}),
                const SizedBox(height: 8),
                Text('Total: \$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}