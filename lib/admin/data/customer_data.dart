
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:plus_web/admin/model/customer_model.dart';


class Customer_Data{
  static const ROOT = "http://211.110.44.91/web_data/plus_admin_customer.php";
  static const GET_SUMMARY_ACTION = "GET_SUMMARY";
  static const GET_DETAIL_ACTION = "GET_DETAIL";

  //Get Customer's Summary Information
  static Future<List<Cus_Summary>> getSummary(String date) async{
    try{
      var map = Map<String, dynamic>();
      map['action'] = GET_SUMMARY_ACTION;
      map['date'] = date;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Select Summary Response : ${response.body}");
      if(200 == response.statusCode){
        List<Cus_Summary> list = parseResponse(response.body);
        return list;
      }else{
        return <Cus_Summary>[];
      }
    }catch(e){
      return <Cus_Summary>[];
    }
  }


  //Get Customer's Detail Information
  static Future<List<Cus_Detail>> getDetail() async {
    try{
      var map = Map<String, dynamic>();
      map['action'] = GET_DETAIL_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print("Select Detail Response : ${response.body}");
      if(200 == response.statusCode){
        List<Cus_Detail> list = parseResponse2(response.body);
        return list;
      }else{
        return <Cus_Detail>[];
      }
    }catch(e){
      return <Cus_Detail>[];
    }
  }


  //Get Customer's Summary Information
  static List<Cus_Summary> parseResponse(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Cus_Summary>((json) => Cus_Summary.fromJson(json)).toList();
  }

  //Get Customer's Detail Information
  static List<Cus_Detail> parseResponse2(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Cus_Detail>((json) => Cus_Detail.fromJson(json)).toList();
  }
}