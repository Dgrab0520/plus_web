import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plus_web/admin/data/chat_data.dart';
import 'package:plus_web/admin/model/chat_model.dart';
import 'package:plus_web/admin/partner_page.dart';
import 'package:plus_web/admin/setting_page.dart';

import 'main_page.dart';

class PointPage extends StatefulWidget {
  const PointPage({Key? key}) : super(key: key);

  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  List<Chat_All> all = [];
  List<Chat_All> searchResult = []; //검색 결과
  List<Chat_All> select = [];
  List<Chat_Summary> summary = [];
  bool _isLoading = false;
  bool _isLoading2 = false;
  bool _isLoading3 = false;
  String strMonth = '';
  String strYear = '';

  bool isSearch = false; //검색 체크

  TextEditingController searchController = TextEditingController(); //검색컨트롤러

  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd / EE');

    strMonth = formatter.format(now).split("-")[1];
    strYear = formatter.format(now).split("-")[0];
    print('This Month : $strMonth');
    return strMonth;
  }

  getChat() {
    Chat_Data.getChat().then((value) {
      setState(() {
        all = value;
        _isLoading = true;
      });
    });
  }

  selectChat(estimate_id) {
    Chat_Data.selectChat(estimate_id).then((value) {
      setState(() {
        select = value;
        _isLoading2 = true;
        Get.defaultDialog(
            title: '채팅',
            titleStyle: TextStyle(
              fontSize: 14.0,
              fontFamily: 'NanumSquareB',
            ),
            radius: 5.0,
            content: Container(
              padding: EdgeInsets.symmetric(vertical: 15.0),
              width: Get.width,
              height: Get.height * 0.8,
              child: ListView.builder(
                itemCount: select.length,
                itemBuilder: (_, int index) {
                  return Row(
                    children: [
                      SizedBox(width: Get.width / 30),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              left: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              right: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              bottom: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              top: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              right: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              bottom: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              top: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              select[index].isPro == '1'
                                  ? '${select[index].pro_id}'
                                  : '${select[index].customer_id}',
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              right: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              bottom: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              top: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              select[index].isPro == '1'
                                  ? '${select[index].customer_id}'
                                  : '${select[index].pro_id}',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              right: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              bottom: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              top: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              select[index].chatType == 'text'
                                  ? '${select[index].text}'
                                  : select[index].chatType == 'image'
                                      ? '이미지'
                                      : '견적서',
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              right: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              bottom: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              top: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              select[index].chatType == 'estimate'
                                  ? '${select[index].estimatePrice} 원'
                                  : select[index].chatType == 'final'
                                      ? '${select[index].finalPrice} 원'
                                      : '-',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              right: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              bottom: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                              top: BorderSide(
                                // POINT
                                color: Color(0xFFcccccc),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '${select[index].createAt}',
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'NanumSquareR',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: Get.width / 30),
                    ],
                  );
                },
              ),
            ));
      });
    });
  }

  getSummary() {
    Chat_Data.summaryChat().then((value) {
      setState(() {
        print('value : $value');
        summary = value;
        _isLoading3 = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getToday();
    getChat();
    getSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 30,
                  right: MediaQuery.of(context).size.width / 30,
                  top: MediaQuery.of(context).size.width / 70,
                  bottom: MediaQuery.of(context).size.width / 70),
              color: Color(0xff506AB4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      Get.to(MainPage());
                    },
                    child: Text(
                      '관리자 페이지',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  )),
                  InkWell(
                      //최초 홈페이지로 돌아가는 버튼
                      onTap: () {
                        print("main");
                        Get.toNamed('/');
                      },
                      child: const Icon(
                        CupertinoIcons.home,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            _isLoading
                ? Expanded(
                    flex: 9,
                    child: Column(
                      children: [
                        //Header
                        Container(
                          width: Get.width,
                          height: 60,
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30,
                            right: MediaQuery.of(context).size.width / 30,
                          ),
                          color: Color(0xFF3B4E84),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(MainPage());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(top: 1, bottom: 1),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '고객 관리',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'NanumSquareR',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(PartnerPage());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '파트너 관리',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'NanumSquareR',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '채팅 관리',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(SettingPage());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '통계&설정',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'NanumSquareR',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20),
                        Expanded(
                          //위젯으로 따로 관리
                          child: MediaQuery.of(context).size.width > 1500
                              ? bigScreen()
                              : smallScreen(),
                        )
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      )),
    );
  }

  Widget bigScreen() {
    return Column(
      children: [
        //Page Title
        Container(
          width: Get.width,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 30,
            right: MediaQuery.of(context).size.width / 30,
            top: MediaQuery.of(context).size.width / 70,
            bottom: MediaQuery.of(context).size.width / 70,
          ),
          child: const Text(
            '채팅 관리',
            style: TextStyle(
              fontFamily: 'NanumSquareEB',
              fontSize: 18,
            ),
          ),
        ),

        //Summary Header
        Container(
            width: Get.width,
            padding: EdgeInsets.only(
              left: Get.width / 30,
              right: Get.width / 30,
            ),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.arrow_right),
                    Text(
                      '요약 정보',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        child: const Center(
                          child: Text(
                            '기간',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFeeeeee),
                          border: Border(
                            top: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '전체 견적 요청 수',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFeeeeee),
                          border: Border(
                            top: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '보낸 견적 수',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFeeeeee),
                          border: Border(
                            top: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '보낸 최종 견적 수',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),

        //Summary Body
        Container(
          width: Get.width,
          padding: EdgeInsets.only(
            left: Get.width / 30,
            right: Get.width / 30,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      left: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$strYear 년 $strMonth 월',
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${summary[0].order_count} 건',
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${summary[0].estimate_count} 건',
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${summary[0].fin_count} 건',
                      style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'NanumSquareR',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 30),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
          child: const Divider(
            height: 0.0,
            thickness: 1.0,
            color: Color(0xFFe6e6e6),
          ),
        ),

        const SizedBox(height: 30),

        //Search
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: Get.width / 30,
                ),
                const Icon(Icons.arrow_right),
                const Text(
                  '전체 정보',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'NanumSquareB',
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 180,
                margin: EdgeInsets.only(right: Get.width / 30),
                child: TextField(
                  controller: searchController,
                  onSubmitted: (text) {
                    //검색
                    searchResult = [];
                    print(text);
                    searchResult.addAll(all.where((element) =>
                        element.text.contains(text) ||
                        ("견적서".contains(text) &&
                            element.text == "" &&
                            element.image == "") ||
                        ("이미지".contains(text) && element.image != "")));
                    setState(() {
                      isSearch = true;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'NanumSquareB',
                    ),
                    fillColor: const Color(0xFF2A2D3E).withOpacity(0.1),
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        //검색
                        searchResult = [];
                        print(searchController.text);
                        searchResult.addAll(all.where((element) =>
                            element.text.contains(searchController.text) ||
                            ("견적서".contains(searchController.text) &&
                                element.text == "" &&
                                element.image == "") ||
                            ("이미지".contains(searchController.text) &&
                                element.image != "")));
                        print(searchResult);
                        setState(() {
                          isSearch = true;
                        });
                      },
                      child: Container(
                        width: 35.0,
                        height: 35.0,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2697FF),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 40),

        //Table Head
        Container(
          width: Get.width,
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 30,
            right: MediaQuery.of(context).size.width / 30,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xFFeeeeee),
                      border:
                          Border.all(width: 1, color: const Color(0xFFcccccc))),
                  child: const Center(
                    child: Text(
                      '번호',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '발신인',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '수신인',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '채팅',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '견적가격',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '수신일자',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '비고',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '자세히보기',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        //Teabe Body
        Expanded(
            child: isSearch //검색을 했을때 검색결과 리스트 출력
                ? ListView.builder(
                    itemCount: searchResult.length,
                    itemBuilder: (_, int index) {
                      return Row(
                        children: [
                          SizedBox(width: Get.width / 30),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  left: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  searchResult[index].isPro == '1'
                                      ? searchResult[index].pro_id
                                      : searchResult[index].customer_id,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  searchResult[index].isPro == '1'
                                      ? searchResult[index].customer_id
                                      : searchResult[index].pro_id,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  searchResult[index].chatType == 'text'
                                      ? searchResult[index].text
                                      : searchResult[index].chatType == 'image'
                                          ? '이미지'
                                          : '견적서',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  searchResult[index].chatType == 'estimate'
                                      ? '${searchResult[index].estimatePrice} 원'
                                      : searchResult[index].chatType == 'final'
                                          ? '${searchResult[index].finalPrice} 원'
                                          : '-',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  searchResult[index].createAt,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  searchResult[index].chatType == 'final'
                                      ? '최종 견적'
                                      : '-',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  selectChat(searchResult[index].estimateId);
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 7.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFF656565)),
                                  child: const Center(
                                      child: Text(
                                    '자세히',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: Get.width / 30),
                        ],
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: all.length,
                    itemBuilder: (_, int index) {
                      return Row(
                        children: [
                          SizedBox(width: Get.width / 30),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  left: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  all[index].isPro == '1'
                                      ? all[index].pro_id
                                      : all[index].customer_id,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  all[index].isPro == '1'
                                      ? all[index].customer_id
                                      : all[index].pro_id,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  all[index].chatType == 'text'
                                      ? all[index].text
                                      : all[index].chatType == 'image'
                                          ? '이미지'
                                          : '견적서',
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  all[index].chatType == 'estimate'
                                      ? '${all[index].estimatePrice} 원'
                                      : all[index].chatType == 'final'
                                          ? '${all[index].finalPrice} 원'
                                          : '-',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  all[index].createAt,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  all[index].chatType == 'final'
                                      ? '최종 견적'
                                      : '-',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 120,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                  bottom: BorderSide(
                                    // POINT
                                    color: Color(0xFFcccccc),
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              child: InkWell(
                                onTap: () {
                                  selectChat(all[index].estimateId);
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 7.0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: const Color(0xFF656565)),
                                  child: const Center(
                                      child: Text(
                                    '자세히',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: Get.width / 30),
                        ],
                      );
                    },
                  )),

        const SizedBox(
          height: 10.0,
        )
      ],
    );
  }

  Widget smallScreen() {
    return Column(
      children: [
        //Page Title
        Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.1,
            vertical: 35.0,
          ),
          child: const Text(
            '채팅 관리',
            style: TextStyle(
              fontFamily: 'NanumSquareEB',
              fontSize: 18,
            ),
          ),
        ),

        //Summary Header
        Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
            child: Column(
              children: [
                Row(
                  children: const [
                    Icon(Icons.arrow_right),
                    Text(
                      '요약 정보',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xFFeeeeee),
                            border: Border.all(
                                width: 1, color: const Color(0xFFcccccc))),
                        child: const Center(
                          child: Text(
                            '기간',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFeeeeee),
                          border: Border(
                            top: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '전체 견적 요청 수',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFeeeeee),
                          border: Border(
                            top: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '보낸 견적 수',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xFFeeeeee),
                          border: Border(
                            top: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            '보낸 최종 견적 수',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),

        //Summary Body
        _isLoading3
            ? Container(
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '$strYear 년 $strMonth 월',
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${summary[0].order_count} 건',
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${summary[0].estimate_count} 건',
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 120,
                        height: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            right: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFcccccc),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${summary[0].fin_count} 건',
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'NanumSquareR',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(),

        const SizedBox(height: 30),

        SizedBox(
          width: Get.width * 0.8,
          child: const Divider(
            height: 0.0,
            thickness: 1.0,
            color: Color(0xFFe6e6e6),
          ),
        ),

        const SizedBox(height: 30),

        //Search
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.1,
                ),
                // ignore: prefer_const_constructors
                Icon(Icons.arrow_right),
                const Text(
                  '전체 정보',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'NanumSquareB',
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 180,
                margin: EdgeInsets.only(right: Get.width * 0.1),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'NanumSquareB',
                    ),
                    fillColor: const Color(0xFF2A2D3E).withOpacity(0.1),
                    filled: true,
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 35.0,
                        height: 35.0,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2697FF),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: const Icon(
                          CupertinoIcons.search,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 40),

        //Table Head
        Container(
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: BoxDecoration(
                      color: const Color(0xFFeeeeee),
                      border:
                          Border.all(width: 1, color: const Color(0xFFcccccc))),
                  child: const Center(
                    child: Text(
                      '번호',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '발신인',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '수신인',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '채팅',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '견적가격',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '수신일자',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '비고',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 120,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0xFFeeeeee),
                    border: Border(
                      top: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      right: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                      bottom: BorderSide(
                        // POINT
                        color: Color(0xFFcccccc),
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      '자세히보기',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        //Teabe Body
        Expanded(
            child: ListView.builder(
          itemCount: all.length,
          itemBuilder: (_, int index) {
            return Row(
              children: [
                SizedBox(
                  width: Get.width * 0.1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                        right: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        right: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        all[index].isPro == '1'
                            ? all[index].pro_id
                            : all[index].customer_id,
                        style: const TextStyle(
                          fontSize: 11,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        right: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        all[index].isPro == '1'
                            ? all[index].customer_id
                            : all[index].pro_id,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        right: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        all[index].chatType == 'text'
                            ? all[index].text
                            : all[index].chatType == 'image'
                                ? '이미지'
                                : '견적서',
                        style: const TextStyle(
                          fontSize: 11,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        right: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        all[index].chatType == 'estimate'
                            ? '${all[index].estimatePrice} 원'
                            : all[index].chatType == 'final'
                                ? '${all[index].finalPrice} 원'
                                : '-',
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        right: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        all[index].createAt,
                        style: const TextStyle(
                          fontSize: 11,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        right: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        all[index].chatType == 'final' ? '최종 견적' : '-',
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'NanumSquareR',
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 120,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        right: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                        bottom: BorderSide(
                          // POINT
                          color: Color(0xFFcccccc),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {
                        selectChat(all[index].estimateId);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 7.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xFF656565)),
                        child: const Center(
                            child: Text(
                          '자세히',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.1,
                ),
              ],
            );
          },
        )),

        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
