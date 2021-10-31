class PollItem {
  final int number;
  final String title;
  final String fullName;

  PollItem({
    required this.number,
    required this.title,
    required this.fullName,
  });

  factory PollItem.fromJson(Map<String, dynamic> json) {
    return PollItem(
      number: json['number'],
      title: json['title'],
      fullName: json['fullName'],
    );
  }

  PollItem.fromJson2(Map<String, dynamic> json)
      : number = json['number'],
        title = json['title'],
        fullName = json['fullName'];

}