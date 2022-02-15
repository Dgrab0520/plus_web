
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mccounting_text/mccounting_text.dart';

import 'package:plus_web/admin/admini_main_page.dart';
import 'package:plus_web/admin/partner_page.dart';
import 'package:plus_web/admin/point_page.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



List<SalesData> ChartData2 = [
  SalesData("1월",1 ),
  SalesData("2월",2 ),
  SalesData("3월",10),
  SalesData("4월",11),
  SalesData("5월",11),
  SalesData("6월",11),
  SalesData("7월",11),
  SalesData("8월",11),
  SalesData("9월",11),
  SalesData("10월",11),
  SalesData("11월",11),
  SalesData("12월",11),
];

class SalesData{
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

final List<ChartData> chartData = [
  ChartData('David', 25, Color(0xFF3B4E84)),
  ChartData('Steve', 38, Color(0xFF506AB4)),
  ChartData('Jack', 34, Color(0xFF798BBF)),
  ChartData('Others', 52, Color(0xFFB8C1DB))
];

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double y;
  final Color color;
}

late Widget top;
List<String> map = [
  '0회',
  '1회 이상',
  '5회 이상',
  '10회 이상',
];

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
                width: 150,
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
      backgroundColor: Color(0xFfD1D9E5),
      body: SafeArea(
          child: Container(
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
                              Get.to(AdminPage());
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
                    child: MediaQuery.of(context).size.width < 1200  ? Column(
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
                                  Get.to(AdminPage());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color:Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text('고객관리',
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
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(top:1,bottom:1),
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                  ),
                                  child: Center(
                                    child: Text('통계관리',
                                      style: TextStyle(
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
                          width: Get.width,
                          height:500,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex:2,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 30,
                                          right: MediaQuery.of(context).size.width / 70,
                                          top: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          width:400,
                                          height:400,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height:15),
                                              Center(
                                                child: Text('카테고리별 이용자',
                                                  style:TextStyle(
                                                    fontSize:15,
                                                    fontFamily: 'NanumSquareEB',
                                                  ),
                                                ),
                                              ),
                                              SfCircularChart(
                                                  series: <CircularSeries>[
                                                    // Renders doughnut chart
                                                    DoughnutSeries<ChartData, String>(
                                                        dataSource: chartData,
                                                        pointColorMapper:(ChartData data,  _) => data.color,
                                                        xValueMapper: (ChartData data, _) => data.x,
                                                        yValueMapper: (ChartData data, _) => data.y
                                                    )
                                                  ]
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width:10,
                                                        height:10,
                                                        decoration:BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color:Color(0xFF3B4E84),
                                                        ),
                                                      ),
                                                      SizedBox(width:5),
                                                      Container(
                                                        child: Text('이용자',
                                                          style:TextStyle(
                                                            fontSize:11,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width:5),
                                                      Container(
                                                        child: Text('25%',
                                                          style:TextStyle(
                                                            fontSize:11,
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width:10,
                                                        height:10,
                                                        decoration:BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color:Color(0xFF3B4E84),
                                                        ),
                                                      ),
                                                      SizedBox(width:5),
                                                      Container(
                                                        child: Text('이용자',
                                                          style:TextStyle(
                                                            fontSize:11,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width:5),
                                                      Container(
                                                        child: Text('25%',
                                                          style:TextStyle(
                                                            fontSize:11,
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex:2,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 70,
                                          right: MediaQuery.of(context).size.width / 30,
                                          top: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          width:400,
                                          height:400,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height:15),
                                              Center(
                                                child: Text('월별 이용자',
                                                  style:TextStyle(
                                                    fontSize:15,
                                                    fontFamily: 'NanumSquareEB',
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height:30),
                                              SfCartesianChart(
                                                  primaryXAxis: CategoryAxis(),
                                                  primaryYAxis: NumericAxis(),
                                                  series: <ChartSeries<SalesData, String>>[
                                                    // Renders column chart
                                                    ColumnSeries<SalesData, String>(
                                                        color: Color(0xFF506AB4),
                                                        dataSource: ChartData2,
                                                        xValueMapper: (SalesData sales, _) => sales.year,
                                                        yValueMapper: (SalesData sales, _) => sales.sales
                                                    )
                                                  ]
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 30,
                                          right: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:400,
                                          height:180,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height:15),
                                              Text('신규가입자',
                                                style:TextStyle(
                                                    fontSize:13,
                                                    fontFamily: 'NanumSquareB',
                                                    color:Color(0xFF797A7D)
                                                ),
                                              ),
                                              SizedBox(height:20),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text('+',
                                                      style:TextStyle(
                                                        fontSize:21,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: McCountingText(
                                                      begin: 10,
                                                      end: 255,
                                                      style: TextStyle(
                                                        fontSize:21,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                      duration: Duration(seconds: 2),
                                                      curve: Curves.decelerate,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:15),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.arrow_upward_outlined, color:Color(0xFF798BBF),size:14,),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: Text('5.27%',
                                                      style:TextStyle(
                                                        fontSize:15,
                                                        color:Color(0xFF798BBF),
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height:10),
                                                  Container(
                                                    child: Text('전월대비',
                                                      style:TextStyle(
                                                          fontSize:13,
                                                          fontFamily: 'NanumSquareR',
                                                          color:Color(0xFF797A7D)
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 30,
                                          right: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:400,
                                          height:180,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height:15),
                                              Text('신규가입자',
                                                style:TextStyle(
                                                    fontSize:13,
                                                    fontFamily: 'NanumSquareB',
                                                    color:Color(0xFF797A7D)
                                                ),
                                              ),
                                              SizedBox(height:20),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text('+',
                                                      style:TextStyle(
                                                        fontSize:21,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: McCountingText(
                                                      begin: 10,
                                                      end: 255,
                                                      style: TextStyle(
                                                        fontSize:21,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                      duration: Duration(seconds: 2),
                                                      curve: Curves.decelerate,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:15),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.arrow_upward_outlined, color:Color(0xFF798BBF),size:14,),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: Text('5.27%',
                                                      style:TextStyle(
                                                        fontSize:15,
                                                        color:Color(0xFF798BBF),
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height:10),
                                                  Container(
                                                    child: Text('전월대비',
                                                      style:TextStyle(
                                                          fontSize:13,
                                                          fontFamily: 'NanumSquareR',
                                                          color:Color(0xFF797A7D)
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 30,
                                          right: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:400,
                                          height:180,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height:15),
                                              Text('탈퇴자',
                                                style:TextStyle(
                                                    fontSize:13,
                                                    fontFamily: 'NanumSquareB',
                                                    color:Color(0xFF797A7D)
                                                ),
                                              ),
                                              SizedBox(height:20),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text('-',
                                                      style:TextStyle(
                                                        fontSize:21,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: McCountingText(
                                                      begin: 10,
                                                      end: 15,
                                                      style: TextStyle(
                                                        fontSize:21,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                      duration: Duration(seconds: 2),
                                                      curve: Curves.decelerate,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:15),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.arrow_downward_outlined, color:Colors.red,size:14,),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: Text('5.27%',
                                                      style:TextStyle(
                                                        fontSize:15,
                                                        color:Colors.red,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height:10),
                                                  Container(
                                                    child: Text('전월대비',
                                                      style:TextStyle(
                                                          fontSize:13,
                                                          fontFamily: 'NanumSquareR',
                                                          color:Color(0xFF797A7D)
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 30,
                                          right: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:400,
                                          height:180,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              SizedBox(height:15),
                                              Text('재가입자',
                                                style:TextStyle(
                                                    fontSize:13,
                                                    fontFamily: 'NanumSquareB',
                                                    color:Color(0xFF797A7D)
                                                ),
                                              ),
                                              SizedBox(height:20),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text('+',
                                                      style:TextStyle(
                                                        fontSize:21,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: McCountingText(
                                                      begin: 10,
                                                      end: 25,
                                                      style: TextStyle(
                                                        fontSize:21,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                      duration: Duration(seconds: 2),
                                                      curve: Curves.decelerate,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:15),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.arrow_upward_outlined, color:Color(0xFF798BBF),size:14,),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: Text('5.27%',
                                                      style:TextStyle(
                                                        fontSize:15,
                                                        color:Color(0xFF798BBF),
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(height:10),
                                                  Container(
                                                    child: Text('전월대비',
                                                      style:TextStyle(
                                                          fontSize:13,
                                                          fontFamily: 'NanumSquareR',
                                                          color:Color(0xFF797A7D)
                                                      ),
                                                    ),
                                                  ),
                                                ],
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
                        ),
                      ],
                    ) : Column(
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
                                  Get.to(AdminPage());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color:Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text('고객관리',
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
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(top:1,bottom:1),
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                  ),
                                  child: Center(
                                    child: Text('통계관리',
                                      style: TextStyle(
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
                          width: Get.width,
                          height:600,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 30,
                                          right: MediaQuery.of(context).size.width / 70,
                                          top: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(left:30,right:30,top:20),
                                          width:400,
                                          height:400,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height:15),
                                              Text('카테고리별 이용자',
                                                style:TextStyle(
                                                  fontSize:16,
                                                  fontFamily: 'NanumSquareEB',
                                                ),
                                              ),
                                              SfCircularChart(
                                                  series: <CircularSeries>[
                                                    // Renders doughnut chart
                                                    DoughnutSeries<ChartData, String>(
                                                        dataSource: chartData,
                                                        pointColorMapper:(ChartData data,  _) => data.color,
                                                        xValueMapper: (ChartData data, _) => data.x,
                                                        yValueMapper: (ChartData data, _) => data.y
                                                    )
                                                  ]
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width:15,
                                                        height:15,
                                                        decoration:BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color:Color(0xFF3B4E84),
                                                        ),
                                                      ),
                                                      SizedBox(width:5),
                                                      Container(
                                                        child: Text('이용자',
                                                          style:TextStyle(
                                                            fontSize:13,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width:5),
                                                      Container(
                                                        child: Text('25%',
                                                          style:TextStyle(
                                                            fontSize:13,
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width:15,
                                                        height:15,
                                                        decoration:BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color:Color(0xFF3B4E84),
                                                        ),
                                                      ),
                                                      SizedBox(width:5),
                                                      Container(
                                                        child: Text('이용자',
                                                          style:TextStyle(
                                                            fontSize:13,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width:5),
                                                      Container(
                                                        child: Text('25%',
                                                          style:TextStyle(
                                                            fontSize:13,
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Container(
                                                        width:15,
                                                        height:15,
                                                        decoration:BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          color:Color(0xFF3B4E84),
                                                        ),
                                                      ),
                                                      SizedBox(width:5),
                                                      Container(
                                                        child: Text('이용자',
                                                          style:TextStyle(
                                                            fontSize:13,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width:5),
                                                      Container(
                                                        child: Text('25%',
                                                          style:TextStyle(
                                                            fontSize:13,
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex:2,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 70,
                                          right: MediaQuery.of(context).size.width / 30,
                                          top: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(left:30,right:30,top:20),
                                          width:400,
                                          height:400,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height:15),
                                              Text('월별 이용자',
                                                style:TextStyle(
                                                  fontSize:16,
                                                  fontFamily: 'NanumSquareEB',
                                                ),
                                              ),
                                              SizedBox(height:30),
                                              SfCartesianChart(

                                                  primaryXAxis: CategoryAxis(),
                                                  primaryYAxis: NumericAxis(),
                                                  series: <ChartSeries<SalesData, String>>[
                                                    // Renders column chart
                                                    ColumnSeries<SalesData, String>(
                                                        color: Color(0xFF506AB4),
                                                        dataSource: ChartData2,
                                                        xValueMapper: (SalesData sales, _) => sales.year,
                                                        yValueMapper: (SalesData sales, _) => sales.sales
                                                    )
                                                  ]
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 30,
                                          right: MediaQuery.of(context).size.width / 70,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(left:30,right:30,top:20),
                                          width:400,
                                          height:180,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height:15),
                                              Text('신규 가입자',
                                                style:TextStyle(
                                                    fontSize:16,
                                                    fontFamily: 'NanumSquareB',
                                                    color:Color(0xFF797A7D)
                                                ),
                                              ),
                                              SizedBox(height:20),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text('+',
                                                      style:TextStyle(
                                                        fontSize:35,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: McCountingText(
                                                      begin: 10,
                                                      end: 255,
                                                      style: TextStyle(
                                                        fontSize:40,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                      duration: Duration(seconds: 2),
                                                      curve: Curves.decelerate,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:15),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.arrow_upward_outlined, color:Color(0xFF798BBF),size:14,),
                                                      SizedBox(width:3),
                                                      Container(
                                                        child: Text('5.27%',
                                                          style:TextStyle(
                                                            fontSize:15,
                                                            color:Color(0xFF798BBF),
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width:10),
                                                      Container(
                                                        child: Text('전월대비',
                                                          style:TextStyle(
                                                              fontSize:13,
                                                              fontFamily: 'NanumSquareR',
                                                              color:Color(0xFF797A7D)
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 70,
                                          right: MediaQuery.of(context).size.width / 70,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(left:30,right:30,top:20),
                                          width:400,
                                          height:180,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height:15),
                                              Text('신규 가입자',
                                                style:TextStyle(
                                                    fontSize:16,
                                                    fontFamily: 'NanumSquareB',
                                                    color:Color(0xFF797A7D)
                                                ),
                                              ),
                                              SizedBox(height:20),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text('+',
                                                      style:TextStyle(
                                                        fontSize:35,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: McCountingText(
                                                      begin: 10,
                                                      end: 255,
                                                      style: TextStyle(
                                                        fontSize:40,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                      duration: Duration(seconds: 2),
                                                      curve: Curves.decelerate,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:15),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.arrow_upward_outlined, color:Color(0xFF798BBF),size:14,),
                                                      SizedBox(width:3),
                                                      Container(
                                                        child: Text('5.27%',
                                                          style:TextStyle(
                                                            fontSize:15,
                                                            color:Color(0xFF798BBF),
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width:10),
                                                      Container(
                                                        child: Text('전월대비',
                                                          style:TextStyle(
                                                              fontSize:13,
                                                              fontFamily: 'NanumSquareR',
                                                              color:Color(0xFF797A7D)
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          left: MediaQuery.of(context).size.width / 70,
                                          right: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(left:30,right:30,top:20),
                                          width:400,
                                          height:180,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height:15),
                                              Text('탈퇴자',
                                                style:TextStyle(
                                                    fontSize:16,
                                                    fontFamily: 'NanumSquareB',
                                                    color:Color(0xFF797A7D)
                                                ),
                                              ),
                                              SizedBox(height:20),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text('-',
                                                      style:TextStyle(
                                                        fontSize:35,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: McCountingText(
                                                      begin: 10,
                                                      end: 15,
                                                      style: TextStyle(
                                                        fontSize:40,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                      duration: Duration(seconds: 2),
                                                      curve: Curves.decelerate,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:15),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.arrow_downward_outlined, color:Color(0xFFFF6868),size:14,),
                                                      SizedBox(width:3),
                                                      Container(
                                                        child: Text('3%',
                                                          style:TextStyle(
                                                            fontSize:15,
                                                            color:Color(0xFFFF6868),
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width:10),
                                                      Container(
                                                        child: Text('전월대비',
                                                          style:TextStyle(
                                                              fontSize:13,
                                                              fontFamily: 'NanumSquareR',
                                                              color:Color(0xFF797A7D)
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(

                                          right: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(left:30,right:30,top:20),
                                          width:400,
                                          height:180,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height:15),
                                              Text('재 가입자',
                                                style:TextStyle(
                                                    fontSize:16,
                                                    fontFamily: 'NanumSquareB',
                                                    color:Color(0xFF797A7D)
                                                ),
                                              ),
                                              SizedBox(height:15),
                                              Row(
                                                children: [
                                                  Container(
                                                    child: Text('+',
                                                      style:TextStyle(
                                                        fontSize:35,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width:3),
                                                  Container(
                                                    child: McCountingText(
                                                      begin: 10,
                                                      end: 255,
                                                      style: TextStyle(
                                                        fontSize:40,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                      duration: Duration(seconds: 2),
                                                      curve: Curves.decelerate,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height:15),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.arrow_upward_outlined, color:Color(0xFF798BBF),size:14,),
                                                      SizedBox(width:3),
                                                      Container(
                                                        child: Text('5.27%',
                                                          style:TextStyle(
                                                            fontSize:15,
                                                            color:Color(0xFF798BBF),
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width:10),
                                                      Container(
                                                        child: Text('전월대비',
                                                          style:TextStyle(
                                                              fontSize:13,
                                                              fontFamily: 'NanumSquareR',
                                                              color:Color(0xFF797A7D)
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
