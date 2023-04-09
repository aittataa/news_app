import "dart:convert";

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

class Articles {
  Articles({
    this.status,
    this.totalResults,
    this.articles = const <Article>[],
  });

  late String? status;
  late int? totalResults;
  late List<Article> articles;

  factory Articles.fromJson(Map<String, dynamic> json) {
    return Articles(
      status: json["status"],
      totalResults: json["totalResults"],
      articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
    );
  }
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  late Source? source;
  late String? author;
  late String? title;
  late String? description;
  late String? url;
  late String? urlToImage;
  late DateTime? publishedAt;
  late String? content;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      source: Source.fromJson(json["source"]),
      author: json["author"],
      title: json["title"],
      description: json["description"],
      url: json["url"],
      urlToImage: json["urlToImage"],
      publishedAt: DateTime.parse(json["publishedAt"]),
      content: json["content"],
    );
  }
}

class Source {
  Source({
    this.id,
    this.name,
  });

  late String? id;
  late String? name;

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json["id"],
      name: json["name"],
    );
  }
}
