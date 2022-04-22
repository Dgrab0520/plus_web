import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_web/admin/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff506AB4),
      body: Container(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 480,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding:
                    EdgeInsets.only(top: 40, right: 30, bottom: 0, left: 30),
                width: MediaQuery.of(context).size.width,
                height: 390,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontFamily: 'NanumSquareEB',
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '로그인 후 이용해주세요.',
                      style: TextStyle(
                        color: Color(0xFF929292),
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      '아이디',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    Container(
                      width: Get.width,
                      height: 60,
                      padding: EdgeInsets.only(top: 10.0),
                      child: TextField(
                        controller: idController,
                        autocorrect: true,
                        maxLength: 20,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: '아이디를 입력해주세요.',
                          hintStyle: TextStyle(
                            color: Color(0xFF929292),
                            fontSize: 12,
                          ),
                          fillColor: Color(0xFFF5F7F9),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Color(0xFF616CA1), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Color(0xFF616CA1), width: 1),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),
                    Text(
                      '비밀번호',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'NanumSquareB',
                      ),
                    ),
                    Container(
                      width: Get.width,
                      height: 60,
                      padding: EdgeInsets.only(top: 10.0),
                      child: TextField(
                        controller: pwController,
                        maxLength: 15,
                        obscureText: true,
                        autocorrect: false,
                        onSubmitted: (text) {
                          (idController.text == 'no2000chs@naver.com' &&
                                      text == 'Kshm2850502282') ||
                                  (idController.text == 'a' && text == 'a')
                              ? Get.to(MainPage())
                              : Get.snackbar('로그인 실패', '아이디 또는 비밀번호를 확인해주세요',
                                  backgroundColor: Colors.white);
                        },
                        decoration: InputDecoration(
                          counterText: "",
                          hintText: '비밀번호를 입력해주세요.',
                          hintStyle: TextStyle(
                            color: Color(0xFF929292),
                            fontSize: 12,
                          ),
                          fillColor: Color(0xFFF5F7F9),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Color(0xFF616CA1), width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            borderSide:
                                BorderSide(color: Color(0xFF616CA1), width: 2),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height:10),
                    // Container(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.end,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       InkWell(
                    //           onTap: () {
                    //             Get.to(Sign_Up());
                    //           },
                    //           child: Text('회원가입',
                    //             style: TextStyle(
                    //               fontSize:12,
                    //             ),
                    //           )),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        // Get.to(MainPage());
                        (idController.text == 'no2000chs@naver.com' &&
                                    pwController.text == 'Kshm2850502282') ||
                                (idController.text == 'a' &&
                                    pwController.text == 'a')
                            ? Get.to(MainPage())
                            : Get.snackbar('로그인 실패', '아이디 또는 비밀번호를 확인해주세요',
                                backgroundColor: Colors.white);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xff506AB4),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            '로그인',
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
          ],
        ),
      ),
    );
  }
}
