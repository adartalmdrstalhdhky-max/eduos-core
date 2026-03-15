class LearningEvent {
  final String id;
  final String studentId;
  final String type;
  final Map<String, dynamic> payload;
  final DateTime timestamp;
  final bool synced;

  LearningEvent({
    required this.id,
    required this.studentId,
    required this.type,
    required this.payload,
    required this.timestamp,
    this.synced = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'type': type,
      'payload': payload,
      'timestamp': timestamp.toIso8601String(),
      'synced': synced,
    };
  }

  factory LearningEvent.fromJson(Map<String, dynamic> json) {
    return LearningEvent(
      id: json['id'],
      studentId: json['studentId'],
      type: json['type'],
      payload: Map<String, dynamic>.from(json['payload']),
      timestamp: DateTime.parse(json['timestamp']),
      synced: json['synced'] ?? false,
    );
  }
}
