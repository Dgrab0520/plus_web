import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:plus_web/admin/model/notice_model.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString() => String.fromCharCodes(Iterable.generate(
    10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));


class Notice_Data extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_notice_select.php";
  static const NOTICE_SELECT_ACTION = "NOTICE_SELECT";
  static const NOTICE_INSERT_ACTION = "NOTICE_INSERT";
  static const NOTICE_UPDATE_ACTION = "NOTICE_UPDATE";
  static const NOTICE_DELETE_ACTION = "NOTICE_DELETE";

  final _notice = <Notices>[].obs;

  get noticeMain => _notice;
  set noticeMain(val) => _notice.value = val;

  final _isMainLoading = false.obs;

  get isMainLoading => _isMainLoading.value;
  set isMainLoading(val) => _isMainLoading.value = val;

  //Notice 불러오기
  getNotice() async {
    try{
      var map = <String, dynamic>{};
      map['action'] = NOTICE_SELECT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Notice Select Response : ${response.body}');

      if(response.statusCode == 200){
        List<Notices> list = parseResponse(response.body);
        noticeMain = list;
        isMainLoading = true;
        print("isMainLoading : $isMainLoading");
      }
    }catch(e){
      print('here');
      print(e);
    }
  }

  static Future<bool> insertNotice(Notices notices, Uint8List? ufile) async {
    String notice_id = getRandomString();
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = NOTICE_INSERT_ACTION;
      request.fields['notice_id'] = notice_id;
      request.fields['notice_type'] = notices.notice_type;
      request.fields['notice_title'] = notices.notice_title;
      request.fields['notice_content'] = notices.notice_content;
      request.fields['notice_content_img'] = notice_id + ".gif";
      request.fields['notice_status'] = notices.notice_status;

      request.files.add(http.MultipartFile.fromBytes(
        "userfile",
        ufile!,
        contentType: MediaType('application', 'octet-stream'),
        filename: "userfile",
      ));
      print('request is $request');
      http.Response response = await http.Response.fromStream(await request.send());
      print("Insert Notice Response : ${response.body}");
      if (response.statusCode == 200) {
        if (response.body == "success") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      print("exception : $e");
      return false;
    }
  }

  //delete Notice
  static Future<bool> deleteNotice(String notice_id) async {
    try{
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = NOTICE_DELETE_ACTION;
      request.fields['notice_id'] = notice_id;

      http.Response response = await http.Response.fromStream(await request.send());
      print("Delete Notice Response : ${response.body}");
      if(response.statusCode == 200){
        if(response.body == 'success'){
          return true;
        }else{
          return false;
        }
      }else{
        return false;
      }
    }catch(e){
      print('exception : $e');
      return false;
    }
  }


  //update Notice
  static Future<bool> updateNotice(String notice_id, String notice_type, String notice_title, String notice_content,  String notice_status, {String? notice_content_img, Uint8List? ufile}) async {
    try{
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = NOTICE_UPDATE_ACTION;
      request.fields['notice_id'] = notice_id;
      request.fields['notice_type'] = notice_type;
      request.fields['notice_title'] = notice_title;
      request.fields['notice_content'] = notice_content;
      request.fields['notice_status'] = notice_status;

      if (ufile != null) {
        request.fields['notice_content_img'] = getRandomString() + '.gif';
        print(request.fields['notice_content_img']);
        request.files.add(http.MultipartFile.fromBytes(
          "userfile",
          ufile,
          contentType: MediaType('application', 'octet-stream'),
          filename: "userfile",
        ));
      }
      print(request);
      http.Response response = await http.Response.fromStream(await request.send());
      print('Update Notice Response : ${response.body}');
      if(response.statusCode == 200){
        if(response.body == 'success'){
          return true;
        }else{
          return false;
        }
      }else{
        return false;
      }
    }catch(e){
      print("exception : $e");
      return false;
    }
}




  static List<Notices> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Notices>((json) => Notices.fromJson(json)).toList();
  }
}
