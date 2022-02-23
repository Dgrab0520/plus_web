import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plus_web/admin/model/setting_model.dart';

class Setting_Data{
  static const ROOT = "http://211.110.44.91/web_data/plus_admin_setting.php";
  static const GET_GRAPH_ACTION = "GET_GRAPH";
  static const GET_REG_ACTION = "GET_REG";
  static const GET_PRO_ACTION = "GET_PRO";
  static const GET_MEMBER_ACTION = "GET_MEMBER";
  static const GET_SERVICE_ACTION = "GET_SERVICE";

  //서비스별 이용 현황
  static Future<List<Settings>> getGraph() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = GET_GRAPH_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      if(200 == response.statusCode){
        List<Settings> list = parseResponse(response.body);
        return list;
      }else{
        return <Settings>[];
      }
    }catch(e){
      return <Settings>[];
    }
  }

  //월별 회원가입
  static Future<List<Settings2>> getReg(String date) async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = GET_REG_ACTION;
      map['date'] = date;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Get Reg Respnose : ${response.body}');
      if(200 == response.statusCode){
        List<Settings2> list = parseResponse2(response.body);
        return list;
      }else{
        return <Settings2>[];
      }
    }catch(e){
      return <Settings2>[];
    }
  }

  //파트너 정보
  static Future<List<Settings3>> getPro() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = GET_PRO_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Get Reg Respnose : ${response.body}');
      if(200 == response.statusCode){
        List<Settings3> list = parseResponse3(response.body);
        return list;
      }else{
        return <Settings3>[];
      }
    }catch(e){
      return <Settings3>[];
    }
  }

  //전체 회원 현황
  static Future<List<Settings4>> getMember() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = GET_MEMBER_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Get Reg Respnose : ${response.body}');
      if(200 == response.statusCode){
        List<Settings4> list = parseResponse4(response.body);
        return list;
      }else{
        return <Settings4>[];
      }
    }catch(e){
      return <Settings4>[];
    }
  }

  //전문가 분야 현황
  static Future<List<Settings5>> getService() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = GET_SERVICE_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Get Service Respnose : ${response.body}');
      if(200 == response.statusCode){
        List<Settings5> list = parseResponse5(response.body);
        return list;
      }else{
        return <Settings5>[];
      }
    }catch(e){
      return <Settings5>[];
    }
  }


  //서비스별 이용 현황
  static List<Settings> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Settings>((json) => Settings.fromJson(json)).toList();
  }

  //월별 회원가입
  static List<Settings2> parseResponse2(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Settings2>((json) => Settings2.fromJson(json)).toList();
  }

  //파트너 정보
  static List<Settings3> parseResponse3(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Settings3>((json) => Settings3.fromJson(json)).toList();
  }

  //전체 회원 현황
  static List<Settings4> parseResponse4(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Settings4>((json) => Settings4.fromJson(json)).toList();
  }

  //전문가 분야 현황
  static List<Settings5> parseResponse5(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Settings5>((json) => Settings5.fromJson(json)).toList();
  }
}