class PostDetail {
  int userId;
  int id;
  String title;
  String body;

  PostDetail({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostDetail.fromJson(Map<String, dynamic> json) {
    return PostDetail(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
