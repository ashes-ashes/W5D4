
PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(100),
  lname VARCHAR(100)
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  body TEXT,
  author_id INTEGER,

  FOREIGN KEY(author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  users_id INTEGER,
  questions_id INTEGER,

  FOREIGN KEY(users_id) REFERENCES users(id),
  FOREIGN KEY(questions_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT,
  question INTEGER NOT NULL,
  author INTEGER,
  parent_reply INTEGER,

  FOREIGN KEY(question) REFERENCES questions(id),
  FOREIGN KEY(author) REFERENCES users(id),
  FOREIGN KEY(parent_reply) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question INTEGER NOT NULL,
  liker INTEGER NOT NULL,
  
  FOREIGN KEY(question) REFERENCES questions(id),
  FOREIGN KEY(liker) REFERENCES users(id)
);


INSERT INTO users
  (fname, lname)
VALUES
  ('Danny', 'DeVito'), 
  ('Ruth', 'Ginsberg'),
  ('Florence', 'Welch');

INSERT INTO questions
  (title, body, author_id)
VALUES 
  ('Eggs', 'Can I offer you an egg in this trying time?', 1),
  ('2020', 'How long must I continue to live?', 2);

INSERT INTO question_follows
  (users_id, questions_id)
VALUES 
  (1, 2),
  (2, 1);

INSERT INTO replies
  (body, question, author, parent_reply)
VALUES
  ('Is it a nice egg?', 1, 3, null),
  ('Keep doing push-ups', 2, 1, null),
  ('Yes it is a very nice egg!', 1, 1, 1);

INSERT INTO question_likes
  (question, liker)
VALUES 
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3);