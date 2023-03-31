class ModelBook {
  ModelBook({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  String? title;
  String? subtitle;
  String? isbn13;
  String? price;
  String? image;
  String? url;

  factory ModelBook.fromJson(Map<String, dynamic> json) => ModelBook(
        title: json["title"],
        subtitle: json["subtitle"],
        isbn13: json["isbn13"],
        price: json["price"],
        image: json["image"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "isbn13": isbn13,
        "price": price,
        "image": image,
        "url": url,
      };
}
