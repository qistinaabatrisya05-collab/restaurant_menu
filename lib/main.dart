import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantMenuApp());
}

class RestaurantMenuApp extends StatelessWidget {
  const RestaurantMenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const MenuScreen(),
    );
  }
}

// 1. Data Models
class FoodItem {
  final String name;
  final String description;
  final String price;
  final String imageUrl;

  const FoodItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class FoodCategory {
  final IconData icon;
  final String categoryName;
  final String description;
  final List<FoodItem> items;

  const FoodCategory({
    required this.icon,
    required this.categoryName,
    required this.description,
    required this.items,
  });
}

// 2. Sample Data including Spaghetti / Pasta
final List<FoodCategory> menuCategories = [
  FoodCategory(
    icon: Icons.lunch_dining,
    categoryName: 'Burger',
    description: 'Juicy handcrafted beef & chicken burgers',
    items: const [
      FoodItem(
        name: 'Classic Cheeseburger',
        description: 'Juicy beef patty with cheddar cheese, lettuce & sauce',
        price: 'RM 12.90',
        imageUrl: 'https://tse1.mm.bing.net/th/id/OIP.OuHbtbrukEwKs2Yot7R9fAHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
      ),
      FoodItem(
        name: 'Double Beef Cheese Burger',
        description: 'Two beef patties, cheese & blackpaper sauce',
        price: 'RM 18.90',
        imageUrl: 'https://images.pexels.com/photos/10922927/pexels-photo-10922927.jpeg?cs=srgb&dl=pexels-gonzalo-acuna-166058093-10922927.jpg&fm=jpg',
      ),
      FoodItem(
        name: 'Crispy Zinger Chicken Burger',
        description: 'Spicy deep-fried chicken thigh with mayo',
        price: 'RM 14.50',
        imageUrl: 'https://tse2.mm.bing.net/th/id/OIP.34Y-3Id0VKaQdH3guRsHGQHaFl?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
      ),
      FoodItem(
        name: 'Mushroom Swiss Burger',
        description: 'Beef patty topped with sautéed mushrooms & Swiss cheese',
        price: 'RM 16.90',
        imageUrl: 'https://tse2.mm.bing.net/th/id/OIP.z-BbBLbCEQ7wYckRmmiBFwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3',
      ),
    ],
  ),
  FoodCategory(
    icon: Icons.local_pizza,
    categoryName: 'Pizza',
    description: 'Freshly baked hand-tossed pizzas',
    items: const [
      FoodItem(
        name: 'Pepperoni Supreme',
        description: 'Beef pepperoni, mozzarella, and tomato sauce',
        price: 'RM 18.90',
        imageUrl: 'https://images.unsplash.com/photo-1628840042765-356cda07504e?w=300',
      ),
      FoodItem(
        name: 'Margherita',
        description: 'Fresh basil, tomatoes, and mozzarella',
        price: 'RM 15.90',
        imageUrl: 'https://images.unsplash.com/photo-1604382355076-af4b0eb60143?w=300',
      ),
      FoodItem(
        name: 'Double Cheese Pizza',
        description: 'Cheese, tomato sauce, and mozzarella',
        price: 'RM 15.90',
        imageUrl: 'https://i.ytimg.com/vi/1pVqlEBmPJU/maxresdefault.jpg',
      ),
    ],
  ),
  FoodCategory(
    icon: Icons.ramen_dining,
    categoryName: 'Spaghetti & Pasta',
    description: 'Creamy and flavorful pasta dishes',
    items: const [
      FoodItem(
        name: 'Creamy Chicken Spaghetti',
        description: 'Rich & creamy Alfredo pasta with grilled chicken',
        price: 'RM 15.90',
        imageUrl: 'https://www.theburntbuttertable.com/wp-content/uploads/2024/04/Creamy-chicken-pasta-cover.jpg',
      ),
      FoodItem(
        name: 'Spaghetti Bolognese',
        description: 'Classic spaghetti topped with rich savory minced beef ragù',
        price: 'RM 16.50',
        imageUrl: 'https://delectablemeal.com/wp-content/uploads/2025/09/spaghetti-bolognese.png',
      ),
      FoodItem(
        name: 'Seafood Aglio Olio',
        description: 'Spaghetti tossed in olive oil, garlic, chili & fresh prawns',
        price: 'RM 18.90',
        imageUrl: 'https://skilletstatic.com/cdn-cgi/image/fit=contain,width=768,quality=80,format=auto/assets/images/1766713699193-3yds95s8.webp',
      ),
    ],
  ),
];

// 3. Category Screen
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant Menu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: menuCategories.length,
        itemBuilder: (context, index) {
          final category = menuCategories[index];
          return FoodCategoryCard(category: category);
        },
      ),
    );
  }
}

class FoodCategoryCard extends StatelessWidget {
  final FoodCategory category;

  const FoodCategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 3,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CategoryDetailScreen(category: category),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Icon(
              category.icon,
              size: 45,
              color: Colors.orange,
            ),
            title: Text(
              category.categoryName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            subtitle: Text(category.description),
            trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

// 4. Detailed Items Screen (Displaying Images)
class CategoryDetailScreen extends StatelessWidget {
  final FoodCategory category;

  const CategoryDetailScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.categoryName,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: category.items.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = category.items[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                item.imageUrl,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 55,
                    height: 55,
                    color: Colors.grey.shade200,
                    child: const Icon(Icons.fastfood, color: Colors.orange),
                  );
                },
              ),
            ),
            title: Text(
              item.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(item.description),
            ),
            trailing: Text(
              item.price,
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          );
        },
      ),
    );
  }
}