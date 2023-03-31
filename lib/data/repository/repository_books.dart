import 'package:flutter_state_management/data/datasource/book_datasource.dart';
import 'package:flutter_state_management/data/model/model_book.dart';
import 'package:flutter_state_management/data/model/model_bookDetail.dart';
import 'package:flutter_state_management/data/model/model_response_book.dart';
import 'package:flutter_state_management/domain/repository/book_repository.dart';

class RepositoryBooksImpl implements BookRepository {
  final BookDataSource _dataSource = BookDataSource();

  @override
  Future<ModelBookResponse> getAllNewBook(String query) async =>
      await _dataSource.getBooks(query);

  @override
  Future<BookDetailModel> getDetailBook(String query) async =>
      await _dataSource.getBookDetail(query);
}
