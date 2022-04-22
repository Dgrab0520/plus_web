import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:plus_web/admin/model/notice_model.dart';

import 'data/notice_data.dart';
import 'noticeStatus.dart';

class NoticeEdit extends StatefulWidget {
  const NoticeEdit({Key? key, required this.noticeModel}) : super(key: key);
  final NoticeModel noticeModel;

  @override
  _NoticeEditState createState() => _NoticeEditState();
}

class _NoticeEditState extends State<NoticeEdit> {
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
  NoticeStatus? noticeStatus = NoticeStatus.start;
  NoticeType? noticeType = NoticeType.normal;

  final noticeController = Get.find<NoticeData>();

  Future<Codec> callback(Uint8List bytes,
      {bool? allowUpscaling, int? cacheWidth, int? cacheHeight}) {
    noticeImage = bytes.buffer.asUint8List();
    return instantiateImageCodec(bytes,
        targetWidth: cacheWidth, targetHeight: cacheHeight);
  }

  @override
  void initState() {
    setState(() {
      selectedImage = Container(
        height: 180,
        width: 320,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "http://211.110.44.91/plus/notice_img/${widget.noticeModel.noticeContentImg}"),
        )),
      );
    });
    titleController.text = widget.noticeModel.noticeTitle;
    contentController.text = widget.noticeModel.noticeContent;
    if (widget.noticeModel.noticeStatus == "종료") {
      noticeStatus = NoticeStatus.end;
    }
    if (widget.noticeModel.noticeType == "필독") {
      noticeType = NoticeType.special;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: 350,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '공지사항 타입',
                  style: TextStyle(
                    fontFamily: 'NanumSquareEB',
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                width: 350,
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          '일반',
                          style: TextStyle(
                            fontFamily: 'NanumSquareEB',
                          ),
                        ),
                        leading: Radio<NoticeType>(
                          activeColor: const Color(0xFF616CA1),
                          value: NoticeType.normal,
                          groupValue: noticeType,
                          onChanged: (NoticeType? value) {
                            setState(() {
                              noticeType = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          '필독',
                          style: TextStyle(
                            fontFamily: 'NanumSquareEB',
                          ),
                        ),
                        leading: Radio<NoticeType>(
                          activeColor: const Color(0xFF616CA1),
                          value: NoticeType.special,
                          groupValue: noticeType,
                          onChanged: (NoticeType? value) {
                            setState(() {
                              noticeType = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '공지사항 이미지',
                  style: TextStyle(
                    fontFamily: 'NanumSquareEB',
                    fontSize: 18,
                  ),
                ),
              ),
              InkWell(onTap: selectImage, child: selectedImage),
              const Padding(
                padding: EdgeInsets.only(left: 10.0, top: 15),
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
                padding: EdgeInsets.only(left: 10.0, top: 15),
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
                height: 60,
                padding: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  controller: contentController,
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
              SizedBox(
                height: 50,
                width: 350,
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          '진행중',
                          style: TextStyle(
                            fontFamily: 'NanumSquareEB',
                          ),
                        ),
                        leading: Radio<NoticeStatus>(
                          activeColor: const Color(0xFF616CA1),
                          value: NoticeStatus.start,
                          groupValue: noticeStatus,
                          onChanged: (NoticeStatus? value) {
                            setState(() {
                              noticeStatus = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text(
                          '종료',
                          style: TextStyle(
                            fontFamily: 'NanumSquareEB',
                          ),
                        ),
                        leading: Radio<NoticeStatus>(
                          activeColor: const Color(0xFF616CA1),
                          value: NoticeStatus.end,
                          groupValue: noticeStatus,
                          onChanged: (NoticeStatus? value) {
                            setState(() {
                              noticeStatus = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        noticeController
                            .deleteNotice(widget.noticeModel.id)
                            .then((value) {
                          if (value) {
                            Get.back(result: true);
                          } else {
                            if (!Get.isSnackbarOpen) {
                              Get.snackbar("실패", "공지사항 삭제를 실패했습니다");
                            }
                          }
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xffF04C57),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            '삭제',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NanumSquareB',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (noticeImage == null) {
                          print("null");
                        }
                        noticeController
                            .updateNotice(
                          widget.noticeModel.id,
                          noticeType:
                              noticeType == NoticeType.normal ? "일반" : "필독",
                          noticeStatus:
                              noticeStatus == NoticeStatus.start ? "진행중" : "종료",
                          noticeTitle: titleController.text,
                          noticeContent: contentController.text,
                          uFile: noticeImage,
                        )
                            .then((value) {
                          if (value) {
                            Get.back(result: true);
                          } else {
                            if (!Get.isSnackbarOpen) {
                              Get.snackbar("실패", "배너 업데이트를 실패했습니다");
                            }
                          }
                        });
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: const Color(0xff506AB4),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            '업데이트',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NanumSquareB',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  selectImage() async {
    //이미지 찾기
    noticeImage = await ImagePickerWeb.getImageAsBytes(); //이미지 한개 byte로 불러오기
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
