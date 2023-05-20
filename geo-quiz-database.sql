BEGIN TRANSACTION;

DROP TABLE IF EXISTS answer;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS topic;


CREATE TABLE topic (
	topic_id serial,
	name varchar(200) NOT NULL,
	CONSTRAINT PK_topic PRIMARY KEY(topic_id)
);

CREATE TABLE question (
	question_id serial,
	topic_id int,
	question_text varchar(15),
	image_name varchar(200),
	CONSTRAINT PK_question PRIMARY KEY(question_id),
	CONSTRAINT FK_topic FOREIGN KEY(topic_id) REFERENCES topic(topic_id)
);

CREATE TABLE answer (
	answer_id serial,
	question_id int NOT NULL,
	answer_text varchar(200),
	is_correct boolean,
	CONSTRAINT PK_answer PRIMARY KEY(answer_id),
	CONSTRAINT FK_question FOREIGN KEY(question_id) REFERENCES question(question_id)
);

INSERT INTO topic (name) VALUES
	('Flags'),
	('Countries'),
	('States'),
	('Capitals'),
	('State License Plates'),
	('State Nicknames'),
	('State Abbreviations');
	

COMMIT;