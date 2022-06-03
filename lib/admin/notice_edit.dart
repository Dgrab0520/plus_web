import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';

import 'data/notice_data.dart';
import 'model/notice_model.dart';

class NoticeEdit extends StatefulWidget{
  const NoticeEdit({Key? key, required this.notices}) : super(key: key);
  final Notices notices;

  @override
  _NoticeEditState createState() => _NoticeEditState();
}

class _NoticeEditState extends State<NoticeEdit>{
  Uint8List? noticeImage;
  String notice_type = '';
  String notice_status = '';
  Widget selectedImage = Container(
    height: 180,
    width: 320,
    alignment: Alignment.center,
    color: Colors.grey.withOpacity(0.3),
    child: const Icon(CupertinoIcons.add_circled),
  );

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  Future<Codec> callback(Uint8List bytes,
      {bool? allowUpscaling, int? cacheWidth, int? cacheHeight}) {
    noticeImage = bytes.buffer.asUint8List();
    return instantiateImageCodec(bytes, targetWidth: cacheWidth, targetHeight: cacheHeight);
  }

  @override
  void initState() {
    setState(() {
      print('notice : ${widget.notices}');
      selectedImage = Container(
        height: 180.0,
        width: 320.0,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  "http://211.110.44.91/plus/notice_img/${widget.notices.notice_content_img}"),
            )),
      );
    });
    notice_type = widget.notices.notice_type;
    notice_status = widget.notices.notice_status;
    titleController.text = widget.notices.notice_title;
    contentController.text = widget.notices.notice_content;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final maxLines = 5;
    return AlertDialog(
      content: SizedBox(
        width: 350.0,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  '공지 이미지',
                  style: TextStyle(
                    fontFamily: 'NanumSquareEB',
                    fontSize: 18,
                  ),
                ),
              ),
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
              Row(
                children: [
                  Text(
                    '타입',
                    style: TextStyle(
                      fontFamily: 'NanumSquareEB',
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          notice_type = "필독";
                        });
                      },
                      child: Container(
                        height: 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: notice_type == '일반' ? Colors.grey : Color(0xFF616CA1),  //0xFF616CA1
                        ),
                        child: Center(
                          child: Text(
                            '필독',
                            style: TextStyle(
                              fontFamily: 'NanumSquareEB',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ),
                    ),
                  ),
                  const SizedBox(width: 3.0,),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          notice_type = "일반";
                        });
                      },
                      child: Container(
                        height: 35.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.0),
                          color: notice_type == '일반' ? Color(0xFF616CA1) : Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            '일반',
                            style: TextStyle(
                              fontFamily: 'NanumSquareEB',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    '상태',
                    style: TextStyle(
                      fontFamily: 'NanumSquareEB',
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(width: 8,),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          notice_status = "진행중";
                        });
                      },
                      child: Container(
                          height: 35.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: notice_status == '진행중' ? Color(0xFF616CA1) : Colors.grey,  //0xFF616CA1
                          ),
                          child: Center(
                            child: Text(
                              '진행중',
                              style: TextStyle(
                                fontFamily: 'NanumSquareEB',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                      ),
                    ),
                  ),
                  const SizedBox(width: 3.0,),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          notice_status = "종료";
                        });
                      },
                      child: Container(
                          height: 35.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.0),
                            color: notice_status == '종료' ? Color(0xFF616CA1) : Colors.grey,
                          ),
                          child: Center(
                            child: Text(
                              '종료',
                              style: TextStyle(
                                fontFamily: 'NanumSquareEB',
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          )
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                        onTap: (){
                          Notice_Data.deleteNotice(widget.notices.notice_id).then((value){
                            if(value){
                              Get.back(result: true);
                            }else{
                              if(!Get.isSnackbarOpen){
                                Get.snackbar("실패", "공지사항 삭제를 실패했습니다");
                              }
                            }
                          });
                        },
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                              color: const Color(0xffF04C57),
                              borderRadius: BorderRadius.circular(5)
                          ),
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
                      )
                  ),
                  SizedBox(width: 10.0,),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if(noticeImage == null){
                          print('null');
                        }
                        Notice_Data.updateNotice(widget.notices.notice_id, notice_type, titleController.text, contentController.text, notice_status, notice_content_img: noticeImage == null ? null : widget.notices.notice_content_img, ufile: noticeImage).then((value){
                          if(value){
                            Get.back(result: true);
                          }else {
                            if (!Get.isSnackbarOpen) {
                              Get.snackbar("실패", "배너 업데이트를 실패했습니다");
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
                  )
                ],
              ),


            ],
          )
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