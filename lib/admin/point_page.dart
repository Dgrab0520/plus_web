
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plus_web/admin/partner_page.dart';
import 'package:plus_web/admin/setting_page.dart';
import 'package:radio_group_v2/radio_group_v2.dart';

import 'admini_main_page.dart';


late Widget top;
List<String> map = [
  '전체',
  '충전',
  '출금',
];


class PointPage extends StatefulWidget {
  const PointPage({Key? key}) : super(key: key);

  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {

  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2, // Refer step 1
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate2)
      setState(() {
        selectedDate2 = picked;
      });
  }

  RadioGroupController myController = RadioGroupController();
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) { //top right
    if (MediaQuery.of(context).size.width < 920) {
      top = Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment : Alignment.center,
                margin: EdgeInsets.only(left: 15, right: 15),
                width: 350,
                height: 43,
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xFFcccccc),
                  ),

                  borderRadius: BorderRadius.circular(5),
                ),

                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (text) {},
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: 8,  // HERE THE IMPORTANT PART
                      ),
                      icon: Padding(
                          padding: EdgeInsets.only(left: 13),
                          child: Icon(Icons.search))),
                ),
              ),
            ],
          ),

        ],
      );
    } else {
      top = Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment : Alignment.center,
                margin: EdgeInsets.only(left: 15, right: 15),
                width: 350,
                height: 43,
                decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xFFcccccc),
                  ),

                  borderRadius: BorderRadius.circular(5),
                ),

                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (text) {},
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        bottom: 8,  // HERE THE IMPORTANT PART
                      ),
                      icon: Padding(
                          padding: EdgeInsets.only(left: 13),
                          child: Icon(Icons.search))),
                ),
              ),
            ],
          ),

        ],
      );
    }

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
                              Get.to(AdminMainPage());
                            },
                            child: Text(
                              '관리자 페이지',
                              style: TextStyle(
                                color:Colors.white,
                                fontSize: 20,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
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
                    child: MediaQuery.of(context).size.width < 1500  ? Column(
                      children: [
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
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(top:1,bottom:1),
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                  ),
                                  child: Center(
                                    child: Text('고객관리',
                                      style: TextStyle(
                                        fontSize:16,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap:(){},
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
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
                                onTap:(){},
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color:Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text('포인트 관리',
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
                                  padding: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color:Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text('통계관리',
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
                        Container(
                          width:Get.width,
                          height:80,
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
                        Container(
                          width:Get.width,
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30,
                            right: MediaQuery.of(context).size.width / 30,
                          ),
                          child: Row(
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
                                    child: Text('기간',
                                      style:TextStyle(
                                        fontSize:16,
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
                                        fontSize:16,
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
                                    child: Text('회원가입',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('회원탈퇴',
                                      style:TextStyle(
                                        fontSize:16,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width:Get.width,
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30,
                            right: MediaQuery.of(context).size.width / 30,
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
                                    child: Text('2021년 7월',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('40,789명',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('120명',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('13명',
                                      style:TextStyle(
                                        fontSize:15,
                                        fontFamily: 'NanumSquareR',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:50),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30,
                            right: MediaQuery.of(context).size.width / 30,
                          ),
                          child: Container(
                            width:Get.width,
                            height:70,
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color:Color(0xFFD8DCE6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:80,
                                      height:40,
                                      decoration: BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc),
                                          )
                                      ),
                                      child: Center(
                                        child: Text('통합검색',
                                          style:TextStyle(
                                            fontSize:13,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment : Alignment.center,
                                      margin: EdgeInsets.only(left: 5, right: 15),
                                      width: 150,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFffffff),
                                        border: Border.all(
                                          width: 1.0,
                                          color: Color(0xFFcccccc),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        onChanged: (text) { },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                            bottom: 8,
                                            left:5,// HERE THE IMPORTANT PART
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:10),
                                    Container(
                                      width:80,
                                      height:40,
                                      decoration: BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc),
                                          )
                                      ),
                                      child: Center(
                                        child: Text('이용횟수',
                                          style:TextStyle(
                                            fontSize:13,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:5),
                                    Container(
                                      width: 120,
                                      height: 40,
                                      decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border:Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc),
                                          )
                                      ),
                                      child: Form(
                                        key: _formKey,
                                        child: DropdownButtonFormField2(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: InputBorder.none,
                                            //Add more decoration as you want here
                                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                          ),
                                          isExpanded: true,
                                          hint: Row(
                                            children: [
                                              Text(
                                                '전체',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color:Colors.black,
                                                  fontFamily: 'NanumSquareR',
                                                ),
                                              ),
                                            ],
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFFcccccc),
                                          ),
                                          iconSize: 30,
                                          buttonHeight: 45,
                                          buttonPadding: const EdgeInsets.only(left: 20, right: 10,bottom:10),
                                          dropdownDecoration: BoxDecoration(
                                            color:Colors.white,
                                          ),
                                          items: map
                                              .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return '지역을 골라주세요.';
                                            }
                                          },
                                          onChanged: (value) {
                                            if (value == "글쓰기") {

                                            } else if (value == "구독정보") {

                                            }
                                            //Do something when changing the item if you want.
                                          },
                                          onSaved: (value) {
                                            selectedValue = value.toString();
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:25),
                                    Container(
                                      width:80,
                                      height:40,
                                      decoration: BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc),
                                          )
                                      ),
                                      child: Center(
                                        child: Text('회원상태',
                                          style:TextStyle(
                                            fontSize:13,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width:5),

                                    RadioGroup(
                                      controller: myController,
                                      values: ["전체", "남자", "여자"],
                                      indexOfDefault: 0,
                                      orientation: RadioGroupOrientation.Horizontal,
                                      decoration: RadioGroupDecoration(
                                        spacing: 5.0,
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        activeColor: Color(0xFF3B4E84),
                                      ),
                                    ),
                                    SizedBox(width:15),

                                    Container(
                                      width:60,
                                      height:40,
                                      decoration: BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc),
                                          )
                                      ),
                                      child: Center(
                                        child: Text('가입일',
                                          style:TextStyle(
                                            fontSize:13,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () => _selectDate(context),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Icon(Icons.calendar_today, color:Color(0xFF025595), size:17,),
                                                    ),
                                                    SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    Text(
                                                      "${selectedDate.toLocal()}".split(' ')[0],
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              SizedBox(width: 20.0,),

                                              Text('~'),

                                              SizedBox(width: 20.0,),

                                              InkWell(
                                                onTap: () => _selectDate2(context),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Icon(Icons.calendar_today, color:Color(0xFF025595), size:17,),
                                                    ),
                                                    SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    Text(
                                                      "${selectedDate2.toLocal()}".split(' ')[0],
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        width:60,
                                        height:40,
                                        decoration:BoxDecoration(
                                          color:Color(0xFF506AB4),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text('검색',
                                              style:TextStyle(
                                                color:Colors.white,
                                                fontFamily: 'NanumSquareR',
                                                fontSize:14,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:10),
                                    InkWell(
                                      onTap:(){

                                      },
                                      child: Container(
                                        width:100,
                                        height:40,
                                        decoration:BoxDecoration(
                                          color:Color(0xFF506AB4),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text('검색 초기화',
                                              style:TextStyle(
                                                color:Colors.white,
                                                fontFamily: 'NanumSquareR',
                                                fontSize:14,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height:40),
                        Container(
                          width:Get.width,
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
                                        fontSize:16,
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
                                    child: Text('이름',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('휴대폰번호',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('예약횟수',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('성별',
                                      style:TextStyle(
                                        fontSize:16,
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
                                        fontSize:16,
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
                                        fontSize:16,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width:Get.width,
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
                                    child: Text('10',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('김성수',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('010-5555-4444',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('22',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('여자',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('2022-01-01',
                                      style:TextStyle(
                                        fontSize:15,
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
                                        InkWell(
                                          onTap:(){},
                                          child: Container(
                                            width:70,
                                            height:30,
                                            decoration:BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color:Color(0xFF656565)
                                            ),
                                            child: Center(child: Text('수정',
                                              style:TextStyle(
                                                fontSize:14,
                                                color:Colors.white,
                                              ),
                                            )),
                                          ),
                                        ),
                                        SizedBox(width:10),
                                        InkWell(
                                          onTap:(){},
                                          child: Container(
                                            width:70,
                                            height:30,
                                            decoration:BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color:Color(0xFF656565)
                                            ),
                                            child: Center(child: Text('삭제',
                                              style: TextStyle(
                                                fontSize:14,
                                                color:Colors.white,
                                              ),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ) :
                    Column(
                      children: [
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
                                onTap:(){
                                  Get.to(AdminMainPage());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color:Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text('고객 관리',
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
                                  Get.to(PartnerPage());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
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
                                child:Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(top:1,bottom:1),
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                  ),
                                  child: Center(
                                    child: Text('포인트 관리',
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
                                  Get.to(SettingPage());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color:Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text('통계관리',
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
                        Container(
                          width:Get.width,
                          height:80,
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30,
                            right: MediaQuery.of(context).size.width / 30,
                            top: MediaQuery.of(context).size.width / 70,
                            bottom: MediaQuery.of(context).size.width / 70,
                          ),
                          child: Text('포인트 관리',
                            style:TextStyle(
                              fontFamily: 'NanumSquareEB',
                              fontSize:18,
                            ),
                          ),
                        ),
                        Container(
                          width:Get.width,
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30,
                            right: MediaQuery.of(context).size.width / 30,
                          ),
                          child: Row(
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
                                    child: Text('기간',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('전체 파트너 수',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('회원가입',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('회원탈퇴',
                                      style:TextStyle(
                                        fontSize:16,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width:Get.width,
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30,
                            right: MediaQuery.of(context).size.width / 30,
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
                                    child: Text('2021년 7월',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('40,789명',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('120명',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('13명',
                                      style:TextStyle(
                                        fontSize:15,
                                        fontFamily: 'NanumSquareR',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height:50),
                        Padding(
                          padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 30,
                            right: MediaQuery.of(context).size.width / 30,
                          ),
                          child: Container(
                            width:Get.width,
                            height:70,
                            padding: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color:Color(0xFFD8DCE6),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:80,
                                      height:40,
                                      decoration: BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc),
                                          )
                                      ),
                                      child: Center(
                                        child: Text('통합검색',
                                          style:TextStyle(
                                            fontSize:13,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment : Alignment.center,
                                      margin: EdgeInsets.only(left: 5, right: 15),
                                      width: 150,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFffffff),
                                        border: Border.all(
                                          width: 1.0,
                                          color: Color(0xFFcccccc),
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextField(
                                        keyboardType: TextInputType.text,
                                        onChanged: (text) { },
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                            bottom: 8,
                                            left:5,// HERE THE IMPORTANT PART
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:10),
                                    Container(
                                      width:80,
                                      height:40,
                                      decoration: BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc),
                                          )
                                      ),
                                      child: Center(
                                        child: Text('포인트 조회',
                                          style:TextStyle(
                                            fontSize:13,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:5),
                                    Container(
                                      width: 120,
                                      height: 40,
                                      decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border:Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc),
                                          )
                                      ),
                                      child: Form(
                                        key: _formKey,
                                        child: DropdownButtonFormField2(
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.zero,
                                            border: InputBorder.none,
                                            //Add more decoration as you want here
                                            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                          ),
                                          isExpanded: true,
                                          hint: Row(
                                            children: [
                                              Text(
                                                '전체',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color:Colors.black,
                                                  fontFamily: 'NanumSquareR',
                                                ),
                                              ),
                                            ],
                                          ),
                                          icon: const Icon(
                                            Icons.arrow_drop_down,
                                            color: Color(0xFFcccccc),
                                          ),
                                          iconSize: 30,
                                          buttonHeight: 45,
                                          buttonPadding: const EdgeInsets.only(left: 20, right: 10,bottom:10),
                                          dropdownDecoration: BoxDecoration(
                                            color:Colors.white,
                                          ),
                                          items: map
                                              .map((item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                          ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return '지역을 골라주세요.';
                                            }
                                          },
                                          onChanged: (value) {
                                            if (value == "글쓰기") {

                                            } else if (value == "구독정보") {

                                            }
                                            //Do something when changing the item if you want.
                                          },
                                          onSaved: (value) {
                                            selectedValue = value.toString();
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:25),


                                    Container(
                                      width:60,
                                      height:40,
                                      decoration: BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                          border: Border.all(
                                            width:1,
                                            color:Color(0xFFcccccc),
                                          )
                                      ),
                                      child: Center(
                                        child: Text('가입일',
                                          style:TextStyle(
                                            fontSize:13,
                                            fontFamily: 'NanumSquareB',
                                          ),
                                        ),
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () => _selectDate(context),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Icon(Icons.calendar_today, color:Color(0xFF025595), size:17,),
                                                    ),
                                                    SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    Text(
                                                      "${selectedDate.toLocal()}".split(' ')[0],
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                              SizedBox(width: 20.0,),

                                              Text('~'),

                                              SizedBox(width: 20.0,),

                                              InkWell(
                                                onTap: () => _selectDate2(context),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Container(
                                                      child: Icon(Icons.calendar_today, color:Color(0xFF025595), size:17,),
                                                    ),
                                                    SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    Text(
                                                      "${selectedDate2.toLocal()}".split(' ')[0],
                                                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap:(){},
                                      child: Container(
                                        width:60,
                                        height:40,
                                        decoration:BoxDecoration(
                                          color:Color(0xFF506AB4),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text('검색',
                                              style:TextStyle(
                                                color:Colors.white,
                                                fontFamily: 'NanumSquareR',
                                                fontSize:14,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:10),
                                    InkWell(
                                      onTap:(){

                                      },
                                      child: Container(
                                        width:100,
                                        height:40,
                                        decoration:BoxDecoration(
                                          color:Color(0xFF506AB4),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Center(
                                          child: Text('검색 초기화',
                                              style:TextStyle(
                                                color:Colors.white,
                                                fontFamily: 'NanumSquareR',
                                                fontSize:14,
                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height:40),
                        Container(
                          width:Get.width,
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
                                        fontSize:16,
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
                                    child: Text('이름',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('휴대폰번호',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('충전/출금',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('충전/출금 날짜',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('충전/출금 금액',
                                      style:TextStyle(
                                        fontSize:16,
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
                                    child: Text('잔여포인트',
                                      style:TextStyle(
                                        fontSize:16,
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
                                        fontSize:16,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width:Get.width,
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
                                    child: Text('10',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('김성수',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('010-5555-4444',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('충전',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('2021-07-08',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('20,000원',
                                      style:TextStyle(
                                        fontSize:15,
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
                                    child: Text('30,000P',
                                      style:TextStyle(
                                        fontSize:15,
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
                                        InkWell(
                                          onTap:(){},
                                          child: Container(
                                            width:70,
                                            height:30,
                                            decoration:BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color:Color(0xFF656565)
                                            ),
                                            child: Center(child: Text('수정',
                                              style:TextStyle(
                                                fontSize:14,
                                                color:Colors.white,
                                              ),
                                            )),
                                          ),
                                        ),
                                        SizedBox(width:10),
                                        InkWell(
                                          onTap:(){},
                                          child: Container(
                                            width:70,
                                            height:30,
                                            decoration:BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                color:Color(0xFF656565)
                                            ),
                                            child: Center(child: Text('삭제',
                                              style: TextStyle(
                                                fontSize:14,
                                                color:Colors.white,
                                              ),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          )),
    );
  }
}