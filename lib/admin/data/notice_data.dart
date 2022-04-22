import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:plus_web/admin/model/notice_model.dart';

class NoticeData extends GetxController {
  static const root = "http://211.110.44.91/plus/plus_notice.php";

  final _notices = <NoticeModel>[].obs;
  List<NoticeModel> get notices => _notices;
  set notices(val) => _notices.value = val;

  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(val) => _isLoading.value = val;

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();
  String getRandomString() => String.fromCharCodes(Iterable.generate(
      10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  //공지사항 불러오기
  getNotice() async {
    isLoading = false;
    try {
      var map = <String, dynamic>{};
      map['action'] = "GET_NOTICE";
      final response = await http.post(Uri.parse(root), body: map);
      print('Get Notice Response : ${response.body}');

      if (response.statusCode == 200) {
        notices = parseResponse(response.body);
        isLoading = true;
      }
    } catch (e) {
      print(e);
    }
  }

  //공지사항 추가
  Future<bool> insertNotice(NoticeModel notice, Uint8List? uFile) async {
    try {
      var url = Uri.parse(root);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "INSERT_NOTICE";
      request.fields['notice_id'] = getRandomString();
      request.fields['notice_type'] = notice.noticeType;
      request.fields['notice_title'] = notice.noticeTitle;
      request.fields['notice_content'] = notice.noticeContent;
      request.fields['notice_content_img'] = getRandomString() + ".gif";
      request.fields['notice_status'] = notice.noticeStatus;

      request.files.add(http.MultipartFile.fromBytes(
        "userFile",
        uFile!,
        contentType: MediaType('application', 'octet-stream'),
        filename: "userFile",
      ));
      print(request);
      http.Response response =
          await http.Response.fromStream(await request.send());
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

  //공지사항 삭제
  Future<bool> deleteNotice(int id) async {
    try {
      var url = Uri.parse(root);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "DELETE_NOTICE";
      request.fields['id'] = id.toString();

      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Delete Notice Response : ${response.body}");
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

  //공지사항 업데이트
  Future<bool> updateNotice(int id,
      {String? noticeType,
      String? noticeTitle,
      String? noticeContent,
      String? noticeStatus,
      Uint8List? uFile}) async {
    try {
      var url = Uri.parse(root);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = "UPDATE_NOTICE";
      request.fields['id'] = id.toString();
      if (noticeType != null) {
        request.fields['notice_type'] = noticeType;
      }
      if (noticeTitle != null) {
        request.fields['notice_title'] = noticeTitle;
      }
      if (noticeContent != null) {
        request.fields['notice_content'] = noticeContent;
      }
      if (noticeStatus != null) {
        request.fields['notice_status'] = noticeStatus;
      }

      if (uFile != null) {
        request.fields['notice_content_img'] = getRandomString() + ".gif";
        request.files.add(http.MultipartFile.fromBytes(
          "userFile",
          uFile,
          contentType: MediaType('application', 'octet-stream'),
          filename: "userFile",
        ));
      }
      print(request);
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Update Banner Response : ${response.body}");
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

  static List<NoticeModel> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<NoticeModel>((json) => NoticeModel.fromJson(json))
        .toList();
  }
}
