import 'package:flutter/material.dart';
import 'custom_bottom_nav.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({super.key});

  @override
  _ResponsiveLayoutState createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  int _selectedIndex = 0;

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Add navigation logic here if needed based on the selected index
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Delivery Address Header
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery address",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Karachi City, Central District",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.black,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Icon(
                              Icons.shopping_cart_outlined,
                              size: 24,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        SizedBox(width: 16),
                        Icon(
                          Icons.notifications_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Search Bar with Icon
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    height: 40,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFF0F2F1),
                        width: 2,
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 30,
                    child: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/banner 1.png',
                      width: screenWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Category Section
              const CategorySection(),

              const SizedBox(height: 10),

              // Product Section
              const ProductSection(),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        selectedIndex: _selectedIndex,
        onTabTapped: _onTabTapped,
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Category",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CategoryItem(
                iconPath: 'assets/apparel.png',
                label: 'Apparel',
                backgroundColor: Colors.red[50]!,
              ),
              CategoryItem(
                iconPath: 'assets/school.png',
                label: 'School',
                backgroundColor: Colors.blue[50]!,
              ),
              CategoryItem(
                iconPath: 'assets/sports.png',
                label: 'Sports',
                backgroundColor: Colors.orange[50]!,
              ),
              CategoryItem(
                iconPath: 'assets/elec.png',
                label: 'Electronic',
                backgroundColor: Colors.cyan[50]!,
              ),
              CategoryItem(
                iconPath: 'assets/all.png',
                label: 'All',
                backgroundColor: Colors.green[50]!,
              ),
            ],
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Recent product",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  // Handle filter action
                },
                // icon: const Icon(Icons.filter_list, color: Colors.black),
                label: const Text(
                  "Filters",
                  style: TextStyle(color: Colors.black),
                ),
                icon: const Icon(Icons.filter_list, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String iconPath;
  final String label;
  final Color backgroundColor;

  const CategoryItem({
    required this.iconPath,
    required this.label,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            iconPath,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    );
  }
}

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          // Product Grid with 3 Rows and 2 Columns of Products
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // First Product in Row 1
              ProductItem(
                imagePath: 'assets/img.png',
                productName: 'Monitor',
                price: '25.99',
              ),
              // Second Product in Row 1
              ProductItem(
                imagePath: 'assets/img (1).png',
                productName: 'AirPods',
                price: '19.99',
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // First Product in Row 2
              ProductItem(
                imagePath: 'assets/img (2).png',
                productName: 'EarBuds',
                price: '30.99',
              ),
              // Second Product in Row 2
              ProductItem(
                imagePath: 'assets/img (3).png',
                productName: 'Headphones',
                price: '15.49',
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // First Product in Row 3
              ProductItem(
                imagePath: 'assets/img (4).png',
                productName: 'Headphones',
                price: '22.99',
              ),
              // Second Product in Row 3
              ProductItem(
                imagePath: 'assets/img (5).png',
                productName: 'Headphones',
                price: '18.49',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;

  const ProductItem({
    required this.imagePath,
    required this.productName,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image with rounded corners
        ClipRRect(
          borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
          child: Image.asset(
            imagePath,
            width: 155,  // Adjust width and height as needed
            height: 100,
            fit: BoxFit.cover, // Ensures the image fits well inside the container
          ),
        ),
        const SizedBox(height: 10),
        // Product Name
        Text(
          productName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        // Product Price
        Text(
          '\$$price',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        // Add to Cart Button
        Container(
          width: 120,
          height: 40,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 57, 207, 135), 
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextButton(
            onPressed: () {
              // Add to cart logic here
            },
            child: const Text(
              'Add to Cart',
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}