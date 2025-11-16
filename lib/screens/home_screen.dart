import 'package:flutter/material.dart';
import '../core/colors.dart';
import '../data/dummy_data.dart';
import '../l10n/app_localizations.dart';
import '../widgets/language_picker.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'newCategory';

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.productList),
        actions: const [
          LanguagePicker(),
          SizedBox(width: 16),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: ['newCategory', 'furniture', 'electronic', 'fashion'].map((cat) {
                bool isSelected = selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: ChoiceChip(
                    label: Text(t.translateCategory(cat)),
                    selected: isSelected,
                    selectedColor: AppColors.primary,
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                    onSelected: (_) => setState(() => selectedCategory = cat),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: dummyProducts.length,
              itemBuilder: (_, i) => ProductCard(product: dummyProducts[i]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

extension on AppLocalizations {
  String translateCategory(String key) {
    switch (key) {
      case 'newCategory': return newCategory;
      case 'furniture': return furniture;
      case 'electronic': return electronic;
      case 'fashion': return fashion;
      default: return key;
    }
  }
}