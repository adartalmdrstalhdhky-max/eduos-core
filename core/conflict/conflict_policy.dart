import '../events/learning_event.dart';

enum ConflictStrategy {
  keepLocal,
  keepRemote,
  merge,
}

class ConflictPolicy {
  final ConflictStrategy strategy;

  ConflictPolicy({this.strategy = ConflictStrategy.keepLocal});

  LearningEvent resolve({
    required LearningEvent local,
    required LearningEvent remote,
  }) {
    switch (strategy) {
      case ConflictStrategy.keepRemote:
        return remote;

      case ConflictStrategy.merge:
        final mergedPayload = {
          ...remote.payload,
          ...local.payload,
        };

        return LearningEvent(
          id: local.id,
          studentId: local.studentId,
          type: local.type,
          payload: mergedPayload,
          timestamp: local.timestamp.isAfter(remote.timestamp)
              ? local.timestamp
              : remote.timestamp,
          synced: true,
        );

      case ConflictStrategy.keepLocal:
      default:
        return local;
    }
  }
}
