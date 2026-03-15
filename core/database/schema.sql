CREATE TABLE IF NOT EXISTS learning_events (
  id TEXT PRIMARY KEY,
  student_id TEXT NOT NULL,
  type TEXT NOT NULL,
  payload TEXT NOT NULL,
  timestamp TEXT NOT NULL,
  synced INTEGER NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS idx_events_student
ON learning_events(student_id);

CREATE INDEX IF NOT EXISTS idx_events_synced
ON learning_events(synced);
