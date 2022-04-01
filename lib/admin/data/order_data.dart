import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:plus_web/admin/model/order_model.dart';

class OrderData extends GetxController {
  static const ROOT = "http://211.110.44.91/web_data/plus_admin_order.php";
  static const ORDER_SELECT_ACTION = "ORDER_SELECT";

  final _order = <Order>[].obs;

  List<Order> get order => _order;
  set order(val) => _order.value = val;

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;
  set isLoading(val) => _isLoading.value = val;

  //모든 거래 목록 불러오기
  getOrder() async {
    try {
      var map = <String, dynamic>{};
      map['action'] = ORDER_SELECT_ACTION;
      final response = await http.post(Uri.parse(ROOT), body: map);
      print('Get Order Response : ${response.body}');
      if (200 == response.statusCode) {
        order = parseResponse(response.body);
        isLoading = true;
      }
    } catch (e) {
      print("exception : $e");
    }
  }

  //모든 거래 목록 불러오기
  static List<Order> parseResponse(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Order>((json) => Order.fromJson(json)).toList();
  }
}
