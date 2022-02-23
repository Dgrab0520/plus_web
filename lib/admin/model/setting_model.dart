class Settings {
  String main_category;
  String sub_category;
  String count;


  Settings({
    required this.main_category,
    required this.sub_category,
    required this.count,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      main_category: json['main_category'] == null ? "" : json['main_category'] as String,
      sub_category: json['sub_category'] == null ? "" : json['sub_category'] as String,
      count: json['count'] == null ? "" : json['count'] as String,
    );
  }
}

class Settings2 {
  String month;
  String count;

  Settings2({
    required this.month,
    required this.count,
  });

  factory Settings2.fromJson(Map<String, dynamic> json) {
    return Settings2(
      month: json['month'] == null ? "" : json['month'] as String,
      count: json['count'] == null ? "" : json['count'] as String,
    );
  }
}

class Settings3 {
  String index;
  String count;

  Settings3({
    required this.index,
    required this.count,
  });

  factory Settings3.fromJson(Map<String, dynamic> json) {
    return Settings3(
      index: json['index'] == null ? "" : json['index'] as String,
      count: json['count'] == null ? "" : json['count'] as String,
    );
  }
}

class Settings4 {
  String customer;
  String pro;

  Settings4({
    required this.customer,
    required this.pro,
  });

  factory Settings4.fromJson(Map<String, dynamic> json) {
    return Settings4(
      customer: json['customer'] == null ? "" : json['customer'] as String,
      pro: json['pro'] == null ? "" : json['pro'] as String,
    );
  }
}

class Settings5 {
  String service;
  String count;

  Settings5({
    required this.service,
    required this.count,
  });

  factory Settings5.fromJson(Map<String, dynamic> json) {
    return Settings5(
      service: json['service'] == null ? "" : json['service'] as String,
      count: json['count'] == null ? "" : json['count'] as String,
    );
  }
}