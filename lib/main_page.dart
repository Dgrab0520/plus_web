import "dart:ui";

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccounting_text/mccounting_text.dart';

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController commentController = TextEditingController();
TextEditingController urlController = TextEditingController();

late Widget top;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _controller = PageController(initialPage: 440);
  double i = 0;

  // late Timer _timer;
  List<Widget> slide = [];

  List<Widget> slide2 = [];

  @override
  void initState() {
    super.initState();
    getList();

    _controller.addListener(() {
      setState(() {
        if ((_controller.page! % slide.length).roundToDouble() < slide.length) {
          print((_controller.page! % slide.length).roundToDouble());
          i = (_controller.page! % slide.length).roundToDouble();
        }
      });
    });
    // _timer = Timer.periodic(Duration(seconds: 7), (Timer timer) {
    //   _controller.nextPage(
    //       duration: Duration(milliseconds: 500), curve: Curves.easeIn);
    // });
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
          child: Container(
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
              child: Stack(
                children: [
                  Listener(
                    onPointerSignal: (event) {
                      if (event is PointerScrollEvent) {
                        setState(() {
                          if (event.scrollDelta.dy < 0) {
                            _controller.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          } else {
                            _controller.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          }
                        });
                      }
                    },
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      controller: _controller,
                      itemBuilder: (context, index) {
                        if (MediaQuery.of(context).size.width < 1440) {
                          return slide2[index % slide2.length];
                        } else {
                          return slide[index % slide.length];
                        }
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: DotsIndicator(
                      dotsCount: slide.length,
                      position: i,
                      axis: Axis.vertical,
                      decorator: DotsDecorator(
                        color: Color(0xFF424749),
                        activeColor: Color(0xFF025595),
                      ),
                      onTap: (pos) {
                        setState(() => _controller.jumpToPage(pos.toInt()));
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  getList() async {
    var url = Uri.parse('https://jis-company.com/worldcounter_int.php');

    slide = [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/plus_banner.png",
          ),
        )),
        alignment: Alignment.center,
        child: Text("asdf"),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
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
      Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xFF025595),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color(0xffffffff),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(50),
            child: Positioned(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
            )),
          ),
          Positioned(
              top: 300,
              right: 50,
              child: Container(
                width: 300,
                height: 300,
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
              )),
          Positioned(
              top: 300,
              right: 400,
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    padding: EdgeInsets.only(left: 20, right: 20),
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
                ],
              )),
          Positioned(
              top: 300,
              right: 750,
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    padding: EdgeInsets.only(left: 20, right: 20),
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
                              '올인원 홈케어',
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
                          '청소, 인테리어, 렌탈 서비스 등등 복잡한 과정들 한 번에 입주플러스에서 해결하세요!',
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
                ],
              )),
          Positioned(
              top: 300,
              right: 1100,
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 300,
                    padding: EdgeInsets.only(left: 20, right: 20),
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
                          '원하시는 서비스 견적신청을 해주시면 견적서에 맞춰 파트너를 매칭/추천 해드립니다.',
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
                ],
              )),
        ],
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
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
    ];
    slide2 = [
      Container(
        decoration: BoxDecoration(
          color: Color(0xFF025595),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Image.asset("assets/jeins_logo3.png"),
            )),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Color(0xFF2d3336),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Image.asset("assets/jeins_logo3.png"),
            )),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Color(0xFF2d3336),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Image.asset("assets/jeins_logo3.png"),
            )),
            Expanded(
              child: Container(),
            ),
          ],
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
