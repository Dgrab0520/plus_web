import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plus_web/admin/model/partner_model.dart';

class Pro_Data {
  static const ROOT = "http://211.110.44.91/web_data/plus_admin_partner.php";
  static const GET_SUMMARY_ACTION = "GET_SUMMARY";
  static const GET_PRO_ACTION = "GET_PRO";
  static const SELECT_PRO_ACTION = "SELECT_PRO";

  //Get Pro's Summary Information
  static Future<List<Pro_Summary>> getSummary() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_SUMMARY_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Get Summary Response : ${response.body}");
      if (200 == response.statusCode) {
        List<Pro_Summary> list = parseResponse(response.body);
        return list;
      } else {
        return <Pro_Summary>[];
      }
    } catch (e) {
      return <Pro_Summary>[];
    }
  }

  //Get Pro's Detail Information
  static Future<List<Pro_Detail>> getPro() async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = GET_PRO_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Get Pro Response : ${response.body}");
      if (200 == response.statusCode) {
        List<Pro_Detail> list = parseResponse2(response.body);
        return list;
      } else {
        return <Pro_Detail>[];
      }
    } catch (e) {
      return <Pro_Detail>[];
    }
  }

  //Select Pro's Detail Informatioin
  static Future<List<Pro_Detail>> selectPro(String pro_id) async {
    try {
      var map = Map<String, dynamic>();
      map['action'] = SELECT_PRO_ACTION;
      map['pro_id'] = pro_id;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Select Pro Response : ${response.body}");
      if (200 == response.statusCode) {
        List<Pro_Detail> list = parseResponse2(response.body);
        return list;
      } else {
        return <Pro_Detail>[];
      }
    } catch (e) {
      return <Pro_Detail>[];
    }
  }

  //update Alliance
  static Future<bool> updateAlliance(String pro_id, String alliance) async {
    print(pro_id);
    print(alliance);
    try {
      var map = <String, dynamic>{};
      map['action'] = "UPDATE_ALLIANCE";
      map['pro_id'] = pro_id;
      map['alliance'] = alliance;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Update Alliance Response : ${response.body}");
      if (200 == response.statusCode) {
        if (response.body == "success") {
          return true;
        }
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // //Get Pro's Summary Information
  static List<Pro_Summary> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<Pro_Summary>((json) => Pro_Summary.fromJson(json))
        .toList();
  }

  static List<Pro_Detail> parseResponse2(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Pro_Detail>((json) => Pro_Detail.fromJson(json)).toList();
  }
}
