import 'package:dog_app/Controllers/History_Controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        return ListTile(
                          title: Text('Item ${index + 1}'),
                          subtitle: Image.network(history[index]),
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