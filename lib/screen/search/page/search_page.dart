import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../detail/page/detail_page.dart';
import '../../home/controller/home_controller.dart';
import '../controller/search_controller.dart';

class SearchPageResult extends StatelessWidget {
  SearchPageResult({super.key, required this.code});

  final _controller = Get.put(SearchController());

  String? code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: GetBuilder<SearchController>(
            init: _controller,
            initState: (state) => _controller.searchByName(code!),
            builder: (context) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _controller.listOfBooks.value.length,
                      itemBuilder: (context, index) {
                        final book = _controller.listOfBooks.value[index];

                        return Material(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            width: Get.width,
                            height: 90,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () =>
                                  Get.to(DetailPage(isbn13: book.isbn13 ?? '')),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      book.image ?? '',
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Container(
                                          height: 30,
                                          width: 30,
                                          color: Colors.red,
                                        );
                                      },
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.title ?? 'Empty',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          width: 150,
                                          child: Text(
                                            book.subtitle ?? 'Empty',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
