import 'package:dog_app/Controllers/History_Controllers.dart';
import 'package:dog_app/Controllers/Home_Controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


// class HistoryPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('History'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: GetBuilder<HistoryPageController>(
//           init: HistoryPageController(),
//           builder: (controller) {
//             return FutureBuilder<List<String>>(
//               future: controller.getImageHistory(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return CircularProgressIndicator();
//                 } else if (snapshot.hasError) {
//                   return Text('Error: ${snapshot.error}');
//                 } else {
//                   List<String>? history = snapshot.data;
//                   if (history != null && history.isNotEmpty) {
//                     return ListView.builder(
//                       itemCount: history.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text('Item ${index + 1}'),
//                           subtitle: Image.network(history[index]),
//                         );
//                       },
//                     );
//                   } else {
//                     return Text('No history available');
//                   }
//                 }
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomePageController home = HomePageController();
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: GetBuilder<HistoryPageController>(
          init: HistoryPageController(),
          builder: (controller) {
            return FutureBuilder<List<String>>(
              future: controller.getImageHistory(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<String>? history = snapshot.data;
                  if (history != null && history.isNotEmpty) {
                    return ListView.builder(
                      itemCount: history.length,
                      itemBuilder: (context, index) {
                        final dogImageUrl = history[index];
                        final dogBreed =home.extractBreedName(dogImageUrl);
                        return ListTile(
                          title: Text('Dog Breed: $dogBreed'),
                          subtitle: Image.network(dogImageUrl),
                        );
                      },
                    );
                  } else {
                    return Text('No history available');
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }
}

//   String _extractBreedName(String imageUrl) {
//     // Example URL: https://images.dog.ceo/breeds/springer-english/n021202040.jpg
//     final parts = imageUrl.split('/');
//     // The breed name is the third part from the end
//     final breedName = parts[parts.length - 2];
//     // Convert the breed name to title case (e.g., springer-english -> Springer English)
//     return breedName.split('-').map((word) => word.capitalizeFirst).join(' ');
//   }
// }

// // Extension method to capitalize the first letter of each word
// extension StringExtension on String {
//   String get capitalize => '${this[0].toUpperCase()}${substring(1)}';
// }
