class Pro_Summary {
  String all_partner;
  String alii_partner;
  String pay_count;


  Pro_Summary({
    required this.all_partner,
    required this.alii_partner,
    required this.pay_count,
  });

  factory Pro_Summary.fromJson(Map<String, dynamic> json) {
    return Pro_Summary(
      all_partner: json['all_partner'] as String,
      alii_partner: json['alii_partner'] as String,
      pay_count: json['pay_count'] as String,
    );
  }
}

class Pro_Detail{
  String pro_id;
  String pro_recom;
  String pro_name;
  String pro_phone;
  String com_no;
  String com_name;
  String pro_service1;
  String pro_service2;
  String pro_service3;
  String pro_service4;
  String pro_service5;
  String pro_area1;
  String pro_area2;
  String pro_area3;
  String register_date;
  String index;


  Pro_Detail({
    required this.pro_id,
    required this.pro_recom,
    required this.pro_name,
    required this.pro_phone,
    required this.com_no,
    required this.com_name,
    required this.pro_service1,
    required this.pro_service2,
    required this.pro_service3,
    required this.pro_service4,
    required this.pro_service5,
    required this.pro_area1,
    required this.pro_area2,
    required this.pro_area3,
    required this.register_date,
    required this.index,
  });

  factory Pro_Detail.fromJson(Map<String, dynamic> json) {
    return Pro_Detail(
      pro_id: json['pro_id'] == null ? "" : json['pro_id'] as String,
      pro_recom: json['pro_recom'] == null ? "" : json['pro_recom'] as String,
      pro_name: json['pro_name'] == null ? "" : json['pro_name'] as String,
      pro_phone: json['pro_phone'] == null ? "" : json['pro_phone'] as String,
      com_no: json['com_no'] == null ? "" : json['com_no'] as String,
      com_name: json['com_name'] == null ? "" : json['com_name'] as String,
      pro_service1: json['pro_service1'] == null ? "" : json['pro_service1'] as String,
      pro_service2: json['pro_service2'] == null ? "" : json['pro_service2'] as String,
      pro_service3: json['pro_service3'] == null ? "" : json['pro_service3'] as String,
      pro_service4: json['pro_service4'] == null ? "" : json['pro_service4'] as String,
      pro_service5: json['pro_service5'] == null ? "" : json['pro_service5'] as String,
      pro_area1: json['pro_area1'] == null ? "" : json['pro_area1'] as String,
      pro_area2: json['pro_area2'] == null ? "" : json['pro_area2'] as String,
      pro_area3: json['pro_area3'] == null ? "" : json['pro_area3'] as String,
      register_date: json['register_date'] == null ? "" : json['register_date'] as String,
      index: json['index'] == null ? "" : json['index'] as String,
    );
  }
}
