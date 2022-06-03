class Notices{
  int id;
  String notice_id;
  String notice_type;
  String notice_title;
  String notice_content;
  String notice_content_img;
  String notice_status;


  Notices({
    required this.id,
    required this.notice_id,
    required this.notice_type,
    required this.notice_title,
    required this.notice_content,
    required this.notice_content_img,
    required this.notice_status,
  });

  factory Notices.fromJson(Map<String, dynamic> json) {
    return Notices(
      id: json['id'] == null ? 0 : int.parse(json['id']),
      notice_id: json['notice_id'] == null ? "" : json['notice_id'] as String,
      notice_type: json['notice_type'] == null ? "" : json['notice_type'] as String,
      notice_title: json['notice_title'] == null ? "" : json['notice_title'] as String,
      notice_content: json['notice_content'] == null ? "" : json['notice_content'] as String,
      notice_content_img: json['notice_content_img'] == null ? "" : json['notice_content_img'] as String,
      notice_status: json['notice_status'] == null ? "" : json['notice_status'] as String,
    );
  }
}
