class Meme {
  late String? postLink;
  late String? title;
  late String? url;
  late String? author;
  Meme({
    required this.postLink,
    required this.title,
    required this.url,
    required this.author,
  });
  factory Meme.fromJson(Map<String, dynamic> json) {
    return Meme(
        postLink: json['postLink'],
        title: json['title'],
        url: json['url'],
        author: json['author']);
  }
}
