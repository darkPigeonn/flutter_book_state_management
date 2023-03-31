import 'package:flutter_state_management/data/model/model_book.dart';

class ModelBookResponse {
  final String? error;
  final String? total;
  final List<ModelBook>? books;
  ModelBookResponse({
    this.error,
    this.total,
    this.books,
  });

  factory ModelBookResponse.fromJson(Map<String, dynamic> json) =>
      ModelBookResponse(
        error: json["error"],
        total: json["total"],
        books: json["books"] == null
            ? []
            : List<ModelBook>.from(
                json["books"]!.map((x) => ModelBook.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "books": books == null
            ? []
            : List<dynamic>.from(books!.map((x) => x.toJson())),
      };
}
