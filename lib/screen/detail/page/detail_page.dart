import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../controller/detail_controller.dart';

class DetailPage extends StatelessWidget {
  final String isbn13;
  DetailPage({super.key, required this.isbn13});
  final _controller = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<DetailController>(
          init: _controller,
          initState: (state) => _controller.getDetail(isbn13),
          builder: (context) {
            final book = _controller.book.value;
            return SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      book.title ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      book.subtitle ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Penulis : ${book.authors ?? ''}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RatingBar.builder(
                      initialRating: double.parse(book.rating!),
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30.0,
                      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        book.price.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Image.network(
                      book.image ?? '',
                      height: 300,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 30,
                          width: 30,
                          color: Colors.red,
                        );
                      },
                    ),
                    Text(
                      'Deskripsi : ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      child: Text(
                        book.desc.toString(),
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
