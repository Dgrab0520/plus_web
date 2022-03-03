import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:plus_web/admin/data/banner_data.dart';
import 'package:plus_web/admin/model/banner_model.dart';

class BannerEdit extends StatefulWidget {
  const BannerEdit({Key? key, required this.banners}) : super(key: key);
  final Banners banners;

  @override
  _BannerEditState createState() => _BannerEditState();
}

class _BannerEditState extends State<BannerEdit> {
  Uint8List? bannerImage;
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
    bannerImage = bytes.buffer.asUint8List();
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
              "http://211.110.44.91/plus/banner/${widget.banners.banner_img}"),
        )),
      );
    });
    titleController.text = widget.banners.banner_title;
    contentController.text = widget.banners.banner_sub;
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
                  '배너 이미지',
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
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Banner_Data.deleteBanner(widget.banners.banner_id)
                            .then((value) {
                          if (value) {
                            Get.back(result: true);
                          } else {
                            if (!Get.isSnackbarOpen) {
                              Get.snackbar("실패", "배너 삭제를 실패했습니다");
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
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (bannerImage == null) {
                          print("null");
                        }
                        Banner_Data.updateBanner(widget.banners.banner_id,
                                titleController.text, contentController.text,
                                banner_img: bannerImage == null
                                    ? null
                                    : widget.banners.banner_img,
                                ufile: bannerImage)
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
    bannerImage = await ImagePickerWeb.getImageAsBytes();
    if (bannerImage == null) {
      Get.snackbar("실패", "파일 불러오기를 실패했습니다 다시 시도해주세요");
    }
    print(bannerImage!.length);
    if (bannerImage!.length >= 8388608) {
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
            image: MemoryImage(bannerImage!),
          )),
        );
      });
    }
  }
}
