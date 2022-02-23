import 'package:plus_web/admin/data/chat_data.dart';
import 'package:plus_web/admin/model/chat_model.dart';
import 'package:plus_web/admin/partner_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:plus_web/admin/data/chat_data.dart';
import 'package:plus_web/admin/setting_page.dart';

import 'main_page.dart';



class PointPage extends StatefulWidget {
  const PointPage({Key? key}) : super(key: key);

  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {

 List<Chat_All> all = [];
 List<Chat_All> select = [];
 List<Chat_Summary> summary = [];
 bool _isLoading = false;
 bool _isLoading2= false;
 bool _isLoading3 = false;
 String strMonth = '';
 String strYear = '';

 String getToday() {
   DateTime now = DateTime.now();
   DateFormat formatter = DateFormat('yyyy-MM-dd / EE');

   strMonth = formatter.format(now).split("-")[1];
   strYear = formatter.format(now).split("-")[0];
   print('This Month : $strMonth');
   return strMonth;
 }

 getChat(){
   Chat_Data.getChat().then((value){
     setState(() {
       all = value;
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

 selectChat(estimate_id){
   Chat_Data.selectChat(estimate_id).then((value){
     setState(() {
       select = value;
     });
     if(value.length == 0){
       setState(() {
         _isLoading2 = false;
       });
     }else{
       setState(() {
         _isLoading2 = true;
         Get.defaultDialog(
             title: '채팅',
             titleStyle: TextStyle(fontSize: 14.0, fontFamily: 'NanumSquareB',),
             radius: 5.0,
             content: Container(
               padding: EdgeInsets.symmetric(vertical: 15.0),
               width: Get.width,
               height: Get.height*0.8,
               child: ListView.builder(
                 itemCount: select.length,
                 itemBuilder: (_, int index){
                   return Row(
                     children: [
                       SizedBox(width: Get.width / 30),
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
                               top: BorderSide( // POINT
                                 color: Color(0xFFcccccc),
                                 width: 1.0,
                               ),
                             ),
                           ),
                           child: Center(
                             child: Text('${index+1}',
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
                               top: BorderSide( // POINT
                                 color: Color(0xFFcccccc),
                                 width: 1.0,
                               ),
                             ),
                           ),
                           child: Center(
                             child: Text(select[index].isPro == '1' ? '${select[index].pro_id}' : '${select[index].customer_id}',
                               style:TextStyle(
                                 fontSize:11,
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
                               top: BorderSide( // POINT
                                 color: Color(0xFFcccccc),
                                 width: 1.0,
                               ),
                             ),
                           ),
                           child: Center(
                             child: Text(select[index].isPro == '1' ? '${select[index].customer_id}' : '${select[index].pro_id}',
                               style:TextStyle(
                                 fontSize:12,
                                 fontFamily: 'NanumSquareR',
                               ),
                             ),
                           ),
                         ),
                       ),
                       Expanded(
                         flex:5,
                         child: Container(
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
                               top: BorderSide( // POINT
                                 color: Color(0xFFcccccc),
                                 width: 1.0,
                               ),
                             ),
                           ),
                           child: Center(
                             child: Text(select[index].chatType == 'text' ? '${select[index].text}' : select[index].chatType == 'image' ? '이미지' : '견적서',
                               style:TextStyle(
                                 fontSize:11,
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
                               top: BorderSide( // POINT
                                 color: Color(0xFFcccccc),
                                 width: 1.0,
                               ),
                             ),
                           ),
                           child: Center(
                             child: Text(select[index].chatType == 'estimate' ? '${select[index].estimatePrice} 원' : select[index].chatType == 'final' ? '${select[index].finalPrice} 원' : '-',
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
                               top: BorderSide( // POINT
                                 color: Color(0xFFcccccc),
                                 width: 1.0,
                               ),
                             ),
                           ),
                           child: Center(
                             child: Text('${select[index].createAt}',
                               style:TextStyle(
                                 fontSize:11,
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
             )
         );
       });
     }
   });
 }

 getSummary(){
   Chat_Data.summaryChat().then((value){
     setState(() {
       print('value : $value');
       summary = value;
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
                _isLoading ?
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
                                onTap:(){Get.to(MainPage());},
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(top:1,bottom:1),
                                  decoration: BoxDecoration(
                                    color:Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text('고객 관리',
                                      style: TextStyle(
                                        fontSize:16,
                                        fontFamily: 'NanumSquareR',
                                        color: Colors.white,
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
                                    color: Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text('파트너 관리',
                                      style: TextStyle(
                                        fontSize:16,
                                        fontFamily: 'NanumSquareR',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap:(){

                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text('채팅 관리',
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
                          child: Text('채팅 관리',
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
                                          child: Text('기간',
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
                                          child: Text('전체 견적 요청 수',
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
                                          child: Text('보낸 견적 수',
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
                                          child: Text('보낸 최종 견적 수',
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
                                    child: Text('$strYear 년 $strMonth 월',
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
                                    child: Text('${summary[0].order_count} 건',
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
                                    child: Text('${summary[0].estimate_count} 건',
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
                                    child: Text('${summary[0].fin_count} 건',
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
                                    child: Text('발신인',
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
                                    child: Text('수신인',
                                      style:TextStyle(
                                        fontSize:14,
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
                                flex:5,
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
                                    child: Text('채팅',
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
                                    child: Text('견적가격',
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
                                    child: Text('수신일자',
                                      style:TextStyle(
                                        fontSize:14,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:1,
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
                                    child: Text('비고',
                                      style:TextStyle(
                                        fontSize:14,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:1,
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
                                    child: Text('자세히보기',
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

                        //Teabe Body
                        Expanded(
                            child: ListView.builder(
                              itemCount: all.length,
                              itemBuilder: (_, int index){
                                return Row(
                                  children: [
                                    SizedBox(width: Get.width / 30),
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
                                          child: Text('${index+1}',
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
                                          child: Text(all[index].isPro == '1' ? '${all[index].pro_id}' : '${all[index].customer_id}',
                                            style:TextStyle(
                                              fontSize:11,
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
                                          child: Text(all[index].isPro == '1' ? '${all[index].customer_id}' : '${all[index].pro_id}',
                                            style:TextStyle(
                                              fontSize:12,
                                              fontFamily: 'NanumSquareR',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex:5,
                                      child: Container(
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
                                          child: Text(all[index].chatType == 'text' ? '${all[index].text}' : all[index].chatType == 'image' ? '이미지' : '견적서',
                                            style:TextStyle(
                                              fontSize:11,
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
                                          child: Text(all[index].chatType == 'estimate' ? '${all[index].estimatePrice} 원' : all[index].chatType == 'final' ? '${all[index].finalPrice} 원' : '-',
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
                                          child: Text('${all[index].createAt}',
                                            style:TextStyle(
                                              fontSize:11,
                                              fontFamily: 'NanumSquareR',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex:1,
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
                                          child: Text(all[index].chatType == 'final' ? '최종 견적' : '-',
                                            style:TextStyle(
                                              fontSize:12,
                                              fontFamily: 'NanumSquareR',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex:1,
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
                                        child: Expanded(
                                          child: InkWell(
                                            onTap:(){
                                              selectChat('${all[index].estimateId}');
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                                              decoration:BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color:Color(0xFF656565)
                                              ),
                                              child: Center(child: Text('자세히',
                                                style:TextStyle(
                                                  fontSize:12,
                                                  color:Colors.white,
                                                ),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: Get.width / 30),
                                  ],
                                );
                              },
                            )
                        ),

                        SizedBox(height: 10.0,)

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
                                onTap:(){Get.to(MainPage());},
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(top:1,bottom:1),
                                  decoration: BoxDecoration(
                                    color:Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text('고객 관리',
                                      style: TextStyle(
                                        fontSize:16,
                                        fontFamily: 'NanumSquareR',
                                        color: Colors.white,
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
                                    color: Color(0xFF3B4E84),
                                  ),
                                  child: Center(
                                    child: Text('파트너 관리',
                                      style: TextStyle(
                                        fontSize:16,
                                        fontFamily: 'NanumSquareR',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap:(){

                                },
                                child: Container(
                                  padding: EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Text('채팅 관리',
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
                          child: Text('채팅 관리',
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
                                          child: Text('기간',
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
                                          child: Text('전체 견적 요청 수',
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
                                          child: Text('보낸 견적 수',
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
                                          child: Text('보낸 최종 견적 수',
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
                        _isLoading3 ?
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
                                    child: Text('$strYear 년 $strMonth 월',
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
                                    child: Text('${summary[0].order_count} 건',
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
                                    child: Text('${summary[0].estimate_count} 건',
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
                                    child: Text('${summary[0].fin_count} 건',
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
                        ) : Container(),

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
                          width: Get.width,
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
                                    child: Text('발신인',
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
                                    child: Text('수신인',
                                      style:TextStyle(
                                        fontSize:14,
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
                                flex:5,
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
                                    child: Text('채팅',
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
                                    child: Text('견적가격',
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
                                    child: Text('수신일자',
                                      style:TextStyle(
                                        fontSize:14,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:1,
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
                                    child: Text('비고',
                                      style:TextStyle(
                                        fontSize:14,
                                        fontFamily: 'NanumSquareB',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex:1,
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
                                    child: Text('자세히보기',
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

                        //Teabe Body
                        Expanded(
                            child: ListView.builder(
                              itemCount: all.length,
                              itemBuilder: (_, int index){
                                return Row(
                                  children: [
                                    SizedBox(width: Get.width*0.1,),
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
                                          child: Text('${index+1}',
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
                                          child: Text(all[index].isPro == '1' ? '${all[index].pro_id}' : '${all[index].customer_id}',
                                            style:TextStyle(
                                              fontSize:11,
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
                                          child: Text(all[index].isPro == '1' ? '${all[index].customer_id}' : '${all[index].pro_id}',
                                            style:TextStyle(
                                              fontSize:12,
                                              fontFamily: 'NanumSquareR',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex:5,
                                      child: Container(
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
                                          child: Text(all[index].chatType == 'text' ? '${all[index].text}' : all[index].chatType == 'image' ? '이미지' : '견적서',
                                            style:TextStyle(
                                              fontSize:11,
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
                                          child: Text(all[index].chatType == 'estimate' ? '${all[index].estimatePrice} 원' : all[index].chatType == 'final' ? '${all[index].finalPrice} 원' : '-',
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
                                          child: Text('${all[index].createAt}',
                                            style:TextStyle(
                                              fontSize:11,
                                              fontFamily: 'NanumSquareR',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex:1,
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
                                          child: Text(all[index].chatType == 'final' ? '최종 견적' : '-',
                                            style:TextStyle(
                                              fontSize:12,
                                              fontFamily: 'NanumSquareR',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex:1,
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
                                        child: Expanded(
                                          child: InkWell(
                                            onTap:(){
                                              selectChat('${all[index].estimateId}');
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 7.0),
                                              decoration:BoxDecoration(
                                                  borderRadius: BorderRadius.circular(5),
                                                  color:Color(0xFF656565)
                                              ),
                                              child: Center(child: Text('자세히',
                                                style:TextStyle(
                                                  fontSize:12,
                                                  color:Colors.white,
                                                ),
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: Get.width*0.1,),
                                  ],
                                );
                              },
                            )
                        ),

                        SizedBox(height: 10,)
                      ],
                    )
                ) : Center(child: CircularProgressIndicator(),),
              ],
            ),
          )),
    );
  }
}