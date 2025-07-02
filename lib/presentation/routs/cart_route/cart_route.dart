import 'package:b_store/app/constants/colors.dart';
import 'package:b_store/domain/widgets/button_widget.dart';
import 'package:flutter/material.dart';
import '../../../app/constants/assets.dart';

class CartRoute extends StatefulWidget {
  const CartRoute({super.key});

  @override
  State<CartRoute> createState() => _CartRouteState();
}

class _CartRouteState extends State<CartRoute> {
  int selectedSortIndex = 1; // 0 = price, 1 = date
  late List<Map<String, Object>> cartItems;
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartItems = _getCartItems();
  }
  @override
  Widget build(BuildContext context) {
    final totalItems = _calculateTotalItems(cartItems);
    final totalPrice = _calculateTotalPrice(cartItems);

    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          children: [
            Expanded(child: _buildCartList(cartItems)),
            const SizedBox(height: 10),
            _buildCartSummary(totalItems, totalPrice),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: ButtonWidget(
                onTap: () {
                  // Add your checkout logic here
                },
                text: 'Proceed to Checkout',
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, Object>> _getCartItems() => [
    {
      'name': 'Tag Heuer Wristwatch',
      'image': 'https://via.placeholder.com/60',
      'oldPrice': 189,
      'newPrice': 230,
      'quantity': 1,
    },
    {
      'name': 'Black Stone Bracelet',
      'image': 'https://via.placeholder.com/60',
      'oldPrice': 24,
      'newPrice': 27,
      'quantity': 1,
    },
    {
      'name': 'Black Rope Bracelet',
      'image': 'https://via.placeholder.com/60',
      'oldPrice': 29,
      'newPrice': 38,
      'quantity': 2,
    },
  ];

  int _calculateTotalItems(List<Map<String, Object>> items) =>
      items.fold(0, (sum, item) => sum + (item['quantity'] as int));

  double _calculateTotalPrice(List<Map<String, Object>> items) => items.fold(
    0,
    (sum, item) =>
        sum + ((item['newPrice'] as int) * (item['quantity'] as int)),
  );

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
  ) => AppBar(
    title: Text(
      'Back',
      style: TextStyle(
        color: AppColors.primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 19,
      ),
    ),
    titleSpacing: 0,
    leading: InkWell(
      onTap: () => Navigator.pop(context),
      child: Image.asset(AppAssets.iconBack, width: 25, height: 25),
    ),
    actions: [
      PopupMenuButton<int>(
        onSelected: (value) {
          if (value == 2) {
            // Remove all items
            setState(() {
              cartItems.clear();
            });
          } else {
            if (value == 0) {
              setState(() {
                selectedSortIndex = value;
                cartItems.sort(
                  (a, b) =>
                      (a['newPrice'] as int).compareTo(b['newPrice'] as int),
                );
              });
            } else if (value == 1) {
              setState(() {
                selectedSortIndex = value;
                // Do nothing or implement date-based sorting if available
              });
            }
          }
        },
        offset: Offset(-10, 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        itemBuilder:
            (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Sort by price"),
                    if (selectedSortIndex == 0)
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset(AppAssets.iconCheck),
                      ),
                  ],
                ),
              ),
              PopupMenuDivider(height: 0),
              PopupMenuItem(
                value: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Sort by date"),
                    if (selectedSortIndex == 1)
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: Image.asset(AppAssets.iconCheck),
                      ),
                  ],
                ),
              ),
              PopupMenuDivider(height: 0),
              PopupMenuItem(
                value: 2,
                child: Text(
                  "Remove all items",
                  style: TextStyle(color: AppColors.discountColor),
                ),
              ),
            ],
        icon: Icon(Icons.more_vert, color: AppColors.primaryColor),
      ),
    ],
  );

  Widget _buildCartList(List<Map<String, Object>> items) => ListView.separated(
    itemCount: items.length,
    separatorBuilder: (_, __) => Divider(
      color: AppColors.primaryColor,
      height: 30,
      thickness: 0.5,
      indent: 20,
      endIndent: 20,
    ),
    itemBuilder: (context, index) {
      final item = items[index];

      return Dismissible(
        key: ValueKey(item['name'].toString() + index.toString()),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          color: AppColors.discountColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delete, color: AppColors.whaitColor, size: 25),
              SizedBox(height: 4,),
              Text('Removed\nfrom Cart',style: TextStyle(color: AppColors.whaitColor, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        onDismissed: (direction) {
          setState(() {
            cartItems.removeAt(index);
          });
        },
        child: _buildCartItem(item),
      );
    },
  );
  
  Widget _buildCartItem(Map<String, Object> item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(width: 100, height: 100, color: AppColors.backgroundImages),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item['name'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Text(
                    'USD${item['oldPrice']}',
                    style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'USD${item['newPrice']}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.rectangleColor,
                ),
                height: 40,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add, size: 18, color: AppColors.primaryColor),
                      onPressed: () {},
                    ),
                    Text(
                      '${item['quantity']}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.remove, size: 18),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCartSummary(int totalItems, double totalPrice) => Column(
    children: [
      Text(
        'Total Items: $totalItems Items',
        style: TextStyle(fontSize: 13, color: AppColors.primaryColor),
      ),
      const SizedBox(height: 5),
      Text(
        'Total Price: \$${totalPrice.toInt()}',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    ],
  );
}
