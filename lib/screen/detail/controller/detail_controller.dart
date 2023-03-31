import 'package:flutter_state_management/data/datasource/book_datasource.dart';
import 'package:flutter_state_management/data/model/model_book.dart';
import 'package:flutter_state_management/data/model/model_bookDetail.dart';
import 'package:flutter_state_management/data/repository/repository_books.dart';
import 'package:flutter_state_management/domain/repository/book_repository.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final BookRepository _repository = RepositoryBooksImpl();

  Rx<BookDetailModel> book = Rx(BookDetailModel());
  void getDetail(String isbn13) async {
    final response = await _repository.getDetailBook('/books/' + isbn13);

    book(response);

    update();
  }
}
