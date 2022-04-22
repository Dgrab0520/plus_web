import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_web/admin/notice_add.dart';

import 'data/notice_data.dart';
import 'notice_edit.dart';

class NoticeDialog extends StatelessWidget {
  NoticeDialog({Key? key}) : super(key: key);

  final noticeController = Get.put(NoticeData());

  @override
  Widget build(BuildContext context) {
    noticeController.getNotice();
    return AlertDialog(
      content: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '공지사항',
                      style: TextStyle(
                        fontFamily: 'NanumSquareEB',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var result = await Get.dialog(const NoticeAdd());
                      if (result != null) {
                        //공지사항 추가 성공시 공지사항 리프레쉬
                        noticeController.getNotice();
                      }
                    },
                    child: const Text(
                      "공지사항 추가",
                      style: TextStyle(
                        fontFamily: 'NanumSquareR',
                        fontSize: 10,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: const Color(0xff506AB4),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: Obx(
                  () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: noticeController.notices.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          //배너 클릭시 배너 업데이트 창
                          onTap: () async {
                            var result = await Get.dialog(NoticeEdit(
                              noticeModel: noticeController.notices[index],
                            ));
                            if (result != null) {
                              //공지사항 추가 성공시 공지사항 리프레쉬
                              noticeController.getNotice();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      "http://211.110.44.91/plus/notice_img/${noticeController.notices[index].noticeContentImg}",
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Icon(Icons.error);
                                      },
                                    ),
                                  ),
                                  Text(
                                    "[${noticeController.notices[index].noticeType}]" +
                                        noticeController
                                            .notices[index].noticeTitle,
                                    style: const TextStyle(
                                      fontFamily: 'NanumSquareEB',
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    noticeController
                                        .notices[index].noticeContent,
                                    style: const TextStyle(
                                      fontFamily: 'NanumSquareR',
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
