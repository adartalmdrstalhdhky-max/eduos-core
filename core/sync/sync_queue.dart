import '../events/learning_event.dart';

class SyncQueue {
  final List<LearningEvent> _queue = [];

  void enqueue(LearningEvent event) {
    _queue.add(event);
  }

  LearningEvent? dequeue() {
    if (_queue.isEmpty) return null;
    return _queue.removeAt(0);
  }

  bool get isEmpty => _queue.isEmpty;

  int get length => _queue.length;

  List<LearningEvent> peekAll() {
    return List.unmodifiable(_queue);
  }

  void clear() {
    _queue.clear();
  }
}
