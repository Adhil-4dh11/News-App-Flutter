import 'dart:convert';

List<Articles> articlesFromJson(String str) =>
    List<Articles>.from(json.decode(str)['articles'].map((x) =>
        Articles.fromJson(Map<String, dynamic>.from(x))
    ));

class Articles {
  String ? author;
  String ? title;
  String ? description;
  String ? url;
  String ? urlToImage;
  String ? publishedAt;
  String ? content;

  Articles(
      {
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,
        this.publishedAt,
        this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}