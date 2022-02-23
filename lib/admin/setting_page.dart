import 'package:plus_web/admin/data/setting_data.dart';
import 'package:plus_web/admin/model/setting_model.dart';
import 'package:plus_web/admin/partner_page.dart';
import 'package:plus_web/admin/chat_page.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'main_page.dart';


class MemberData{
  MemberData(this.type, this.count);
  final String type;
  final int count;
}


class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}



class _SettingPageState extends State<SettingPage> {

  List<Settings> setting =  [];
  List<Settings2> setting2 =  [];
  List<Settings3> setting3 =  [];
  List<Settings4> setting4 =  [];
  List<Settings5> setting5 =  [];
  List<MemberData> ChartData = [];
  bool _isLoading = false;
  bool _isLoading2 = false;
  bool _isLoading3 = false;
  bool _isLoading4 = false;
  bool _isLoading5 = false;


  getGraph(){
    Setting_Data.getGraph().then((value){
      setState(() {
        setting = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading = false;
        });
      }else{
        setState(() {
          _isLoading = true;
        });
      }
    });
  }


  getReg(){
    Setting_Data.getReg(DateTime.now().toString().split("-")[0]).then((value){
      setState(() {
        setting2 = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading2 = false;
        });
      }else{
        setState(() {
          _isLoading2 = true;


        });
      }
    });
  }

  getPro(){
    Setting_Data.getPro().then((value){
      setState(() {
        setting3 = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading3 = false;
        });
      }else{
        setState(() {
          _isLoading3 = true;

        });
      }
    });
  }

  getMember(){
    Setting_Data.getMember().then((value){
      setState(() {
        setting4 = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading4 = false;
        });
      }else{
        setState(() {
          _isLoading4 = true;
          ChartData.add(MemberData('customer', int.parse(setting4[0].customer)));
          ChartData.add(MemberData('pro', int.parse(setting4[0].pro)));
        });
      }
    });
  }

  getService(){
    Setting_Data.getService().then((value){
      setState(() {
        setting5 = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading5 = false;
        });
      }else{
        setState(() {
          _isLoading5 = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getMember();
    getGraph();
    getReg();
    getPro();
    getService();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: MediaQuery.of(context).size.width > 1300
                        ?
                    Column(
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
                                onTap:(){
                                  Get.to(MainPage());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
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
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(top:1,bottom:1),
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                  ),
                                  child: Center(
                                    child: Text('통계&설정',
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
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [

                                Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        color: Colors.white,
                                        margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 30, right: 10.0,),
                                        padding: EdgeInsets.only(top: 20,),
                                        height: 500,
                                        child: Column(
                                          children: [
                                            Text('서비스별 이용 현황',
                                              style:TextStyle(
                                                fontSize:15,
                                                fontFamily: 'NanumSquareEB',
                                              ),
                                            ),
                                            SizedBox(height: 20.0,),
                                            Container(
                                                height: 440,
                                              child:SingleChildScrollView(
                                                child: DataTable2(
                                                  columnSpacing: 10,
                                                  minWidth: 450,
                                                  columns: [
                                                    DataColumn(
                                                      label: Text("서비스",
                                                        style:TextStyle(
                                                          fontSize:14,
                                                          color: Colors.deepOrange,
                                                          fontFamily: 'NanumSquareB',
                                                        ),
                                                      ),
                                                    ),
                                                    DataColumn(
                                                      label: Center(
                                                        child: Text("신청 횟수(건)",
                                                          style:TextStyle(
                                                            fontSize:14,
                                                            color: Colors.deepOrange,
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      )
                                                    ),
                                                  ],
                                                  rows: List.generate(
                                                    setting.length,
                                                        (index) => DataRow(
                                                      cells: [
                                                        DataCell(Text('${setting[index].sub_category}')),
                                                        DataCell(Center(child: Text('${setting[index].count} 건'),)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ),

                                          ],
                                        )
                                      )
                                    ),
                                    Expanded(
                                      flex:2,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: MediaQuery.of(context).size.width / 30,
                                          top: MediaQuery.of(context).size.width / 30,
                                          bottom: MediaQuery.of(context).size.width / 30,
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.only(left:30,right:30,top:20),
                                          width:400,
                                          height:500,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('월별 이용현황',
                                                style:TextStyle(
                                                  fontSize:16,
                                                  fontFamily: 'NanumSquareEB',
                                                ),
                                              ),
                                              SizedBox(height:30),
                                              SizedBox(
                                                height: 410,
                                                child: SfCartesianChart(
                                                    primaryXAxis: CategoryAxis(),
                                                    primaryYAxis: NumericAxis(),
                                                    series: <ChartSeries<Settings2, String>>[
                                                      // Renders column chart
                                                      ColumnSeries<Settings2, String>(
                                                          color: Color(0xFF506AB4),
                                                          dataSource: setting2,
                                                          xValueMapper: (Settings2 setting2, _) => setting2.month+'월',
                                                          yValueMapper: (Settings2 setting2, _) => int.parse(setting2.count),
                                                      ),
                                                    ]
                                                ),
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
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        width:400,
                                        height:350,
                                        decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height:15),
                                            SfCircularChart(
                                                title: ChartTitle(text: '전체 회원 현황', textStyle: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily: 'NanumSquareEB',
                                                )),
                                                legend: Legend(isVisible: true),
                                                series: <PieSeries<MemberData, String>>[
                                                  PieSeries<MemberData, String>(
                                                      explode: true,
                                                      explodeIndex: 0,
                                                      dataSource: ChartData,
                                                      xValueMapper: (MemberData member, _) => member.type,
                                                      yValueMapper: (MemberData member, _) => member.count,
                                                      dataLabelMapper: (MemberData member, _) => member.type,
                                                      dataLabelSettings: DataLabelSettings(isVisible: true)),
                                                ]
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        width:400,
                                        height:350,
                                        decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height:15),
                                            SfCircularChart(
                                                title: ChartTitle(text: '파트너 현황', textStyle: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily: 'NanumSquareEB',
                                                )),
                                                legend: Legend(isVisible: true),
                                                series: <PieSeries<Settings3, String>>[
                                                  PieSeries<Settings3, String>(
                                                      explode: true,
                                                      explodeIndex: 0,
                                                      dataSource: setting3,
                                                      xValueMapper: (Settings3 setting3, _) => setting3.index == '' ? '일반 파트너' : '제휴 파트너',
                                                      yValueMapper: (Settings3 setting3, _) => int.parse(setting3.count),
                                                      dataLabelMapper: (Settings3 setting3, _) => setting3.index == '' ? '일반 파트너' : '제휴 파트너',
                                                      dataLabelSettings: DataLabelSettings(isVisible: true)),
                                                ]
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        width:400,
                                        height:350,
                                        decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height:15),
                                            SfCartesianChart(
                                                title: ChartTitle(text: '파트너 분야 Top 10', textStyle: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily: 'NanumSquareEB',
                                                )),
                                                primaryXAxis: CategoryAxis(),
                                                primaryYAxis: NumericAxis(),
                                                series: <ChartSeries<Settings5, String>>[
                                                  // Renders column chart
                                                  BarSeries<Settings5, String>(
                                                    // color: Color(0xFF506AB4),
                                                    dataSource: setting5,
                                                    xValueMapper: (Settings5 setting5, _) => setting5.service,
                                                    yValueMapper: (Settings5 setting5, _) => int.parse(setting5.count),
                                                  ),
                                                ]
                                            ),
                                            // SfCircularChart(
                                            //     title: ChartTitle(text: '파트너 분야', textStyle: TextStyle(
                                            //       fontSize: 14.0,
                                            //       fontFamily: 'NanumSquareEB',
                                            //     )),
                                            //     legend: Legend(isVisible: true),
                                            //     series: <PieSeries<Settings5, String>>[
                                            //       PieSeries<Settings5, String>(
                                            //           explode: true,
                                            //           explodeIndex: 0,
                                            //           dataSource: setting5,
                                            //           xValueMapper: (Settings5 setting5, _) => setting5.service,
                                            //           yValueMapper: (Settings5 setting5, _) => int.parse(setting5.count),
                                            //       ),
                                            //     ]
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: 10.0,),
                                    // Expanded(
                                    //   child: Container(
                                    //     padding: EdgeInsets.all(5),
                                    //     width:400,
                                    //     height:350,
                                    //     decoration:BoxDecoration(
                                    //       color:Colors.white,
                                    //       borderRadius: BorderRadius.circular(5),
                                    //     ),
                                    //     child: Column(
                                    //       mainAxisAlignment: MainAxisAlignment.start,
                                    //       crossAxisAlignment: CrossAxisAlignment.center,
                                    //       children: [
                                    //         SizedBox(height:15),
                                    //         SfCircularChart(
                                    //             title: ChartTitle(text: '전체 회원 현황', textStyle: TextStyle(
                                    //               fontSize: 14.0,
                                    //               fontFamily: 'NanumSquareEB',
                                    //             )),
                                    //             legend: Legend(isVisible: true),
                                    //             series: <PieSeries<Settings2, String>>[
                                    //               PieSeries<Settings2, String>(
                                    //                   explode: true,
                                    //                   explodeIndex: 0,
                                    //                   dataSource: setting2,
                                    //                   xValueMapper: (Settings2 setting2, _) => setting2.month,
                                    //                   yValueMapper: (Settings2 setting2, _) => int.parse(setting2.count),
                                    //                   dataLabelMapper: (Settings2 setting2, _) => setting2.month+'월',
                                    //                   dataLabelSettings: DataLabelSettings(isVisible: true)),
                                    //             ]
                                    //         )
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width / 30,),
                                Container(
                                  width:Get.width,
                                  height:80,
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width / 30,
                                    bottom: MediaQuery.of(context).size.width / 100,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_right),
                                      Text('설정 관리',
                                        style:TextStyle(
                                          fontFamily: 'NanumSquareEB',
                                          fontSize:18,
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        width:300,
                                        height:350,
                                        decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            border: Border.all(width: 1.0, color: Color(0xFFe6e6e6))
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('채팅 내역 확인',
                                                  style: TextStyle(
                                                    fontSize: 17.0,
                                                    color: Colors.black,
                                                    fontFamily: 'NanumSquareEB',
                                                  )
                                              ),
                                              SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                              Text('고객과 전문가의 채팅 내역을 조회할 수 있습니다',
                                                style: TextStyle(
                                                  fontSize: 15.0,
                                                  color: Colors.grey,
                                                  fontFamily: 'NanumSquareR',
                                                ),
                                                textAlign: TextAlign.center,
                                              ),

                                            ],
                                          ),
                                        )
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:300,
                                          height:350,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1.0, color: Color(0xFFe6e6e6))
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text('거래 내역 확인',
                                                    style: TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.black,
                                                      fontFamily: 'NanumSquareEB',
                                                    )
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                                Text('고객과 전문가의 거래 내역을 확인할 수 있습니다',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey,
                                                    fontFamily: 'NanumSquareR',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:300,
                                          height:350,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1.0, color: Color(0xFFe6e6e6))
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text('배너 설정',
                                                    style: TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.black,
                                                      fontFamily: 'NanumSquareEB',
                                                    )
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                                Text('배너를 변경할 수 있습니다',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey,
                                                    fontFamily: 'NanumSquareR',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:300,
                                          height:350,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1.0, color: Color(0xFFe6e6e6))
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text('기타 설정',
                                                    style: TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.black,
                                                      fontFamily: 'NanumSquareEB',
                                                    )
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                                Text('기타 설정을 변경할 수 있습니다',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey,
                                                    fontFamily: 'NanumSquareR',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                  ],
                                ),
                                SizedBox(height: 100.0,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                        :
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
                                  Get.to(MainPage());
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
                                child: Container(
                                  padding: EdgeInsets.all(15.0),
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
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.only(top:1,bottom:1),
                                  decoration: BoxDecoration(
                                    color:Colors.white,
                                  ),
                                  child: Center(
                                    child: Text('통계&설정',
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
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.width / 30,),
                                Container(
                                  padding: EdgeInsets.only(left:30,right:30,top:20),
                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 30, right: MediaQuery.of(context).size.width / 30,),
                                  height:500,
                                  decoration:BoxDecoration(
                                    color:Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('월별 이용현황',
                                        style:TextStyle(
                                          fontSize:16,
                                          fontFamily: 'NanumSquareEB',
                                        ),
                                      ),
                                      SizedBox(height:30),
                                      SizedBox(
                                        height: 410,
                                        child: SfCartesianChart(
                                            primaryXAxis: CategoryAxis(),
                                            primaryYAxis: NumericAxis(),
                                            series: <ChartSeries<Settings2, String>>[
                                              // Renders column chart
                                              ColumnSeries<Settings2, String>(
                                                color: Color(0xFF506AB4),
                                                dataSource: setting2,
                                                xValueMapper: (Settings2 setting2, _) => setting2.month+'월',
                                                yValueMapper: (Settings2 setting2, _) => int.parse(setting2.count),
                                              ),
                                            ]
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 30, right: MediaQuery.of(context).size.width / 30,),
                                    padding: EdgeInsets.only(top: 20,),
                                    height: 500,
                                    child: Column(
                                      children: [
                                        Text('서비스별 이용 현황',
                                          style:TextStyle(
                                            fontSize:15,
                                            fontFamily: 'NanumSquareEB',
                                          ),
                                        ),
                                        SizedBox(height: 20.0,),
                                        Container(
                                            height: 440,
                                            child:SingleChildScrollView(
                                              child: DataTable2(
                                                columnSpacing: 10,
                                                minWidth: 450,
                                                columns: [
                                                  DataColumn(
                                                    label: Text("서비스",
                                                      style:TextStyle(
                                                        fontSize:14,
                                                        color: Colors.deepOrange,
                                                        fontFamily: 'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                  DataColumn(
                                                      label: Center(
                                                        child: Text("신청 횟수(건)",
                                                          style:TextStyle(
                                                            fontSize:14,
                                                            color: Colors.deepOrange,
                                                            fontFamily: 'NanumSquareB',
                                                          ),
                                                        ),
                                                      )
                                                  ),
                                                ],
                                                rows: List.generate(
                                                  setting.length,
                                                      (index) => DataRow(
                                                    cells: [
                                                      DataCell(Text('${setting[index].sub_category}')),
                                                      DataCell(Center(child: Text('${setting[index].count} 건'),)),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                        ),

                                      ],
                                    )
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                Row(
                                  children: [
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        width:400,
                                        height:350,
                                        decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height:15),
                                            SfCircularChart(
                                                title: ChartTitle(text: '전체 회원 현황', textStyle: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily: 'NanumSquareEB',
                                                )),
                                                legend: Legend(isVisible: true),
                                                series: <PieSeries<Settings2, String>>[
                                                  PieSeries<Settings2, String>(
                                                      explode: true,
                                                      explodeIndex: 0,
                                                      dataSource: setting2,
                                                      xValueMapper: (Settings2 setting2, _) => setting2.month,
                                                      yValueMapper: (Settings2 setting2, _) => int.parse(setting2.count),
                                                      dataLabelMapper: (Settings2 setting2, _) => setting2.month+'월',
                                                      dataLabelSettings: DataLabelSettings(isVisible: true)),
                                                ]
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        width:400,
                                        height:350,
                                        decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height:15),
                                            SfCircularChart(
                                                title: ChartTitle(text: '파트너 현황', textStyle: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily: 'NanumSquareEB',
                                                )),
                                                legend: Legend(isVisible: true),
                                                series: <PieSeries<Settings3, String>>[
                                                  PieSeries<Settings3, String>(
                                                      explode: true,
                                                      explodeIndex: 0,
                                                      dataSource: setting3,
                                                      xValueMapper: (Settings3 setting3, _) => setting3.index == '' ? '일반 파트너' : '제휴 파트너',
                                                      yValueMapper: (Settings3 setting3, _) => int.parse(setting3.count),
                                                      dataLabelMapper: (Settings3 setting3, _) => setting3.index == '' ? '일반 파트너' : '제휴 파트너',
                                                      dataLabelSettings: DataLabelSettings(isVisible: true)),
                                                ]
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                Row(
                                  children: [
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        width:400,
                                        height:350,
                                        decoration:BoxDecoration(
                                          color:Colors.white,
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            SizedBox(height:15),
                                            SfCartesianChart(
                                                title: ChartTitle(text: '파트너 분야 Top 10', textStyle: TextStyle(
                                                  fontSize: 14.0,
                                                  fontFamily: 'NanumSquareEB',
                                                )),
                                                primaryXAxis: CategoryAxis(),
                                                primaryYAxis: NumericAxis(),
                                                series: <ChartSeries<Settings5, String>>[
                                                  // Renders column chart
                                                  BarSeries<Settings5, String>(
                                                    // color: Color(0xFF506AB4),
                                                    dataSource: setting5,
                                                    xValueMapper: (Settings5 setting5, _) => setting5.service,
                                                    yValueMapper: (Settings5 setting5, _) => int.parse(setting5.count),
                                                  ),
                                                ]
                                            ),
                                            // SfCircularChart(
                                            //     title: ChartTitle(text: '파트너 분야', textStyle: TextStyle(
                                            //       fontSize: 14.0,
                                            //       fontFamily: 'NanumSquareEB',
                                            //     )),
                                            //     legend: Legend(isVisible: true),
                                            //     series: <PieSeries<Settings2, String>>[
                                            //       PieSeries<Settings2, String>(
                                            //           explode: true,
                                            //           explodeIndex: 0,
                                            //           dataSource: setting2,
                                            //           xValueMapper: (Settings2 setting2, _) => setting2.month,
                                            //           yValueMapper: (Settings2 setting2, _) => int.parse(setting2.count),
                                            //           dataLabelMapper: (Settings2 setting2, _) => setting2.month+'월 : ${setting2.count}',
                                            //           dataLabelSettings: DataLabelSettings(isVisible: true)),
                                            //     ]
                                            // )
                                          ],
                                        ),
                                      ),
                                    ),
                                    // SizedBox(width: 10.0,),
                                    // Expanded(
                                    //   child: Container(
                                    //     padding: EdgeInsets.all(5),
                                    //     width:400,
                                    //     height:350,
                                    //     decoration:BoxDecoration(
                                    //       color:Colors.white,
                                    //       borderRadius: BorderRadius.circular(5),
                                    //     ),
                                    //     child: Column(
                                    //       mainAxisAlignment: MainAxisAlignment.start,
                                    //       crossAxisAlignment: CrossAxisAlignment.center,
                                    //       children: [
                                    //         SizedBox(height:15),
                                    //         SfCircularChart(
                                    //             title: ChartTitle(text: '전체 회원 현황', textStyle: TextStyle(
                                    //               fontSize: 14.0,
                                    //               fontFamily: 'NanumSquareEB',
                                    //             )),
                                    //             legend: Legend(isVisible: true),
                                    //             series: <PieSeries<Settings2, String>>[
                                    //               PieSeries<Settings2, String>(
                                    //                   explode: true,
                                    //                   explodeIndex: 0,
                                    //                   dataSource: setting2,
                                    //                   xValueMapper: (Settings2 setting2, _) => setting2.month,
                                    //                   yValueMapper: (Settings2 setting2, _) => int.parse(setting2.count),
                                    //                   dataLabelMapper: (Settings2 setting2, _) => setting2.month+'월',
                                    //                   dataLabelSettings: DataLabelSettings(isVisible: true)),
                                    //             ]
                                    //         )
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                  ],
                                ),

                                SizedBox(height: MediaQuery.of(context).size.width / 30,),
                                Container(
                                    width:Get.width,
                                    height:80,
                                    padding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width / 30,
                                      bottom: MediaQuery.of(context).size.width / 100,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.arrow_right),
                                        Text('설정 관리',
                                          style:TextStyle(
                                            fontFamily: 'NanumSquareEB',
                                            fontSize:18,
                                          ),
                                        ),
                                      ],
                                    )
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:300,
                                          height:350,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1.0, color: Color(0xFFe6e6e6))
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text('채팅 내역 확인',
                                                    style: TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.black,
                                                      fontFamily: 'NanumSquareEB',
                                                    )
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                                Text('고객과 전문가의 채팅 내역을 조회할 수 있습니다',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey,
                                                    fontFamily: 'NanumSquareR',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:300,
                                          height:350,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1.0, color: Color(0xFFe6e6e6))
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text('거래 내역 확인',
                                                    style: TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.black,
                                                      fontFamily: 'NanumSquareEB',
                                                    )
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                                Text('고객과 전문가의 거래 내역을 확인할 수 있습니다',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey,
                                                    fontFamily: 'NanumSquareR',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                Row(
                                  children: [
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:300,
                                          height:350,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1.0, color: Color(0xFFe6e6e6))
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text('배너 설정',
                                                    style: TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.black,
                                                      fontFamily: 'NanumSquareEB',
                                                    )
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                                Text('배너를 변경할 수 있습니다',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey,
                                                    fontFamily: 'NanumSquareR',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Expanded(
                                      child: Container(
                                          padding: EdgeInsets.all(5),
                                          width:300,
                                          height:350,
                                          decoration:BoxDecoration(
                                            color:Colors.white,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(width: 1.0, color: Color(0xFFe6e6e6))
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text('기타 설정',
                                                    style: TextStyle(
                                                      fontSize: 17.0,
                                                      color: Colors.black,
                                                      fontFamily: 'NanumSquareEB',
                                                    )
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.width / 70,),
                                                Text('기타 설정을 변경할 수 있습니다',
                                                  style: TextStyle(
                                                    fontSize: 15.0,
                                                    color: Colors.grey,
                                                    fontFamily: 'NanumSquareR',
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                              ],
                                            ),
                                          )
                                      ),
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width / 30,),
                                  ],
                                ),
                                SizedBox(height: MediaQuery.of(context).size.width / 30,),
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

