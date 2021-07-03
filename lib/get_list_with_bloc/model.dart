class Post {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Post({this.userId, this.id, this.title, this.body});
  static Post fromJson(Map<String, dynamic> json) {
    return Post(
        id: json['id'],
        userId: json['userId'],
        body: json['body'],
        title: json['title']);
  }
}
