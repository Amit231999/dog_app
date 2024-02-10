import 'package:dog_app/Controllers/Home_Controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.fetchDogImages();
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Dog API App'),
        actions: [
          IconButton(
            onPressed: () => controller.fetchDogImages(),
            icon: Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('/history');
            },
            icon: Icon(Icons.history),
          ),
          IconButton(
            onPressed: () {
              Get.toNamed('/cart');
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Obx(() => SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                if (controller.imageUrls.isNotEmpty)
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: List.generate(controller.imageUrls.length, (index) {
                      final imageUrl = controller.imageUrls[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(ImageDetailScreen(imageUrl: imageUrl));
                        },
                        child: Card(
                          elevation: 4,
                          margin: EdgeInsets.all(8),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                                  ),
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  child: IconButton(
                                    onPressed: () {
                                      controller.addToCart(imageUrl);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(backgroundColor: Colors.blue,
                                          content: Text('Added to Cart')),
                                      );
                                    },
                                    icon: Icon(Icons.add_shopping_cart,color: Colors.black,),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                SizedBox(height: 20),
              ],
            ),
          )),
        ),
      ),
    );
  }
}


class ImageDetailScreen extends StatelessWidget {
  final String imageUrl;

  const ImageDetailScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dogs Image"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}

