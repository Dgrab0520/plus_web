class Cus_Summary {
  String all_count;
  String reg_count;
  String order_count;


  Cus_Summary({
    required this.all_count,
    required this.reg_count,
    required this.order_count,
  });

  factory Cus_Summary.fromJson(Map<String, dynamic> json) {
    return Cus_Summary(
      all_count: json['all_count'] as String,
      reg_count: json['reg_count'] as String,
      order_count: json['order_count'] as String,
    );
  }
}

class Cus_Detail{
  String cus_id;
  String cus_recom;
  String point;
  String register_Date;
  String order_count;

  Cus_Detail({
    required this.cus_id,
    required this.cus_recom,
    required this.point,
    required this.register_Date,
    required this.order_count,
  });

  factory Cus_Detail.fromJson(Map<String, dynamic> json) {
    return Cus_Detail(
      cus_id: json['cus_id'] as String,
      cus_recom: json['cus_recom'] as String,
      point: json['point'] as String,
      register_Date: json['register_Date'] as String,
      order_count: json['order_count'] as String,
    );
  }
}
