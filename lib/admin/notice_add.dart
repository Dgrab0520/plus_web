import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:plus_web/admin/data/notice_data.dart';
import 'package:plus_web/admin/model/notice_model.dart';


class NoticeAdd extends StatefulWidget {
  const NoticeAdd({Key? key}) : super(key:key);

  @override
  _NoticeAddState createState() => _NoticeAddState();
}

class _NoticeAddState extends State<NoticeAdd>{
  Uint8List? noticeImage;
  Widget selectedImage = Container(
    height: 180,
    width: 320,
    alignment: Alignment.center,
    color: Colors.grey.withOpacity(0.3),
    child: const Icon(CupertinoIcons.add_circled),
  );

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final maxLines = 5;
    return AlertDialog(
      content: SizedBox(
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '공지 이미지',
                style: TextStyle(
                  fontFamily: 'NanumSquareEB',
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10.0,),
              InkWell(onTap: selectImage, child: selectedImage),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  '제목',
                  style: TextStyle(
                    fontFamily: 'NanumSquareEB',
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                width: Get.width,
                height: 60,
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    counterText: "",
                    hintText: '제목을 입력해주세요',
                    hintStyle: TextStyle(
                      color: Color(0xFF929292),
                      fontSize: 12,
                    ),
                    fillColor: Color(0xFFF5F7F9),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                      BorderSide(color: Color(0xFF616CA1), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                      BorderSide(color: Color(0xFF616CA1), width: 2),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: Text(
                  '내용',
                  style: TextStyle(
                    fontFamily: 'NanumSquareEB',
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                width: Get.width,
                height: maxLines * 24,
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: contentController,
                  maxLines: maxLines,
                  onSubmitted: (text) {},
                  decoration: const InputDecoration(
                    counterText: "",
                    hintText: '내용을 입력해주세요',
                    hintStyle: TextStyle(
                      color: Color(0xFF929292),
                      fontSize: 12,
                    ),
                    fillColor: Color(0xFFF5F7F9),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                      BorderSide(color: Color(0xFF616CA1), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide:
                      BorderSide(color: Color(0xFF616CA1), width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  var notice = Notices(
                      id: 0,
                      notice_id: "noticeid",
                      notice_type: '일반',
                      notice_title: titleController.text,
                      notice_content: contentController.text,
                      notice_content_img: "notice_img",
                      notice_status: "진행중"
                  );
                  Notice_Data.insertNotice(notice, noticeImage).then((value){
                    if(value){
                      Get.back(result: true);
                    }else{
                      if(!Get.isSnackbarOpen){
                        Get.snackbar("오류", "공지사항을 저장하지 못했습니다");
                      }
                    }
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color(0xff506AB4),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      '업로드',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'NanumSquareB',
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  selectImage() async {
    noticeImage = await ImagePickerWeb.getImageAsBytes();
    if (noticeImage == null) {
      Get.snackbar("실패", "파일 불러오기를 실패했습니다 다시 시도해주세요");
    }
    print(noticeImage!.length);
    if (noticeImage!.length >= 8388608) {
      Get.back();
      Get.snackbar("Error", "Too Big File(max : 8MB)",
          backgroundColor: Colors.white);
    } else {
      setState(() {
        selectedImage = Container(
          height: 180,
          width: 320,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: MemoryImage(noticeImage!),
              )),
        );
      });
    }
  }
}