import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/app/controllers/news_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewsController _newsController = Get.put(NewsController());
    return Scaffold(
      backgroundColor: const Color.fromRGBO(7, 54, 51, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(7, 54, 51, 1),
        title: const Text(
          "News Headlines",
          style: TextStyle(
            color: Color.fromRGBO(255, 255, 255, 1),
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() => _newsController.isLoading.value ?
      const Center(
        child: CircularProgressIndicator(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
      ) : ListView.builder(
        itemCount: _newsController.articles.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(5, 40, 38, 1),
              borderRadius: BorderRadius.circular(8)
            ),
            child: Center(
              child: Text(
                _newsController.articles[index].title!,
                style: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
      )
    );
  }
}
