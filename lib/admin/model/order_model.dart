class Order {
  String pro_id;
  String final_price;
  String final_fee;
  String final_date;
  String status;
  String register_date;
  String estimate_price;
  String estimate_date;
  String user_id;
  String user_name;

  Order({
    required this.pro_id,
    required this.final_price,
    required this.final_fee,
    required this.final_date,
    required this.status,
    required this.register_date,
    required this.estimate_price,
    required this.estimate_date,
    required this.user_id,
    required this.user_name,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      pro_id: json['pro_id'] == null ? "" : json['pro_id'] as String,
      final_price:
          json['final_price'] == null ? "" : json['final_price'] as String,
      final_fee: json['final_fee'] == null ? "" : json['final_fee'] as String,
      final_date:
          json['final_date'] == null ? "" : json['final_date'] as String,
      status: json['status'] == null ? "" : json['status'] as String,
      register_date:
          json['register_date'] == null ? "" : json['register_date'] as String,
      estimate_price: json['estimate_price'] == null
          ? ""
          : json['estimate_price'] as String,
      estimate_date:
          json['estimate_date'] == null ? "" : json['estimate_date'] as String,
      user_id: json['user_id'] == null ? "" : json['user_id'] as String,
      user_name: json['user_name'] == null ? "" : json['user_name'] as String,
    );
  }
}
