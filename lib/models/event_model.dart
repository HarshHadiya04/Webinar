class Event {
  final String id;
  final String title;
  final String description;
  final String venue;
  final DateTime date;
  final String time;
  final String category;
  final Map<String, dynamic> organizer;
  final double ticketPrice;
  final int capacity;
  final bool isActive;
  final String? image;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.venue,
    required this.date,
    required this.time,
    required this.category,
    required this.organizer,
    required this.ticketPrice,
    required this.capacity,
    required this.isActive,
    this.image,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      venue: json['venue'] ?? '',
      date: DateTime.parse(json['date']),
      time: json['time'] ?? '',
      category: json['category'] ?? '',
      organizer: json['organizer'] ?? {},
      ticketPrice: (json['ticketPrice'] ?? 0).toDouble(),
      capacity: json['capacity'] ?? 0,
      isActive: json['isActive'] ?? true,
      image: json['image'],
    );
  }

  // Add getters to map existing properties to expected names
  String get location => venue;
  DateTime get dateTime => date;
  String get thumbnailUrl => image ?? 'https://picsum.photos/600/400';
  String get organizerImage => 'https://picsum.photos/300/200';
  String get organizerName => organizer['name'] ?? '';
  int get currentParticipants => 0; // Default since not in schema
  int get maxParticipants => capacity;
  double get price => ticketPrice;
  List<String> get tags => [category]; // Use category as tag
}
