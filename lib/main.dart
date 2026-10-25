import 'package:flutter/material.dart';
import 'models/menu_item.dart';
import 'widgets/menu_card.dart';

void main() {
  runApp(const MenuApp());
}

class MenuApp extends StatelessWidget {
  const MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F2F5),
      ),
      home: const MenuHomeScreen(),
    );
  }
}

class MenuHomeScreen extends StatefulWidget {
  const MenuHomeScreen({super.key});

  @override
  State<MenuHomeScreen> createState() => _MenuHomeScreenState();
}

class _MenuHomeScreenState extends State<MenuHomeScreen> {
  // List of Menu
  final List<MenuItem> _items = const [
    MenuItem(
      id: '1',
      name: 'Amazing Burger',
      category: 'Burger',
      price: 15.00,
      imagePath: 'assets/images/burger.jpg',
      description: 'Ramly',
    ),
    MenuItem(
      id: '2',
      name: 'Lamb Chop Japan',
      category: 'Lamb Chop',
      price: 18.00,
      imagePath: 'assets/images/lamb chop.jpg',
      description: 'Originally from Japan',
    ),
    MenuItem(
      id: '3',
      name: 'Spaghetti',
      category: 'Mee',
      price: 8.00,
      imagePath: 'assets/images/spaghetti.jpg',
      description: 'Yummy Spaghetti',
    ),
  ];

  void _onItemClick(String name) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You choose $name'),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF5722),
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return MenuCard(
            item: _items[index],
            onAddToCart: () => _onItemClick(_items[index].name),
          );
        },
      ),
    );
  }
}