import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plus_web/admin/chat_page.dart';
import 'package:plus_web/admin/data/partner_data.dart';
import 'package:plus_web/admin/model/partner_model.dart';
import 'package:plus_web/admin/setting_page.dart';

import 'main_page.dart';

late Widget top;

class PartnerPage extends StatefulWidget {
  const PartnerPage({Key? key}) : super(key: key);

  @override
  _PartnerPageState createState() => _PartnerPageState();
}

class _PartnerPageState extends State<PartnerPage> {
  List<Pro_Summary> summary = [];
  List<Pro_Detail> detail = [];
  List<Pro_Detail> detail2 = [];
  bool _isLoading1 = false;
  bool _isLoading2 = false;
  bool _isLoading3 = false;
  String strYear = '';
  String strMonth = '';

  getSummary() {
    Pro_Data.getSummary().then((value) {
      setState(() {
        summary = value;
      });
      print('value : $value');
      if (value.length == 0) {
        setState(() {
          _isLoading1 = false;
        });
      } else {
        setState(() {
          print('summary : $summary');
          _isLoading1 = true;
        });
      }
    });
  }

  getPro() {
    Pro_Data.getPro().then((value) {
      setState(() {
        detail = value;
      });
      print('length2 : ${value.length}');
      if (value.length == 0) {
        setState(() {
          _isLoading2 = false;
        });
      } else {
        setState(() {
          _isLoading2 = true;
        });
      }
    });
  }

  selectPro(pro_id) {
    Pro_Data.selectPro(pro_id).then((value) {
      setState(() {
        detail2 = value;
      });
      if (value.length == 0) {
        setState(() {
          _isLoading3 = false;
        });
      } else {
        setState(() {
          _isLoading3 = true;
        });
        Get.defaultDialog(
            title: '파트너 상세 정보',
            titleStyle: TextStyle(
              fontSize: 14.0,
              fontFamily: 'NanumSquareB',
            ),
            radius: 5.0,
            content: Container(
              width: Get.width * 0.5,
              height: Get.height * 0.45,
              padding: EdgeInsets.symmetric(vertical: 15.0),
              child: ListView.builder(
                itemCount: detail2.length,
                itemBuilder: (_, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '아이디',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                '|  ${detail2[0].pro_id}',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '담당자 명',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                '|  ${detail2[0].pro_name}',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '담당자 연락처',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                '|  ${detail2[0].pro_phone}',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '회사 명',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].com_name != ''
                                    ? '|  ${detail2[0].com_name}'
                                    : '|  -',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '사업자 번호',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].com_no != ''
                                    ? '|  ${detail2[0].com_no}'
                                    : '|  -',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '서비스 지역1',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].pro_area1 != ''
                                    ? '|  ${detail2[0].pro_area1}'
                                    : '|  -',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '서비스 지역2',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].pro_area2 != ''
                                    ? '|  ${detail2[0].pro_area2}'
                                    : '|  -',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '서비스 지역3',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].pro_area3 != ''
                                    ? '|  ${detail2[0].pro_area3}'
                                    : '|  -',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '가능 서비스1',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].pro_service1 != ''
                                    ? '|  ${detail2[0].pro_service1}'
                                    : '|  -',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '가능 서비스2',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].pro_service2 != ''
                                    ? '|  ${detail2[0].pro_service2}'
                                    : '|  -',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '가능 서비스3',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].pro_service3 != ''
                                    ? '|  ${detail2[0].pro_service3}'
                                    : '|  -',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '가능 서비스4',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].pro_service4 != ''
                                    ? '|  ${detail2[0].pro_service4}'
                                    : '|  -',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '가능 서비스5',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].pro_service5 != ''
                                    ? '|  ${detail2[0].pro_service5}'
                                    : '|  -',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '제휴 여부',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                detail2[0].index == 'alli'
                                    ? '|  재휴 파트너'
                                    : '|  일반 파트너',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 3,
                              child: Text(
                                '가입일',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Text(
                                '|  ${detail2[0].register_date}',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  fontFamily: 'NanumSquareR',
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Center(
                          child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                            width: 120,
                            height: 35.0,
                            decoration: BoxDecoration(
                                color: Color(0xff506AB4),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Center(
                                child: Text(
                              '확인',
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ))),
                      ))
                    ],
                  );
                },
              ),
            ));
      }
    });
  }

  //기준 년/월 불러오기
  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd / EE');

    strMonth = formatter.format(now).split("-")[1];
    strYear = formatter.format(now).split("-")[0];
    print('This Month : $strMonth');
    return strMonth;
  }

  @override
  void initState() {
    super.initState();
    getToday();
    getSummary();
    getPro();
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
                ],
              ),
            ),
            Expanded(
                flex: 9,
                child: MediaQuery.of(context).size.width < 1500
                    ? Column(
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
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '파트너 관리',
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
                                    Get.to(PointPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '채팅 관리',
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

                          //Page Title
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                              top: MediaQuery.of(context).size.width / 70,
                              bottom: MediaQuery.of(context).size.width / 70,
                            ),
                            child: Text(
                              '파트너 관리',
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
                                    children: [
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
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFeeeeee),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xFFcccccc))),
                                          child: Center(
                                            child: Text(
                                              '기준 일자',
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
                                          decoration: BoxDecoration(
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
                                          child: Center(
                                            child: Text(
                                              '전체 파트너 수',
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
                                          decoration: BoxDecoration(
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
                                          child: Center(
                                            child: Text(
                                              '제휴 파트너 수',
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
                                          decoration: BoxDecoration(
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
                                          child: Center(
                                            child: Text(
                                              '결제완료 건 수',
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
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$strYear년 $strMonth월',
                                        style: TextStyle(
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
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _isLoading1
                                            ? '${summary[0].all_partner} 명'
                                            : '',
                                        style: TextStyle(
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
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _isLoading1
                                            ? '${summary[0].alii_partner} 명'
                                            : '',
                                        style: TextStyle(
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
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _isLoading1
                                            ? '${summary[0].pay_count} 명'
                                            : '',
                                        style: TextStyle(
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

                          SizedBox(height: 30),

                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width / 30),
                            child: Divider(
                              height: 0.0,
                              thickness: 1.0,
                              color: Color(0xFFe6e6e6),
                            ),
                          ),

                          SizedBox(height: 30),

                          //Search
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width / 30,
                                  ),
                                  Icon(Icons.arrow_right),
                                  Text(
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
                                  margin:
                                      EdgeInsets.only(right: Get.width / 30),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                      fillColor:
                                          Color(0xFF2A2D3E).withOpacity(0.1),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 35.0,
                                          height: 35.0,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF2697FF),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: Icon(
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

                          SizedBox(height: 40),

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
                                        color: Color(0xFFeeeeee),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFFcccccc))),
                                    child: Center(
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '아이디',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '연락처',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '회사명',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '사업자번호',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '제휴 여부',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '가입일',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '관리',
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

                          //Table Body
                          _isLoading2
                              ? Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width /
                                                30,
                                        right:
                                            MediaQuery.of(context).size.width /
                                                30,
                                      ),
                                      child: ListView.builder(
                                          itemCount: detail.length,
                                          itemBuilder: (_, int index) {
                                            return Row(
                                              children: [
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        right: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${index + 1}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${detail[index].pro_id}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${detail[index].pro_phone}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${detail[index].com_name}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${detail[index].com_no}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        detail[index].index ==
                                                                'alli'
                                                            ? '제휴 파트너'
                                                            : '-',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${detail[index].register_date}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {},
                                                              child: Container(
                                                                height: 25,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: Color(
                                                                        0xFF656565)),
                                                                child: Center(
                                                                    child: Text(
                                                                  '삭제',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                selectPro(
                                                                    '${detail[index].pro_id}');
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: Color(
                                                                        0xFF656565)),
                                                                child: Center(
                                                                    child: Text(
                                                                  '상세',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          })))
                              : Container(),

                          SizedBox(height: 40.0)
                        ],
                      )
                    : Column(
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
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        '파트너 관리',
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
                                    Get.to(PointPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '채팅 관리',
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

                          //Page Title
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width * 0.1,
                              vertical: 35.0,
                            ),
                            child: Text(
                              '파트너 관리',
                              style: TextStyle(
                                fontFamily: 'NanumSquareEB',
                                fontSize: 18,
                              ),
                            ),
                          ),

                          //Summary Header
                          Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.1),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
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
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: Color(0xFFeeeeee),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Color(0xFFcccccc))),
                                          child: Center(
                                            child: Text(
                                              '기준 일자',
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
                                          decoration: BoxDecoration(
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
                                          child: Center(
                                            child: Text(
                                              '전체 파트너 수',
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
                                          decoration: BoxDecoration(
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
                                          child: Center(
                                            child: Text(
                                              '제휴 파트너 수',
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
                                          decoration: BoxDecoration(
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
                                          child: Center(
                                            child: Text(
                                              '결제완료 건 수',
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
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.1),
                            child: Row(
                              children: [
                                Expanded(
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
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '$strYear년 $strMonth월',
                                        style: TextStyle(
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
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _isLoading1
                                            ? '${summary[0].all_partner} 명'
                                            : '',
                                        style: TextStyle(
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
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _isLoading1
                                            ? '${summary[0].alii_partner} 명'
                                            : '',
                                        style: TextStyle(
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
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        _isLoading1
                                            ? '${summary[0].pay_count} 명'
                                            : '',
                                        style: TextStyle(
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

                          SizedBox(height: 30),

                          SizedBox(
                            width: Get.width * 0.8,
                            child: Divider(
                              height: 0.0,
                              thickness: 1.0,
                              color: Color(0xFFe6e6e6),
                            ),
                          ),

                          SizedBox(height: 30),

                          //Search
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.1,
                                  ),
                                  Icon(Icons.arrow_right),
                                  Text(
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
                                  margin:
                                      EdgeInsets.only(right: Get.width * 0.1),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(
                                        fontSize: 14.0,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                      fillColor:
                                          Color(0xFF2A2D3E).withOpacity(0.1),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 35.0,
                                          height: 35.0,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF2697FF),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: Icon(
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

                          SizedBox(height: 40),

                          //Table Head
                          Container(
                            width: Get.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: Get.width * 0.1),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    width: 120,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFeeeeee),
                                        border: Border.all(
                                            width: 1,
                                            color: Color(0xFFcccccc))),
                                    child: Center(
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '아이디',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '연락처',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '회사명',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '사업자번호',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '제휴 여부',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '가입일',
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
                                    decoration: BoxDecoration(
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
                                    child: Center(
                                      child: Text(
                                        '관리',
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
                          _isLoading2
                              ? Expanded(
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Get.width * 0.1),
                                      child: ListView.builder(
                                          itemCount: detail.length,
                                          itemBuilder: (_, int index) {
                                            return Row(
                                              children: [
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        right: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${index + 1}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${detail[index].pro_id}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${detail[index].pro_phone}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${detail[index].com_name}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${detail[index].com_no}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        detail[index].index ==
                                                                'alli'
                                                            ? '제휴 파트너'
                                                            : '-',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '${detail[index].register_date}',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily:
                                                              'NanumSquareR',
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
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                        bottom: BorderSide(
                                                          // POINT
                                                          color:
                                                              Color(0xFFcccccc),
                                                          width: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            width: 10.0,
                                                          ),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {},
                                                              child: Container(
                                                                height: 25,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: Color(
                                                                        0xFF656565)),
                                                                child: Center(
                                                                    child: Text(
                                                                  '삭제',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Expanded(
                                                            child: InkWell(
                                                              onTap: () {
                                                                selectPro(
                                                                    '${detail[index].pro_id}');
                                                              },
                                                              child: Container(
                                                                height: 25,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: Color(
                                                                        0xFF656565)),
                                                                child: Center(
                                                                    child: Text(
                                                                  '상세',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        12,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                )),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 10.0,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          })))
                              : Container(),

                          SizedBox(height: 10.0)
                        ],
                      )),
          ],
        ),
      )),
    );
  }
}
