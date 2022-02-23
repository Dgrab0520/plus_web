class Chat_All {
  String estimateId;
  String text;
  String image;
  String estimatePrice;
  String finalPrice;
  String chatType;
  String isPro;
  String createAt;
  String pro_id;
  String customer_id;


  Chat_All({
    required this.estimateId,
    required this.text,
    required this.image,
    required this.estimatePrice,
    required this.finalPrice,
    required this.chatType,
    required this.isPro,
    required this.createAt,
    required this.pro_id,
    required this.customer_id,
  });

  factory Chat_All.fromJson(Map<String, dynamic> json) {
    return Chat_All(
      estimateId: json['estimateId'] == null ? "" : json['estimateId'] as String,
      text: json['text'] == null ? "" : json['text'] as String,
      image: json['image'] == null ? "" : json['image'] as String,
      estimatePrice: json['estimatePrice'] == null ? "" : json['estimatePrice'] as String,
      finalPrice: json['finalPrice'] == null ? "" : json['finalPrice'] as String,
      chatType: json['chatType'] == null ? "" : json['chatType'] as String,
      isPro: json['isPro'] == null ? "" : json['isPro'] as String,
      createAt: json['createAt'] == null ? "" : json['createAt'] as String,
      pro_id: json['pro_id'] == null ? "" : json['pro_id'] as String,
      customer_id: json['customer_id'] == null ? "" : json['customer_id'] as String,
    );
  }
}



class Chat_Summary {
  String order_count;
  String fin_count;
  String estimate_count;



  Chat_Summary({
    required this.order_count,
    required this.fin_count,
    required this.estimate_count,
  });

  factory Chat_Summary.fromJson(Map<String, dynamic> json) {
    return Chat_Summary(
      order_count: json['order_count'] == null ? "" : json['order_count'] as String,
      fin_count: json['fin_count'] == null ? "" : json['fin_count'] as String,
      estimate_count: json['estimate_count'] == null ? "" : json['estimate_count'] as String,
    );
  }
}