import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mccounting_text/mccounting_text.dart';
import 'package:plus_web/admin/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _controller = PageController();

  // late Timer _timer;
  List<Widget> slide = [];
  List<Widget> slide2 = [];

  bool isLoading = false; //화면 로딩

  bool isFooter = false;
  bool isEnd = true;

  double downloadCount = 1; //앱 다운로드 수

  @override
  void initState() {
    scraper(); //스크래퍼
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              ],
            ),
          ),
          Expanded(
            flex: 9,
            child: isLoading
                ? Listener(
                    //로딩 체크
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
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              }
                            }
                          } else {
                            if (_controller.page! < 3) {
                              _controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
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
                          : const NeverScrollableScrollPhysics(),
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
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          AnimatedContainer(
              onEnd: () {
                print("end");
                setState(() {
                  isEnd = true;
                });
              },
              duration: const Duration(milliseconds: 500),
              color: Colors.black45,
              height: isFooter ? 255 : 0,
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '대표자 | 최현성',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                          '주소 | 경기도 안양시 동안구 시민대로 327번길 11-41 (관악동 1744) 안양 창업 지원센터 3층 3133호',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      const SizedBox(height: 10),
                      const Text('TEL | 1533-1196',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      const SizedBox(height: 10),
                      const Text('사업자 등록번호 | 285-05-02282',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      const SizedBox(height: 30),
                      InkWell(
                        onTap: () {
                          Get.to(const LoginPage());
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
                          child: const Center(
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

  scraper() async {
    //스크래퍼
    try {
      final response = await http
          .post(Uri.parse("http://211.110.44.91/scraper.php"), body: {});
      print('Get Scraper Response : ${response.body}');
      if (200 == response.statusCode) {
        print(response.body.split(">")[1].split("+")[0]);
        setState(() {
          //다운로드 수
          downloadCount =
              double.parse(response.body.split(">")[1].split("+")[0]);
          print(downloadCount);
          getList();
        });
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  getList() {
    slide = [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/plus_banner.png",
          ),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
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
        decoration: const BoxDecoration(
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
                      speed: const Duration(milliseconds: 150),
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
            const SizedBox(height: 100),
            const Text(
              '쾌적하고 아름다운 공간을 만드는 토탈 홈케어 올인원 서비스',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'NanumSquareR',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '청소, 인테리어, 렌탈, 케어 모든 서비스를 제공합니다.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'NanumSquareR',
              ),
            ),
            const SizedBox(height: 70),
            const Text(
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
      // Container(
      //   decoration: BoxDecoration(
      //       image: DecorationImage(
      //         fit: BoxFit.cover,
      //         image: AssetImage(
      //           "assets/img6.jpg",
      //         ),
      //       )),
      //   child: Column(
      //     children: [
      //       Container(
      //         width:2000,
      //         height:200,
      //         decoration:BoxDecoration(
      //           color: Color(0xFF025595),
      //         ),
      //         child: Container(
      //           padding: EdgeInsets.only(top:50,),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Text(
      //                 '어디에도 없는',
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 40,
      //                   fontFamily: 'NanumSquareEB',
      //                 ),
      //               ),
      //               SizedBox(height: 10),
      //               Text(
      //                 '홈케어 올인원 서비스 +',
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 40,
      //                   fontFamily: 'NanumSquareEB',
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //       Container(
      //         margin: EdgeInsets.all(50),
      //         width:Get.width,
      //         child: Column(
      //           children: [
      //             Row(
      //               children: [
      //                 Expanded(
      //                   child: Container(
      //                     color: Color(0xffffffff),
      //                     child: Container(
      //                       width:1800,
      //                       padding: EdgeInsets.only(top:30, left:15, right:15, bottom:30),
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         boxShadow: [
      //                           BoxShadow(
      //                             color: Colors.grey.withOpacity(0.5),
      //                             spreadRadius: 3,
      //                             blurRadius: 7,
      //                             offset: Offset(0, 3), // changes position of shadow
      //                           ),
      //                         ],
      //                         borderRadius: BorderRadius.circular(20),
      //                       ),
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             children: [
      //                               Text(
      //                                 '전문가 매칭',
      //                                 style: TextStyle(
      //                                   color: Color(0xFf025595),
      //                                   fontFamily: 'NanumSquareEB',
      //                                   fontSize: 25,
      //                                 ),
      //                               ),
      //                               SizedBox(width: 5),
      //                               Text(
      //                                 '서비스',
      //                                 style: TextStyle(
      //                                   color: Colors.black,
      //                                   fontFamily: 'NanumSquareEB',
      //                                   fontSize: 25,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                           SizedBox(height: 10),
      //                           Text(
      //                             '원하시는 서비스 견적신청을 해주시면 견적서에 맞춰 파트너를 매칭 또는 추천 해드립니다.',
      //                             style: TextStyle(
      //                               height: 1.5,
      //                               fontSize: 13,
      //                               fontFamily: 'NanumSquareR',
      //                             ),
      //                             textAlign: TextAlign.center,
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(width:50),
      //                 Expanded(
      //                   child: Container(
      //                     color: Color(0xffffffff),
      //                     child: Container(
      //                       padding: EdgeInsets.all(50),
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         boxShadow: [
      //                           BoxShadow(
      //                             color: Colors.grey.withOpacity(0.5),
      //                             spreadRadius: 3,
      //                             blurRadius: 7,
      //                             offset: Offset(0, 3), // changes position of shadow
      //                           ),
      //                         ],
      //                         borderRadius: BorderRadius.circular(20),
      //                       ),
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             children: [
      //                               Text(
      //                                 '올인원 케어',
      //                                 style: TextStyle(
      //                                   color: Color(0xFf025595),
      //                                   fontFamily: 'NanumSquareEB',
      //                                   fontSize: 25,
      //                                 ),
      //                               ),
      //                               SizedBox(width: 5),
      //                               Text(
      //                                 '서비스',
      //                                 style: TextStyle(
      //                                   color: Colors.black,
      //                                   fontFamily: 'NanumSquareEB',
      //                                   fontSize: 25,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                           SizedBox(height: 10),
      //                           Text(
      //                             '청소, 인테리어, 렌탈 서비스 등등 복잡한 과정들을 한 번에 입주플러스에서 해결하세요!',
      //                             style: TextStyle(
      //                               height: 1.5,
      //                               fontSize: 13,
      //                               fontFamily: 'NanumSquareR',
      //                             ),
      //                             textAlign: TextAlign.center,
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             SizedBox(height:30),
      //             Row(
      //               children: [
      //                 Expanded(
      //                   child: Container(
      //                     color: Color(0xffffffff),
      //                     child: Container(
      //                       padding: EdgeInsets.all(50),
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         boxShadow: [
      //                           BoxShadow(
      //                             color: Colors.grey.withOpacity(0.5),
      //                             spreadRadius: 3,
      //                             blurRadius: 7,
      //                             offset: Offset(0, 3), // changes position of shadow
      //                           ),
      //                         ],
      //                         borderRadius: BorderRadius.circular(20),
      //                       ),
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             children: [
      //                               Text(
      //                                 '합리적 금액',
      //                                 style: TextStyle(
      //                                   color: Color(0xFf025595),
      //                                   fontFamily: 'NanumSquareEB',
      //                                   fontSize: 25,
      //                                 ),
      //                               ),
      //                               SizedBox(width: 5),
      //                               Text(
      //                                 '서비스',
      //                                 style: TextStyle(
      //                                   color: Colors.black,
      //                                   fontFamily: 'NanumSquareEB',
      //                                   fontSize: 25,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                           SizedBox(height: 10),
      //                           Text(
      //                             '입주플러스 파트너들은 합리적인 가격으로 예상견적을 보내드립니다.',
      //                             style: TextStyle(
      //                               height: 1.5,
      //                               fontSize: 13,
      //                               fontFamily: 'NanumSquareR',
      //                             ),
      //                             textAlign: TextAlign.center,
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(width:50),
      //                 Expanded(
      //                   child: Container(
      //                     color: Color(0xffffffff),
      //                     child: Container(
      //                       padding: EdgeInsets.all(50),
      //                       decoration: BoxDecoration(
      //                         color: Colors.white,
      //                         boxShadow: [
      //                           BoxShadow(
      //                             color: Colors.grey.withOpacity(0.5),
      //                             spreadRadius: 3,
      //                             blurRadius: 7,
      //                             offset: Offset(0, 3), // changes position of shadow
      //                           ),
      //                         ],
      //                         borderRadius: BorderRadius.circular(20),
      //                       ),
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Row(
      //                             mainAxisAlignment: MainAxisAlignment.center,
      //                             crossAxisAlignment: CrossAxisAlignment.center,
      //                             children: [
      //                               Text(
      //                                 '예상 견적',
      //                                 style: TextStyle(
      //                                   color: Color(0xFf025595),
      //                                   fontFamily: 'NanumSquareEB',
      //                                   fontSize: 25,
      //                                 ),
      //                               ),
      //                               SizedBox(width: 5),
      //                               Text(
      //                                 '서비스',
      //                                 style: TextStyle(
      //                                   color: Colors.black,
      //                                   fontFamily: 'NanumSquareEB',
      //                                   fontSize: 25,
      //                                 ),
      //                               ),
      //                             ],
      //                           ),
      //                           SizedBox(height: 10),
      //                           Text(
      //                             '파트너들의 예상 견적 서비스를 상담 전에 한 번에 받아 보세요!',
      //                             style: TextStyle(
      //                               height: 1.5,
      //                               fontSize: 13,
      //                               fontFamily: 'NanumSquareR',
      //                             ),
      //                             textAlign: TextAlign.center,
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      Container(
        color: Colors.white,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/iphone.png'),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '입주플러스에서만',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontFamily: 'NanumSquareEB',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text(
                        '볼 수 있는 ',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                      Text(
                        '올인원 케어 서비스+',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    '청소, 인테리어, 렌탈 서비스 등등 복잡한 과정들을',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                      fontFamily: 'NanumSquareR',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '입주플러스에서 한번에 해결하세요!',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                      fontFamily: 'NanumSquareR',
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Container(
                        width: 140,
                        height: 45,
                        decoration: BoxDecoration(
                            color: const Color(0xFF025595),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            '#입주플러스',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 140,
                        height: 45,
                        decoration: BoxDecoration(
                            color: const Color(0xFF025595),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            '#올인원케어',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
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
                    end: downloadCount,
                    style: const TextStyle(
                        fontSize: 70,
                        fontFamily: 'Jalnan',
                        color: Color(0xFf025595)),
                    duration: const Duration(seconds: 2),
                    curve: Curves.decelerate,
                  ),
                  const Text(
                    '+',
                    style: TextStyle(
                        color: Color(0xFF025595),
                        fontSize: 70,
                        fontFamily: 'Jalnan'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                '누적 다운로드 수',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontFamily: 'NanumSquareEB',
                ),
              ),
              const SizedBox(height: 30),
              Image.asset('assets/download.png'),
              const SizedBox(height: 30),
              InkWell(
                onTap: _launchURL,
                child: Container(
                  width: 180,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF025595),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
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
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    ];
    slide2 = [
      Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/plus_banner.png",
          ),
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(height: 300),
            // ignore: prefer_const_constructors
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
        decoration: const BoxDecoration(
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
                      speed: const Duration(milliseconds: 150),
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
            const SizedBox(height: 100),
            const Text(
              '쾌적하고 아름다운 공간을 만드는 토탈 홈케어 올인원 서비스',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'NanumSquareR',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '청소, 인테리어, 렌탈, 케어 모든 서비스를 제공합니다.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: 'NanumSquareR',
              ),
            ),
            const SizedBox(height: 70),
            const Text(
              '견적서를 작성 하시면 고객 맞춤 파트너를',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontFamily: 'NanumSquareB',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
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
        color: Colors.white,
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/iphone.png'),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '입주플러스에서만',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.black,
                      fontFamily: 'NanumSquareEB',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Text(
                        '볼 수 있는 ',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                      Text(
                        '올인원 케어 서비스+',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                          fontFamily: 'NanumSquareEB',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  const Text(
                    '청소, 인테리어, 렌탈 서비스 등등 복잡한 과정들을',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                      fontFamily: 'NanumSquareR',
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '입주플러스에서 한번에 해결하세요!',
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.black,
                      fontFamily: 'NanumSquareR',
                    ),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Container(
                        width: 140,
                        height: 45,
                        decoration: BoxDecoration(
                            color: const Color(0xFF025595),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            '#입주플러스',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        width: 140,
                        height: 45,
                        decoration: BoxDecoration(
                            color: const Color(0xFF025595),
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            '#올인원케어',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      GestureDetector(
        onVerticalDragUpdate: (details) {
          if (isEnd) {
            if (details.delta.dy < 0) {
              print("down");
              if (!isFooter) {
                setState(() {
                  isEnd = false;
                  isFooter = true;
                });
              }
            } else {
              print("up");
              if (isFooter) {
                setState(() {
                  isEnd = false;
                  isFooter = false;
                });
              } else {
                _controller.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              }
            }
          }
        },
        child: Container(
          color: Colors.white,
          child: FittedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
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
                const SizedBox(height: 20),
                const Text(
                  '누적 다운로드 수',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.black,
                    fontFamily: 'NanumSquareEB',
                  ),
                ),
                const SizedBox(height: 40),
                Image.asset('assets/download.png'),
                // ignore: prefer_const_constructors
                SizedBox(height: 40),
                InkWell(
                  onTap: _launchURL,
                  child: Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF025595),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
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
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    ];

    setState(() {
      isLoading = true;
    });
  }

  void _launchURL() async {
    //다운로드 버튼
    String _url =
        "https://play.google.com/store/apps/details?id=com.dgrab.movingPlus";
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen(this.i, {Key? key}) : super(key: key);
  final int i;
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
