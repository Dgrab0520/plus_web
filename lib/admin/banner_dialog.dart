import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_web/admin/banner_add.dart';
import 'package:plus_web/admin/banner_edit.dart';
import 'package:plus_web/admin/data/banner_data.dart';

class BannerDialog extends StatelessWidget {
  BannerDialog({Key? key}) : super(key: key);

  final bannerController = Get.put(Banner_Data());

  @override
  Widget build(BuildContext context) {
    bannerController.getBanner_Main();
    bannerController.getBanner_Sub();
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
                      '메인 배너',
                      style: TextStyle(
                        fontFamily: 'NanumSquareEB',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var result = await Get.dialog(const BannerAdd(
                        type: "main",
                      ));
                      if (result != null) {
                        bannerController.getBanner_Main();
                      }
                    },
                    child: const Text(
                      "배너 추가",
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
                      itemCount: bannerController.bannerMain.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            var result = await Get.dialog(BannerEdit(
                              banners: bannerController.bannerMain[index],
                            ));
                            if (result != null) {
                              bannerController.getBanner_Main();
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
                                        "http://211.110.44.91/plus/banner/${bannerController.bannerMain[index].banner_img}"),
                                  ),
                                  Text(
                                    bannerController
                                        .bannerMain[index].banner_title,
                                    style: TextStyle(
                                      fontFamily: 'NanumSquareEB',
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    bannerController
                                        .bannerMain[index].banner_sub,
                                    style: TextStyle(
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
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '서브 배너',
                      style: TextStyle(
                        fontFamily: 'NanumSquareEB',
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var result = await Get.dialog(const BannerAdd(
                        type: "sub",
                      ));
                      if (result != null) {
                        bannerController.getBanner_Sub();
                      }
                    },
                    child: const Text(
                      "배너 추가",
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
                height: 150,
                child: Obx(
                  () => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: bannerController.bannerSub.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () async {
                            var result = await Get.dialog(BannerEdit(
                                banners: bannerController.bannerSub[index]));
                            if (result != null) {
                              bannerController.getBanner_Sub();
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
                                        "http://211.110.44.91/plus/banner/${bannerController.bannerSub[index].banner_img}"),
                                  ),
                                  Text(
                                    bannerController
                                        .bannerSub[index].banner_title,
                                    style: TextStyle(
                                      fontFamily: 'NanumSquareEB',
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    bannerController
                                        .bannerSub[index].banner_sub,
                                    style: TextStyle(
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
