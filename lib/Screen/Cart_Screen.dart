import 'package:dog_app/Controllers/Home_Controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartPage extends StatelessWidget {
  final HomePageController controller = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Cart'),
      ),
      body: Center(
        child: Obx(() => ListView.builder(
              itemCount: controller.cartItems.length,
              itemBuilder: (context, index) {
                final imageUrl = controller.cartItems[index];
                return CartItemWidget(imageUrl: imageUrl, index: index + 1);
              },
            )),
      ),
    );
  }
}

class CartItemWidget extends StatelessWidget {
  final String imageUrl;
  final int index;

  const CartItemWidget({Key? key, required this.imageUrl, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dog $index',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Price: \₹10,000'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}