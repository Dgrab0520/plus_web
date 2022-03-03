class Banners {
  int id;
  String banner_id;
  String banner_type;
  String banner_img;
  String banner_title;
  String banner_sub;

  Banners({
    required this.id,
    required this.banner_id,
    required this.banner_type,
    required this.banner_img,
    required this.banner_title,
    required this.banner_sub,
  });

  factory Banners.fromJson(Map<String, dynamic> json) {
    return Banners(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      banner_id: json['banner_id'] == null ? "" : json['banner_id'] as String,
      banner_type:
          json['banner_type'] == null ? "" : json['banner_type'] as String,
      banner_img:
          json['banner_img'] == null ? "" : json['banner_img'] as String,
      banner_title:
          json['banner_title'] == null ? "" : json['banner_title'] as String,
      banner_sub:
          json['banner_sub'] == null ? "" : json['banner_sub'] as String,
    );
  }
}
