import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plus_web/admin/model/chat_model.dart';

class Chat_Data{
  static const ROOT = "http://211.110.44.91/web_data/plus_admin_chat.php";
  static const GET_CHAT_ACTION = "GET_CHAT";
  static const SELECT_CHAT_ACTION = "SELECT_CHAT";
  static const SUMMARY_CHAT_ACTION = "SUMMARY_CHAT";


  //모든 채팅 목록 불러오기
  static Future<List<Chat_All>> getChat() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = GET_CHAT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Get Chat Response : ${response.body}');
      if(200 == response.statusCode){
        List<Chat_All> list = parseResponse(response.body);
        return list;
      }else{
        return <Chat_All>[];
      }
    }catch(e){
      return <Chat_All>[];
    }
  }

  //채팅 자세히 불러오기
  static Future<List<Chat_All>> selectChat(String estimate_id) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = SELECT_CHAT_ACTION;
      map['estimate_id'] = estimate_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Select Chat Response : ${response.body}');
      if(200 == response.statusCode){
        List<Chat_All> list = parseResponse(response.body);
        return list;
      }else{
        return <Chat_All>[];
      }
    }catch(e){
      return <Chat_All>[];
    }
  }


  //채팅 요약 정보
  static Future<List<Chat_Summary>> summaryChat() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = SUMMARY_CHAT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Get Summary Response: ${response.body}');
      if(200 == response.statusCode){
        List<Chat_Summary> list = parseResponse2(response.body);
        return list;
      }else{
        return <Chat_Summary>[];
      }
    }catch(e){
      return <Chat_Summary>[];
    }
  }


  //모든 채팅 목록 불러오기 & 채팅 자세히 불러오기
  static List<Chat_All> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Chat_All>((json) => Chat_All.fromJson(json)).toList();
  }

  //채팅 요약 정보
  static List<Chat_Summary> parseResponse2(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Chat_Summary>((json) => Chat_Summary.fromJson(json)).toList();
  }

}