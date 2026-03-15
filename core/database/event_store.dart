import '../events/learning_event.dart';

class EventStore {
  final List<LearningEvent> _events = [];

  void addEvent(LearningEvent event) {
    _events.add(event);
  }

  List<LearningEvent> getAllEvents() {
    return _events;
  }

  List<LearningEvent> getUnsyncedEvents() {
    return _events.where((event) => !event.synced).toList();
  }

  void markAsSynced(String eventId) {
    for (var event in _events) {
      if (event.id == eventId) {
        final updated = LearningEvent(
          id: event.id,
          studentId: event.studentId,
          type: event.type,
          payload: event.payload,
          timestamp: event.timestamp,
          synced: true,
        );
        _events[_events.indexOf(event)] = updated;
      }
    }
  }
}
