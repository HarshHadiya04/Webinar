class Webinar {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String time;
  final double duration;
  final String registrationLink;
  final int maxParticipants;
  final bool isActive;

  Webinar({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.duration,
    required this.registrationLink,
    required this.maxParticipants,
    required this.isActive,
  });

  factory Webinar.fromJson(Map<String, dynamic> json) {
    return Webinar(
      id: json['_id'] as String? ?? '',
      title: json['title'] as String? ?? 'No Title',
      description: json['description'] as String? ?? 'No Description',
      date: DateTime.tryParse(json['date'] as String? ?? '') ?? DateTime.now(),
      time: json['time'] as String? ?? '00:00',
      duration: (json['duration'] as num?)?.toDouble() ?? 0.0,
      registrationLink: json['registrationLink'] as String? ?? '',
      maxParticipants: (json['maxParticipants'] as num?)?.toInt() ?? 0,
      isActive: json['isActive'] as bool? ?? false,
    );
  }
}