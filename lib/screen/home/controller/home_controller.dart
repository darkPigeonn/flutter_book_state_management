import 'package:flutter/material.dart';
import 'package:flutter_state_management/data/model/model_book.dart';
import 'package:flutter_state_management/data/repository/repository_books.dart';
import 'package:flutter_state_management/domain/repository/book_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final BookRepository _repository = RepositoryBooksImpl();

  Rx<List<ModelBook>> listOfBooks = Rx([]);
  Rx<TextEditingController> searchController = Rx(TextEditingController());

  void getBooks() async {
    final response = await _repository.getAllNewBook('new');
    listOfBooks(response.books);

    update();
  }

  void searchByText(String input) {}
}
