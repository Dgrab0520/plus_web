import "dart:ui";

import 'package:plus_web/admin/data/customer_data.dart';
import 'package:plus_web/admin/model/customer_model.dart';
import 'package:plus_web/admin/partner_page.dart';
import 'package:plus_web/admin/chat_page.dart';
import 'package:plus_web/admin/setting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';



class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  String strMonth = '';
  String strYear = '';
  int page_number = 0;
  int page_index = 0;
  List<Cus_Summary> summary = [];
  List<Cus_Detail> detail = [];
  bool _isLoading1 = false;
  bool _isLoading2 = false;


  //기준 년/월 불러오기
  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd / EE');

    strMonth = formatter.format(now).split("-")[1];
    strYear = formatter.format(now).split("-")[0];
    print('This Month : $strMonth');
    return strMonth;
  }

  //Summary 정보 불러오기
  getSummary(){
    Customer_Data.getSummary(strYear+'-'+strMonth).then((value){
      setState(() {
        summary = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading1 = false;
        });
      }else{
        setState(() {
          _isLoading1 = true;
        });
      }
    });
  }

  //Detail 정보 불러오기
  getDetail(){
    Customer_Data.getDetail().then((value){
      setState(() {
        detail = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading2 = false;
        });
      }else{
        setState(() {
          page_number = ((detail.length)/2).ceil();
          _isLoading2 = true;
        });
      }
    });
  }

  @override
  void initState(){
    getToday();
    getSummary();
    getDetail();
    super.initState();
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
                      bottom: MediaQuery.of(context).size.width / 70
                  ),
                  color: Color(0xff506AB4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap:(){
                              Get.to(MainPage());
                            },
                            child: Text(
                              '관리자 페이지',
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 20,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          )
                      ),
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
                            width:Get.width,
                            height:60,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            color:Color(0xFF3B4E84),
                            child: Row(
                              children: [
                                InkWell(

                                  onTap:(){},
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(top:1,bottom:1),
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                    ),
                                    child: Center(
                                      child: Text('고객 관리',
                                        style: TextStyle(
                                          fontSize:16,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    Get.to(PartnerPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color:Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text('파트너 관리',
                                        style: TextStyle(
                                          fontSize:16,
                                          fontFamily: 'NanumSquareR',
                                          color:Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    Get.to(PointPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color:Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text('채팅 관리',
                                        style: TextStyle(
                                          fontSize:16,
                                          fontFamily: 'NanumSquareR',
                                          color:Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    Get.to(SettingPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color:Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text('통계&설정',
                                        style: TextStyle(
                                          fontSize:16,
                                          fontFamily: 'NanumSquareR',
                                          color:Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height:20),

                          //Page Title
                          Container(
                            width:Get.width,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                              top: MediaQuery.of(context).size.width / 70,
                              bottom: MediaQuery.of(context).size.width / 70,
                            ),
                            child: Text('고객 회원 관리',
                              style:TextStyle(
                                fontFamily: 'NanumSquareEB',
                                fontSize:18,
                              ),
                            ),
                          ),

                          //Summary Header
                          Container(
                            width:Get.width,
                            padding: EdgeInsets.only(
                              left: Get.width / 30,
                              right: Get.width / 30,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.arrow_right),
                                    Text('요약 정보',
                                      style:TextStyle(
                                        fontSize:14,
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
                                        height:40,
                                        decoration: BoxDecoration(
                                            color:Color(0xFFeeeeee),
                                            border: Border.all(
                                                width:1,
                                                color:Color(0xFFcccccc)
                                            )
                                        ),
                                        child: Center(
                                          child: Text('요약 정보',
                                            style:TextStyle(
                                              fontSize:14,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 120,
                                        height:40,
                                        decoration: BoxDecoration(
                                          color:Color(0xFFeeeeee),
                                          border: Border(
                                            top: BorderSide( // POINT
                                              color: Color(0xFFcccccc),
                                              width: 1.0,
                                            ),
                                            right: BorderSide( // POINT
                                              color: Color(0xFFcccccc),
                                              width: 1.0,
                                            ),
                                            bottom: BorderSide( // POINT
                                              color: Color(0xFFcccccc),
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text('전체 회원 수',
                                            style:TextStyle(
                                              fontSize:14,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 120,
                                        height:40,
                                        decoration: BoxDecoration(
                                          color:Color(0xFFeeeeee),
                                          border: Border(
                                            top: BorderSide( // POINT
                                              color: Color(0xFFcccccc),
                                              width: 1.0,
                                            ),
                                            right: BorderSide( // POINT
                                              color: Color(0xFFcccccc),
                                              width: 1.0,
                                            ),
                                            bottom: BorderSide( // POINT
                                              color: Color(0xFFcccccc),
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text('$strMonth월 회원가입',
                                            style:TextStyle(
                                              fontSize:14,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 120,
                                        height:40,
                                        decoration: BoxDecoration(
                                          color:Color(0xFFeeeeee),
                                          border: Border(
                                            top: BorderSide( // POINT
                                              color: Color(0xFFcccccc),
                                              width: 1.0,
                                            ),
                                            right: BorderSide( // POINT
                                              color: Color(0xFFcccccc),
                                              width: 1.0,
                                            ),
                                            bottom: BorderSide( // POINT
                                              color: Color(0xFFcccccc),
                                              width: 1.0,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text('$strMonth월 작업요청',
                                            style:TextStyle(
                                              fontSize:14,
                                              fontFamily: 'NanumSquareB',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ),

                          //Summary Body
                          Container(
                            width:Get.width,
                            padding: EdgeInsets.only(
                              left: Get.width / 30,
                              right: Get.width / 30,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      border: Border(
                                        left: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('$strYear년 $strMonth월',
                                        style:TextStyle(
                                          fontSize:12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      border: Border(
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(_isLoading1
                                        ? '${summary[0].all_count} 명'
                                        : '',
                                        style:TextStyle(
                                          fontSize:12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      border: Border(
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(_isLoading1
                                          ? '${summary[0].reg_count} 명'
                                          : '',
                                        style:TextStyle(
                                          fontSize:12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      border: Border(
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(_isLoading1
                                          ? '${summary[0].order_count} 건'
                                          : '',
                                        style:TextStyle(
                                          fontSize:12,
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
                            padding: EdgeInsets.symmetric(horizontal: Get.width / 30),
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
                                  SizedBox(width: Get.width / 30,),
                                  Icon(Icons.arrow_right),
                                  Text('전체 정보',
                                    style:TextStyle(
                                      fontSize:14,
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
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(fontSize: 14.0, fontFamily: 'NanumSquareB',),
                                      fillColor: Color(0xFF2A2D3E).withOpacity(0.1),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 35.0,
                                          height: 35.0,
                                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF2697FF),
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Icon(CupertinoIcons.search, color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height:40),

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
                                  flex:1,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                        color:Color(0xFFeeeeee),
                                        border: Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc)
                                        )
                                    ),
                                    child: Center(
                                      child: Text('번호',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('아이디',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('추천인코드',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('포인트',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('견적요청횟수',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('가입일',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('관리',
                                        style:TextStyle(
                                          fontSize:14,
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
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width / 30,
                                right: MediaQuery.of(context).size.width / 30,
                              ),
                              child: ListView.builder(
                                itemCount: detail.length, //detail.length,
                                itemBuilder: (_, int index){
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex:1,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              left: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${index+page_index}',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${detail[index+page_index].cus_id}',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${detail[index].cus_recom}',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${detail[index].point} PT',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${detail[index].order_count} 건',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${detail[index].register_Date}',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 10.0,),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap:(){},
                                                    child: Container(
                                                      height: 25,
                                                      decoration:BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color:Color(0xFF656565)
                                                      ),
                                                      child: Center(child: Text('삭제',
                                                        style:TextStyle(
                                                          fontSize:12,
                                                          color:Colors.white,
                                                        ),
                                                      )),
                                                    ),
                                                  ),
                                                ),

                                                SizedBox(width:10),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap:(){},
                                                    child: Container(
                                                      height:25,
                                                      decoration:BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color:Color(0xFF656565)
                                                      ),
                                                      child: Center(child: Text('수정',
                                                        style:TextStyle(
                                                          fontSize:12,
                                                          color:Colors.white,
                                                        ),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 10.0,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );

                                },
                              ),
                            )
                          ),

                          SizedBox(height: 50.0,)
                        ],
                      )
                    : Column(
                        children: [
                          //Header
                          Container(
                            width:Get.width,
                            height:60,
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 30,
                              right: MediaQuery.of(context).size.width / 30,
                            ),
                            color:Color(0xFF3B4E84),
                            child: Row(
                              children: [
                                InkWell(

                                  onTap:(){},
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.only(top:1,bottom:1),
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                    ),
                                    child: Center(
                                      child: Text('고객 관리',
                                        style: TextStyle(
                                          fontSize:16,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    Get.to(PartnerPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color:Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text('파트너 관리',
                                        style: TextStyle(
                                          fontSize:16,
                                          fontFamily: 'NanumSquareR',
                                          color:Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    Get.to(PointPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color:Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text('채팅 관리',
                                        style: TextStyle(
                                          fontSize:16,
                                          fontFamily: 'NanumSquareR',
                                          color:Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap:(){
                                    Get.to(SettingPage());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10.0),
                                    decoration: BoxDecoration(
                                      color:Color(0xFF3B4E84),
                                    ),
                                    child: Center(
                                      child: Text('통계&설정',
                                        style: TextStyle(
                                          fontSize:16,
                                          fontFamily: 'NanumSquareR',
                                          color:Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height:20),

                          //Page Title
                          Container(
                            width:Get.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: Get.width*0.1,
                              vertical: 35.0,
                            ),
                            child: Text('고객 회원 관리',
                              style:TextStyle(
                                fontFamily: 'NanumSquareEB',
                                fontSize:18,
                              ),
                            ),
                          ),



                          //Summary Header
                          Container(
                              width:Get.width,
                              padding: EdgeInsets.symmetric(horizontal: Get.width*0.1),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.arrow_right),
                                      Text('요약 정보',
                                        style:TextStyle(
                                          fontSize:14,
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
                                          height:40,
                                          decoration: BoxDecoration(
                                              color:Color(0xFFeeeeee),
                                              border: Border.all(
                                                  width:1,
                                                  color:Color(0xFFcccccc)
                                              )
                                          ),
                                          child: Center(
                                            child: Text('기준 일자',
                                              style:TextStyle(
                                                fontSize:14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Color(0xFFeeeeee),
                                            border: Border(
                                              top: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('전체 회원 수',
                                              style:TextStyle(
                                                fontSize:14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Color(0xFFeeeeee),
                                            border: Border(
                                              top: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('$strMonth월 회원가입',
                                              style:TextStyle(
                                                fontSize:14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Color(0xFFeeeeee),
                                            border: Border(
                                              top: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('$strMonth월 작업요청',
                                              style:TextStyle(
                                                fontSize:14,
                                                fontFamily: 'NanumSquareB',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                          ),

                          //Summary Body
                          Container(
                            width:Get.width,
                            padding: EdgeInsets.symmetric(horizontal: Get.width*0.1),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      border: Border(
                                        left: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('$strYear년 $strMonth월',
                                        style:TextStyle(
                                          fontSize:12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      border: Border(
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(_isLoading1
                                          ? '${summary[0].all_count} 명'
                                          : '',
                                        style:TextStyle(
                                          fontSize:12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      border: Border(
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(_isLoading1
                                          ? '${summary[0].reg_count} 명'
                                          : '',
                                        style:TextStyle(
                                          fontSize:12,
                                          fontFamily: 'NanumSquareR',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Colors.white,
                                      border: Border(
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(_isLoading1
                                          ? '${summary[0].order_count} 건'
                                          : '',
                                        style:TextStyle(
                                          fontSize:12,
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
                            width: Get.width*0.8,
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
                                  SizedBox(width: Get.width*0.1,),
                                  Icon(Icons.arrow_right),
                                  Text('전체 정보',
                                    style:TextStyle(
                                      fontSize:14,
                                      fontFamily: 'NanumSquareB',
                                    ),
                                  )
                                ],
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Container(
                                  width: 180,
                                  margin: EdgeInsets.only(right: Get.width*0.1),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      hintStyle: TextStyle(fontSize: 14.0, fontFamily: 'NanumSquareB',),
                                      fillColor: Color(0xFF2A2D3E).withOpacity(0.1),
                                      filled: true,
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      ),
                                      suffixIcon: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          width: 35.0,
                                          height: 35.0,
                                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            color: Color(0xFF2697FF),
                                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                                          ),
                                          child: Icon(CupertinoIcons.search, color: Colors.white,),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height:40),

                          //Table Head
                          Container(
                            width:Get.width,
                            padding: EdgeInsets.symmetric(horizontal: Get.width*0.1),
                            child: Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                        color:Color(0xFFeeeeee),
                                        border: Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc)
                                        )
                                    ),
                                    child: Center(
                                      child: Text('번호',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('아이디',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('추천인코드',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('포인트',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('견적요청횟수',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('가입일',
                                        style:TextStyle(
                                          fontSize:14,
                                          fontFamily: 'NanumSquareB',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex:2,
                                  child: Container(
                                    width: 120,
                                    height:40,
                                    decoration: BoxDecoration(
                                      color:Color(0xFFeeeeee),
                                      border: Border(
                                        top: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        right: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                        bottom: BorderSide( // POINT
                                          color: Color(0xFFcccccc),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text('관리',
                                        style:TextStyle(
                                          fontSize:14,
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
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: Get.width*0.1),
                              child: ListView.builder(
                                itemCount: detail.length,
                                itemBuilder: (_, int index){
                                  return  Row(
                                    children: [
                                      Expanded(
                                        flex:1,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              left: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('$index',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${detail[index].cus_id}',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${detail[index].cus_recom}',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${detail[index].point} PT',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${detail[index].order_count} 건',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Text('${detail[index].register_Date}',
                                              style:TextStyle(
                                                fontSize:12,
                                                fontFamily: 'NanumSquareR',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex:2,
                                        child: Container(
                                          width: 120,
                                          height:40,
                                          decoration: BoxDecoration(
                                            color:Colors.white,
                                            border: Border(
                                              right: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                              bottom: BorderSide( // POINT
                                                color: Color(0xFFcccccc),
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          child: Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 10.0,),
                                                InkWell(
                                                  onTap:(){},
                                                  child: Container(
                                                    height: 25.0,
                                                    width: 77.0,
                                                    decoration:BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5),
                                                        color:Color(0xFF656565)
                                                    ),
                                                    child: Center(child: Text('삭제',
                                                      style:TextStyle(
                                                        fontSize:12,
                                                        color:Colors.white,
                                                      ),
                                                    )),
                                                  ),
                                                ),

                                                SizedBox(width:10),
                                                InkWell(
                                                  onTap:(){},
                                                  child: Container(
                                                    height: 25.0,
                                                    width: 77.0,
                                                    decoration:BoxDecoration(
                                                        borderRadius: BorderRadius.circular(5),
                                                        color:Color(0xFF656565)
                                                    ),
                                                    child: Center(child: Text('수정',
                                                      style:TextStyle(
                                                        fontSize:12,
                                                        color:Colors.white,
                                                      ),
                                                    )),
                                                  ),
                                                ),
                                                SizedBox(width: 10.0,),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              )
                            ),
                          ),

                          SizedBox(height: 50.0,)
                        ],
                      )
                ),
              ],
            ),
          )),
    );
  }
}
