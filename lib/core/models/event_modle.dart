class EventModel {
  static const String collectionName = 'Events';

  String id;
  String title;
  String description;
  DateTime dateTime;
  String time;
  bool isFavorite;
  String category;

  EventModel(
      {this.id = "",
      required this.title,
      required this.description,
      required this.dateTime,
      required this.time,
      this.isFavorite = false,
      required this.category});

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTime': dateTime.microsecondsSinceEpoch,
      'time': time,
      'isFavorite': isFavorite,
      'category': category
    };
  }

  EventModel.fromFireStore(Map<String, dynamic> data)
      : this(
          id: data['id'],
          title: data['title'],
          description: data['description'],
          dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
          time: data['time'],
          isFavorite: data['isFavorite'],
          category: data['category'],
        );
}
