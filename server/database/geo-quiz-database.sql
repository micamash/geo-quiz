BEGIN TRANSACTION;

DROP TABLE IF EXISTS answer;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS topic;


CREATE TABLE topic (
	topic_id serial,
	topic_name varchar(200) NOT NULL,
	CONSTRAINT PK_topic PRIMARY KEY(topic_id)
);

CREATE TABLE question (
	question_id serial,
	topic_id int,
	question_text varchar(500),
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

INSERT INTO topic (topic_name) VALUES
	('US State Flags'),
	('Countries'),
	('States of USA'),
	('US State Capitals'),
	('Provinces of Canada'),
	('World Landmarks');

DO $$
DECLARE 
    v_topic_id INT;
BEGIN
    SELECT topic_id INTO v_topic_id FROM topic WHERE topic_name = 'States of USA';

    INSERT INTO question (topic_id, question_text, image_name)
    VALUES
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Alabama.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Alaska.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Arizona.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Arkansas.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/California.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Colorado.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Connecticut.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Delaware.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Florida.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Georgia.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Hawaii.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Idaho.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Illinois.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Indiana.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Iowa.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Kansas.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Kentucky.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Louisiana.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Maine.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Maryland.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Massachusetts.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Michigan.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Minnesota.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Mississippi.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Missouri.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Montana.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Nebraska.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Nevada.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/NewHampshire.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/NewJersey.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/NewMexico.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/NewYork.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/NorthCarolina.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/NorthDakota.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Ohio.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Oklahoma.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Oregon.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Pennsylvania.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/RhodeIsland.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/SouthCarolina.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/SouthDakota.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Tennessee.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Texas.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Utah.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Vermont.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Virginia.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Washington.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/WestVirginia.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Wisconsin.jpg'),
	(v_topic_id, 'What state is highlighted?', 'USStateImages/Wyoming.jpg');


INSERT INTO answer (question_id, answer_text, is_correct)
VALUES
    (1, 'Mississippi', false),
    (1, 'Alabama', true),
    (1, 'Arizona', false),
	(1, 'Kentucky', false),

    (2, 'Hawaii', false),
    (2, 'Texas', false),
	(2, 'Alaska', true),
    (2, 'Alabama', false),

    (3, 'Arizona', true),
	(3, 'New Mexico', false),
    (3, 'Georgia', false),
    (3, 'Utah', false),

	(4, 'Wyoming', false),
    (4, 'Missouri', false),
    (4, 'Arkansas', true),
	(4, 'Illinois', false),

    (5, 'South Dakota', false),
    (5, 'Nevada', false),
	(5, 'Florida', false),
    (5, 'California', true),

    (6, 'Colorado', true),
	(6, 'Wyoming', false),
    (6, 'Kansas', false),
    (6, 'New Mexico', false),

	(7, 'Maine', false),
    (7, 'Pennsylvania', false),
    (7, 'Maryland', false),
	(7, 'Connecticut', true),

    (8, 'Massachusetts', false),
    (8, 'Delaware', true),
	(8, 'Virginia', false),
    (8, 'Rhode Island', false),

    (9, 'South Carolina', false),
	(9, 'Alabama', false),
    (9, 'Florida', true),
    (9, 'California', false),

	(10, 'Louisiana', false),
	(10, 'Mississippi', false),
    (10, 'Georgia', true),
    (10, 'Indiana', false),

	(11, 'California', false),
	(11, 'Alaska', false),
    (11, 'Arizona', false),
    (11, 'Hawaii', true),

	(12, 'Nebraska', false),
	(12, 'Montana', false),
    (12, 'Idaho', true),
    (12, 'North Dakota', false),

	(13, 'New Mexico', false),
	(13, 'Illinois', true),
    (13, 'Wisconsin', false),
    (13, 'Michigan', false),

	(14, 'Indiana', true),
	(14, 'Illinois', false),
    (14, 'New Jersey', false),
    (14, 'Iowa', false),

	(15, 'West Virginia', false),
	(15, 'Oklahoma', false),
    (15, 'North Carolina', false),
    (15, 'Iowa', true),

	(16, 'Colorado', false),
	(16, 'Kansas', true),
    (16, 'Missouri', false),
    (16, 'Nebraska', false),

	(17, 'Alabama', false),
	(17, 'West Virginia', false),
    (17, 'Kentucky', true),
    (17, 'Virginia', false),

	(18, 'Washington', false),
	(18, 'Louisiana', true),
    (18, 'Missouri', false),
    (18, 'Maine', false),

	(19, 'Vermont', false),
	(19, 'Rhode Island', false),
    (19, 'Massachusetts', false),
    (19, 'Maine', true),

	(20, 'Maryland', true),
	(20, 'Delaware', false),
    (20, 'New York', false),
    (20, 'Ohio', false),

	(21, 'New Hampshire', false),
	(21, 'Maine', false),
    (21, 'Vermont', false),
    (21, 'Massachusetts', true),

	(22, 'Iowa', false),
	(22, 'Michigan', true),
    (22, 'Wisconsin', false),
    (22, 'Ohio', false),

	(23, 'Minnesota', true),
	(23, 'North Dakota', false),
    (23, 'Montana', false),
    (23, 'Wyoming', false),

	(24, 'Arkansas', false),
	(24, 'Louisiana', false),
    (24, 'Mississippi', true),
    (24, 'Alabama', false),

	(25, 'Iowa', false),
	(25, 'Illinois', false),
    (25, 'Alabama', false),
    (25, 'Missouri', true),

	(26, 'Montana', true),
	(26, 'Washington', false),
    (26, 'Idaho', false),
    (26, 'North Dakota', false),

	(27, 'Kansas', false),
	(27, 'Iowa', false),
    (27, 'Missouri', false),
    (27, 'Nebraska', true),

	(28, 'Arizona', false),
	(28, 'California', false),
    (28, 'Utah', false),
    (28, 'Nevada', true),

	(29, 'Maine', false),
	(29, 'Vermont', false),
    (29, 'New Hampshire', true),
    (29, 'New Jersey', false),

	(30, 'Connecticut', false),
	(30, 'Maryland', false),
    (30, 'Rhode Island', false),
    (30, 'New Jersey', true),

	(31, 'Kansas', false),
	(31, 'Colorado', false),
    (31, 'Arizona', false),
    (31, 'New Mexico', true),

	(32, 'Maine', false),
	(32, 'New York', true),
    (32, 'Pennsylvania', false),
    (32, 'New Jersey', false),

	(33, 'South Carolina', false),
	(33, 'North Carolina', true),
    (33, 'Georgia', false),
    (33, 'Tennessee', false),

	(34, 'South Dakota', false),
	(34, 'Montana', false),
    (34, 'North Dakota', true),
    (34, 'Minnesota', false),

	(35, 'Ohio', true),
	(35, 'Michigan', false),
    (35, 'West Virginia', false),
    (35, 'Indiana', false),

	(36, 'New Mexico', false),
	(36, 'Kansas', false),
    (36, 'Arkansas', false),
    (36, 'Oklahoma', true),

	(37, 'Washington', false),
	(37, 'Oregon', true),
    (37, 'Nevada', false),
    (37, 'Utah', false),

	(38, 'Ohio', false),
	(38, 'Maryland', false),
    (38, 'New York', false),
    (38, 'Pennsylvania', true),

	(39, 'New Jersey', false),
	(39, 'Rhode Island', true),
    (39, 'Connecticut', false),
    (39, 'New Hampshire', false),

	(40, 'Alabama', false),
	(40, 'Georgia', false),
    (40, 'South Dakota', false),
    (40, 'South Carolina', true),

	(41, 'South Dakota', true),
	(41, 'South Carolina', false),
    (41, 'North Dakota', false),
    (41, 'Minnesota', false),

	(42, 'Arkansas', false),
	(42, 'Kentucky', false),
    (42, 'Alabama', false),
    (42, 'Tennessee', true),

	(43, 'Missouri', false),
	(43, 'Texas', true),
    (43, 'Alaska', false),
    (43, 'Minnesota', false),

	(44, 'Utah', true),
	(44, 'Oregon', false),
    (44, 'Colorado', false),
    (44, 'Wyoming', false),

	(45, 'Massachusetts', false),
	(45, 'New Hampshire', false),
    (45, 'Vermont', true),
    (45, 'New York', false),

	(46, 'Virginia', true),
	(46, 'Michigan', false),
    (46, 'West Virginia', false),
    (46, 'North Carolina', false),


	(47, 'Nevada', false),
	(47, 'Idaho', false),
    (47, 'Oregon', false),
    (47, 'Washington', true),

	(48, 'West Virginia', true),
	(48, 'North Carolina', false),
    (48, 'Virginia', false),
    (48, 'South Carolina', false),

	(49, 'Wisconsin', true),
	(49, 'Michigan', false),
    (49, 'Minnesota', false),
    (49, 'Ohio', false),

	(50, 'South Dakota', false),
	(50, 'Colorado', false),
    (50, 'Wyoming', true),
    (50, 'Montana', false);
	

END $$;

COMMIT;