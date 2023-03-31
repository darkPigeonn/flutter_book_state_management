import 'package:flutter_state_management/data/model/model_book.dart';
import 'package:flutter_state_management/data/model/model_bookDetail.dart';
import 'package:flutter_state_management/data/model/model_response_book.dart';

abstract class BookRepository {
  Future<ModelBookResponse> getAllNewBook(String query);
  Future<BookDetailModel> getDetailBook(String query);
}
