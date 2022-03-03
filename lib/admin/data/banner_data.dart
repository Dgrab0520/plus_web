import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:plus_web/admin/model/banner_model.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
String getRandomString() => String.fromCharCodes(Iterable.generate(
    10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class Banner_Data extends GetxController {
  static const ROOT = "http://211.110.44.91/plus/plus_banner_select.php";
  static const BANNER_SELECT_ACTION = "BANNER_SELECT";
  static const BANNER_SUB_SELECT_ACTION = "BANNER_SUB_ACTION";
  static const BANNER_INSERT_ACTION = "BANNER_INSERT_ACTION";
  static const BANNER_DELETE_ACTION = "BANNER_DELETE_ACTION";
  static const BANNER_UPDATE_ACTION = "BANNER_UPDATE_ACTION";

  final _bannerMain = <Banners>[].obs; //메인 배너
  final _bannerSub = <Banners>[].obs; //서브 배너

  get bannerMain => _bannerMain;
  set bannerMain(val) => _bannerMain.value = val;

  get bannerSub => _bannerSub;
  set bannerSub(val) => _bannerSub.value = val;

  final _isMainLoading = false.obs;
  final _isSubLoading = false.obs;

  get isMainLoading => _isMainLoading.value;
  set isMainLoading(val) => _isMainLoading.value = val;

  get isSubLoading => _isSubLoading.value;
  set isSubLoading(val) => _isSubLoading.value = val;

  //메인 배너 불러오기
  getBanner_Main() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = BANNER_SELECT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Banner Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Banners> list = parseResponse(response.body);
        bannerMain = list;
        isMainLoading = true;
        print("isMainLoading : $isMainLoading");
      }
    } catch (e) {
      print(e);
    }
  }

  //서브 배너 불러오기
  getBanner_Sub() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = BANNER_SUB_SELECT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Banner_Sub Select Response : ${response.body}');

      if (response.statusCode == 200) {
        List<Banners> list = parseResponse(response.body);
        bannerSub = list;
        isSubLoading = true;
        print(isSubLoading);
      }
    } catch (e) {
      print(e);
    }
  }

  //배너 추가
  static Future<bool> insertBanner(Banners banner, Uint8List? ufile) async {
    String banner_id = getRandomString();
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = BANNER_INSERT_ACTION;
      request.fields['banner_id'] = banner_id;
      request.fields['banner_type'] = banner.banner_type;
      request.fields['banner_title'] = banner.banner_title;
      request.fields['banner_sub'] = banner.banner_sub;
      request.fields['banner_image'] = banner_id + ".gif";

      request.files.add(http.MultipartFile.fromBytes(
        "userfile",
        ufile!,
        contentType: MediaType('application', 'octet-stream'),
        filename: "userfile",
      ));
      print(request);
      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Insert Banner Response : ${response.body}");
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

  //배너 삭제
  static Future<bool> deleteBanner(String banner_id) async {
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = BANNER_DELETE_ACTION;
      request.fields['banner_id'] = banner_id;

      http.Response response =
          await http.Response.fromStream(await request.send());
      print("Delete Banner Response : ${response.body}");
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

  //배너 업데이트
  static Future<bool> updateBanner(
      String banner_id, String banner_title, String banner_sub,
      {String? banner_img, Uint8List? ufile}) async {
    try {
      var url = Uri.parse(ROOT);
      var request = http.MultipartRequest('POST', url);
      request.fields['action'] = BANNER_UPDATE_ACTION;
      request.fields['banner_id'] = banner_id;
      request.fields['banner_title'] = banner_title;
      request.fields['banner_sub'] = banner_sub;

      if (ufile != null) {
        request.fields['banner_image'] = getRandomString() + '.gif';
        print(request.fields['banner_image']);
        request.files.add(http.MultipartFile.fromBytes(
          "userfile",
          ufile,
          contentType: MediaType('application', 'octet-stream'),
          filename: "userfile",
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

  static List<Banners> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Banners>((json) => Banners.fromJson(json)).toList();
  }
}
