import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomePageController extends GetxController {
  RxList<String> imageUrls = <String>[].obs;
  RxList<String> cartItems = <String>[].obs;
  

  Future<void> fetchDogImages() async {
    final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random/8'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<dynamic> images = data['message'];
      imageUrls.assignAll(images.cast<String>());
      saveImagesToHistory(imageUrls);
    } else {
      throw Exception('Failed to load images');
    }
  }

  Future<void> saveImagesToHistory(List<String> images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('history', images);
  }

 void addToCart(String imageUrl) {
    cartItems.add(imageUrl); // Add the image URL to the cartItems list
    print('Added to Cart: $imageUrl');
    // Get.toNamed('/cart'); // Navigate to the cart page
  }
}