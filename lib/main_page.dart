import "dart:ui";

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:mccounting_text/mccounting_text.dart';
import 'package:plus_web/admin/admini_main_page.dart';
import 'package:plus_web/admin/login_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _controller = PageController();

  // late Timer _timer;
  List<Widget> slide = [];
  List<Widget> slide2 = [];

  bool isFooter = false;

  @override
  void initState() {
    super.initState();
    getList();

    _controller.addListener(() {
      print(_controller.position.userScrollDirection);
      if (_controller.position.userScrollDirection == ScrollDirection.forward) {
        if (_controller.page! > 0) {
          if (_controller.page! > 2 && isFooter) {
            setState(() {
              isFooter = false;
            });
          }
        }
      } else {
        if (_controller.page! == 3 && !isFooter) {
          setState(() {
            isFooter = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 920) {
      top = Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: [],
        ),
      );
    } else {
      top = Row(
        children: [],
      );
    }
    printError();
    //print(_controller.offset);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 30,
                right: MediaQuery.of(context).size.width / 30),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Image.asset(
                      "assets/logo.jpg",
                      width: 100,
                      height: 80,
                    ),
                  ],
                )),
                Expanded(
                  flex: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      top,
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: Listener(
              onPointerSignal: (event) {
                if (event is PointerScrollEvent) {
                  print(event.scrollDelta..dy);
                  setState(() {
                    if (event.scrollDelta.dy < 0) {
                      if (_controller.page! > 0) {
                        if (_controller.page! == 3 && isFooter) {
                          setState(() {
                            isFooter = false;
                          });
                        } else {
                          _controller.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      }
                    } else {
                      if (_controller.page! < 3) {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      } else if (_controller.page! == 3 && !isFooter) {
                        setState(() {
                          isFooter = true;
                        });
                      }
                    }
                  });
                }
              },
              child: PageView.builder(
                physics: MediaQuery.of(context).size.width < 1200
                    ? null
                    : NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                controller: _controller,
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (MediaQuery.of(context).size.width < 1200) {
                    return slide2[index % slide2.length];
                  } else {
                    return slide[index % slide.length];
                  }
                },
              ),
            ),
          ),
          AnimatedContainer(
              duration: Duration(milliseconds: 500),
              color: Colors.black45,
              height: isFooter ? 255 : 0,
              child: Container(
                width: Get.width,
                padding: EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '대표자 | 최현성',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                          '주소 | 경기도 안양시 동안구 시민대로 327번길 11-41 (관악동 1744) 안양 창업 지원센터 3층 3133호',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      SizedBox(height: 10),
                      Text('TEL | 1533-1196',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      SizedBox(height: 10),
                      Text('사업자 등록번호 | 285-05-02282',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          Get.to(LoginPage());
                        },
                        child: Container(
                          width: 130,
                          height: 35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                width: 1,
                                color: Colors.white,
                              )),
                          child: Center(
                            child: Text(
                              '관리자 페이지',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      )),
    );
  }

  getList() {
    slide = [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/plus_banner.png",
          ),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 300),
            Text(
              "쾌적하고 아름다운 공간을 만드는",
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'NanumSquareR',
              ),
            ),
            SizedBox(height: 10),
            Text(
              "토탈 홈케어 올인원 서비스",
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'NanumSquareR',
              ),
            ),
            SizedBox(height: 30),
            Text(
              "입주 플러스 +",
              style: TextStyle(
                  fontSize: 50, fontFamily: 'Jalnan', color: Color(0xFF025595)),
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/img6.jpg",
              ),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 800,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 65.0,
                  fontFamily: 'Jalnan',
                  color: Color(0xFF025595),
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "  입주 플러스 +",
                      speed: Duration(milliseconds: 150),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  totalRepeatCount: 2,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            SizedBox(height: 100),
            Text(
              '쾌적하고 아름다운 공간을 만드는 토탈 홈케어 올인원 서비스',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'NanumSquareR',
              ),
            ),
            SizedBox(height: 20),
            Text(
              '청소, 인테리어, 렌탈, 케어 모든 서비스를 제공합니다.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'NanumSquareR',
              ),
            ),
            SizedBox(height: 70),
            Text(
              '견적서를 작성 하시면 고객 맞춤 파트너를 추천 / 매칭 해드립니다.',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontFamily: 'NanumSquareB',
              ),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/img6.jpg",
              ),
            )),
        child: Column(
          children: [
            Container(
              width:2000,
              height:200,
              decoration:BoxDecoration(
                color: Color(0xFF025595),
              ),
              child: Container(
                padding: EdgeInsets.only(top:50,),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '어디에도 없는',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'NanumSquareEB',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '홈케어 올인원 서비스 +',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'NanumSquareEB',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(50),
              width:Get.width,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xffffffff),
                          child: Container(
                            width:1800,
                            padding: EdgeInsets.only(top:30, left:15, right:15, bottom:30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '전문가 매칭',
                                      style: TextStyle(
                                        color: Color(0xFf025595),
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '서비스',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '원하시는 서비스 견적신청을 해주시면 견적서에 맞춰 파트너를 매칭 또는 추천 해드립니다.',
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:50),
                      Expanded(
                        child: Container(
                          color: Color(0xffffffff),
                          child: Container(
                            padding: EdgeInsets.all(50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '올인원 케어',
                                      style: TextStyle(
                                        color: Color(0xFf025595),
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '서비스',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '청소, 인테리어, 렌탈 서비스 등등 복잡한 과정들을 한 번에 입주플러스에서 해결하세요!',
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:30),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xffffffff),
                          child: Container(
                            padding: EdgeInsets.all(50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '합리적 금액',
                                      style: TextStyle(
                                        color: Color(0xFf025595),
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '서비스',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '입주플러스 파트너들은 합리적인 가격으로 예상견적을 보내드립니다.',
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:50),
                      Expanded(
                        child: Container(
                          color: Color(0xffffffff),
                          child: Container(
                            padding: EdgeInsets.all(50),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '예상 견적',
                                      style: TextStyle(
                                        color: Color(0xFf025595),
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 25,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '서비스',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 25,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '파트너들의 예상 견적 서비스를 상담 전에 한 번에 받아 보세요!',
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 13,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Colors.white,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  McCountingText(
                    begin: 10,
                    end: 1000,
                    style: TextStyle(
                        fontSize: 70,
                        fontFamily: 'Jalnan',
                        color: Color(0xFf025595)),
                    duration: Duration(seconds: 2),
                    curve: Curves.decelerate,
                  ),
                  Text(
                    '+',
                    style: TextStyle(
                        color: Color(0xFF025595),
                        fontSize: 70,
                        fontFamily: 'Jalnan'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  '누적 다운로드 수',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontFamily: 'NanumSquareEB',
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                child: Image.asset('assets/download.png'),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF025595),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '다운로드 하러가기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    ];
    slide2 = [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/plus_banner.png",
          ),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 300),
            Text(
              "쾌적하고 아름다운 공간을 만드는",
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'NanumSquareR',
              ),
            ),
            SizedBox(height: 10),
            Text(
              "토탈 홈케어 올인원 서비스",
              style: TextStyle(
                fontSize: 23,
                fontFamily: 'NanumSquareR',
              ),
            ),
            SizedBox(height: 30),
            Text(
              "입주 플러스 +",
              style: TextStyle(
                  fontSize: 50, fontFamily: 'Jalnan', color: Color(0xFF025595)),
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/img6.jpg",
              ),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 800,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 50.0,
                  fontFamily: 'Jalnan',
                  color: Color(0xFF025595),
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "  입주 플러스 +",
                      speed: Duration(milliseconds: 150),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  totalRepeatCount: 2,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                  onTap: () {
                    print("Tap Event");
                  },
                ),
              ),
            ),
            SizedBox(height: 100),
            Text(
              '쾌적하고 아름다운 공간을 만드는 토탈 홈케어 올인원 서비스',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'NanumSquareR',
              ),
            ),
            SizedBox(height: 20),
            Text(
              '청소, 인테리어, 렌탈, 케어 모든 서비스를 제공합니다.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'NanumSquareR',
              ),
            ),
            SizedBox(height: 70),
            Text(
              '견적서를 작성 하시면 고객 맞춤 파트너를',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'NanumSquareB',
              ),
            ),
            SizedBox(height: 20),
            Text(
              '추천 / 매칭 해드립니다.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'NanumSquareB',
              ),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/img6.jpg",
              ),
            )),
        child: Column(
          children: [
            Container(
              width:1800,
              height:200,
              decoration:BoxDecoration(
                color: Color(0xFF025595),
              ),
              child: Container(
                padding: EdgeInsets.only(top:50,bottom:50,left:20,right:20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '어디에도 없는',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'NanumSquareEB',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '홈케어 올인원 서비스 +',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: 'NanumSquareEB',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:30, left:15, right:15, bottom:15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xffffffff),
                          child: Container(
                            width:1800,
                            padding: EdgeInsets.only(top:30, left:15, right:15, bottom:30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '전문가 매칭',
                                      style: TextStyle(
                                        color: Color(0xFf025595),
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '서비스',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '원하시는 서비스 견적 신청을 해주시면 견적서에 맞춰 파트너를 매칭 또는 추천 해드립니다.',
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:15),
                      Expanded(
                        child: Container(
                          color: Color(0xffffffff),
                          child: Container(
                            padding: EdgeInsets.only(top:30, left:15, right:15, bottom:30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '올인원 케어',
                                      style: TextStyle(
                                        color: Color(0xFf025595),
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '서비스',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '청소, 인테리어, 렌탈 서비스 등등 복잡한 과정들을 한 번에 입주플러스에서 해결하세요!',

                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:30),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xffffffff),
                          child: Container(
                            padding: EdgeInsets.only(top:30, left:15, right:15, bottom:30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '합리적 금액',
                                      style: TextStyle(
                                        color: Color(0xFf025595),
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '서비스',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '입주플러스 파트너들은 체계적이고 합리적인 가격으로 예상 견적을 고객님들께 보내드립니다.',
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width:15),
                      Expanded(
                        child: Container(
                          color: Color(0xffffffff),
                          child: Container(
                            padding: EdgeInsets.only(top:30, left:15, right:15, bottom:30),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '예상 견적',
                                      style: TextStyle(
                                        color: Color(0xFf025595),
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '서비스',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'NanumSquareEB',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '파트너들의 예상 견적 서비스를 채팅으로 상담하기 전 한 번에 받아 한눈에 확인 해보세요!',
                                  style: TextStyle(
                                    height: 1.5,
                                    fontSize: 12,
                                    fontFamily: 'NanumSquareR',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Container(
        color: Colors.white,
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  McCountingText(
                    begin: 10,
                    end: 1000,
                    style: TextStyle(
                        fontSize: 60,
                        fontFamily: 'Jalnan',
                        color: Color(0xFf025595)),
                    duration: Duration(seconds: 2),
                    curve: Curves.decelerate,
                  ),
                  Text(
                    '+',
                    style: TextStyle(
                        color: Color(0xFF025595),
                        fontSize: 60,
                        fontFamily: 'Jalnan'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                child: Text(
                  '누적 다운로드 수',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontFamily: 'NanumSquareEB',
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                child: Image.asset('assets/download.png'),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF025595),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text(
                      '다운로드 하러가기',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  color: Colors.black45,
                  height: isFooter ? 255 : 0,
                  child: Container(
                    width: Get.width,
                    padding: EdgeInsets.all(30),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '대표자 | 최현성',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                              '주소 | 경기도 안양시 동안구 시민대로 327번길 11-41 (관악동 1744) 안양 창업 지원센터 3층 3133호',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          SizedBox(height: 10),
                          Text('TEL | 1533-1196',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          SizedBox(height: 10),
                          Text('사업자 등록번호 | 285-05-02282',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          SizedBox(height: 30),
                          InkWell(
                            onTap: () {
                              Get.to(LoginPage());
                            },
                            child: Container(
                              width: 130,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white,
                                  )),
                              child: Center(
                                child: Text(
                                  '관리자 페이지',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ];
  }
}

class DetailScreen extends StatelessWidget {
  DetailScreen(this.i, {Key? key}) : super(key: key);
  int i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'patent_$i',
            child: Image.asset("assets/patent_$i.jpg"),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
