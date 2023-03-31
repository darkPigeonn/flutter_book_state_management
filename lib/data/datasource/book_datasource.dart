import 'dart:convert';

import 'package:flutter_state_management/constants/constants.dart';
import 'package:flutter_state_management/data/model/model_bookDetail.dart';
import 'package:flutter_state_management/data/model/model_response_book.dart';
import 'package:http/http.dart' as client;

class BookDataSource {
  Future<ModelBookResponse> getBooks(String query) async {
    try {
      final urlPath = Constants.urlBook + query;

      final response = await client.get(Uri.parse(urlPath));

      if (response.statusCode == 200) {
        return ModelBookResponse.fromJson(json.decode(response.body));
      }

      return ModelBookResponse();
    } catch (e) {
      rethrow;
    }
  }

  Future<BookDetailModel> getBookDetail(String query) async {
    try {
      final urlPath = Constants.urlBook + query;
      print(urlPath);
      final response = await client.get(Uri.parse(urlPath));

      if (response.statusCode == 200) {
        return BookDetailModel.fromJson(json.decode(response.body));
      }

      return BookDetailModel();
    } catch (e) {
      rethrow;
    }
  }
}
