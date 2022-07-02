class Notes {
  String title;
  String content;
  String id;
  String userid;
  DateTime? dateAdded;

  Notes({
    required this.title,
    required this.content,
    required this.id,
    this.dateAdded,
    required this.userid,
  });

  factory Notes.fromMap(Map<String, dynamic> json) => Notes(
    title: json['title'],
    content: json['content'],
    id: json['_id'],
    userid: json['userid'],
    dateAdded: DateTime.tryParse(json['dateAdded'])
  );

  Map<String, dynamic> toMap() => {
    "title" : title,
    "content" : content,
    "id" : id,
    "userid" : userid,
    "dateAdded" : dateAdded?.toIso8601String()
  };

}
