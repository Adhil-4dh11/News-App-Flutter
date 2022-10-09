import 'package:get/get.dart';
import 'package:news/app/models/article.dart';
import 'package:news/app/services/news_service.dart';

class NewsController extends GetxController {

  var articles = <Articles>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      var articlesTemp = await NewsWebService.fetchNews();
      if(articlesTemp != null) {
        articles(articlesTemp);
      }
      isLoading(true);
    } finally {
      isLoading(false);
    }
  }

}