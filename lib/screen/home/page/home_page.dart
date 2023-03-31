import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../detail/page/detail_page.dart';
import '../../search/page/search_page.dart';
import '../controller/home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TUGAS 2',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Atanasius Ivannoel Rio Aji',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                ),
              ),
              Divider(),
              SizedBox(
                height: 10,
              ),
              Material(
                child: Container(
                  width: Get.width,
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.amber,
                    hoverColor: Colors.amber,
                    onTap: () => Get.to(DetailPage(isbn13: '9781484206485')),
                    child: Center(
                        child: Text(
                      'GET DETAIL BOOK',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                child: Container(
                  width: Get.width,
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.amber),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    splashColor: Colors.amber,
                    hoverColor: Colors.amber,
                    onTap: () =>
                        Get.to(SearchPageResult(code: 'Flutter Developer')),
                    child: Center(
                        child: Text(
                      'GET BOOK BY NAME',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
