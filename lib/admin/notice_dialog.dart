import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_web/admin/data/notice_data.dart';
import 'package:plus_web/admin/notice_add.dart';
import 'package:plus_web/admin/notice_edit.dart';

class NoticeDialog extends StatelessWidget {
  NoticeDialog({Key? key}) : super(key: key);

  final noticeController = Get.put(Notice_Data());
  
  @override
  Widget build(BuildContext context) {
    noticeController.getNotice();
    return AlertDialog(
      content: SizedBox(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
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
                  SizedBox(width: 10.0,),
                  TextButton(
                    onPressed: () async {
                      var result = await Get.dialog(const NoticeAdd());
                      if(result != null){
                        //공지 추가 성공시 공지 리프레쉬
                        noticeController.getNotice();
                      }
                    },
                    child: Text(
                      '공지사항 등록',
                      style: TextStyle(
                        fontFamily: 'NanumSquareR',
                        fontSize: 10,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      primary: const Color(0xff506AB4),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 500.0,
                child: Obx(
                    () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: noticeController.noticeMain.length,
                      itemBuilder: (BuildContext context, int index){
                        return InkWell(
                          //공지 클릭 시 공지 업데이트 창
                          onTap: () async {
                            print('asd ${noticeController.noticeMain[index]}');
                            var result = await Get.dialog(NoticeEdit(
                                notices : noticeController.noticeMain[index],
                            ));
                            if(result != null){
                              //공지 업데이트 성공시 공지 리스트 리프레쉬
                              noticeController.getNotice();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Container(
                              width: 200.0,
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  noticeController.noticeMain[index].notice_content_img == 'default.jpg'
                                  ?
                                  Expanded(
                                      child: Container(
                                        child: Center(
                                          child: Text('이미지 없음',
                                            style: TextStyle(
                                              fontFamily: 'NanumSquareR',
                                              fontSize: 10,
                                            ),
                                          ),
                                        ),
                                      )
                                  )
                                  :
                                  Expanded(
                                    child: Center(child: Image.network("http://211.110.44.91/plus/notice_img/${noticeController.noticeMain[index].notice_content_img}", fit: BoxFit.fill),),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Center(
                                    child: Text(noticeController.noticeMain[index].notice_title,
                                      style: const TextStyle(
                                        fontFamily: 'NanumSquareR',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
