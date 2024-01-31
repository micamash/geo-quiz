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
	('USA Flags'),
	('Countries'),
	('States of USA'),
	('US State Capitals'),
	('Provinces and Territories of Canada'),
	('World Landmarks'),
	('Flags of Canada'),
	('Canada Province and Territory Capitals');

DO $$
DECLARE 
    us_states_topic_id INT;
	ca_stateprov_topic_id INT;
	us_flags_topic_id INT;
	us_capitals_topic_id INT;
	ca_stateprov_caps_topic_id INT;
	
BEGIN

    SELECT topic_id INTO us_states_topic_id FROM topic WHERE topic_name = 'States of USA';

    INSERT INTO question (topic_id, question_text, image_name)
    VALUES
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Alabama.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Alaska.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Arizona.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Arkansas.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/California.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Colorado.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Connecticut.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Delaware.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Florida.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Georgia.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Hawaii.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Idaho.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Illinois.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Indiana.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Iowa.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Kansas.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Kentucky.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Louisiana.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Maine.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Maryland.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Massachusetts.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Michigan.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Minnesota.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Mississippi.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Missouri.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Montana.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Nebraska.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Nevada.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/NewHampshire.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/NewJersey.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/NewMexico.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/NewYork.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/NorthCarolina.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/NorthDakota.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Ohio.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Oklahoma.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Oregon.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Pennsylvania.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/RhodeIsland.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/SouthCarolina.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/SouthDakota.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Tennessee.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Texas.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Utah.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Vermont.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Virginia.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Washington.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/WestVirginia.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Wisconsin.jpg'),
	(us_states_topic_id, 'What state is highlighted?', 'USStateImages/Wyoming.jpg');


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


SELECT topic_id INTO ca_stateprov_topic_id FROM topic WHERE topic_name = 'Provinces and Territories of Canada';

INSERT INTO question (topic_id, question_text, image_name)
VALUES
	(ca_stateprov_topic_id, 'What territory is highlighted?', 'CanadaProvincesAndTerritories/Yukon.jpg'),
	(ca_stateprov_topic_id, 'What territory is highlighted?', 'CanadaProvincesAndTerritories/Nunavut.jpg'),
	(ca_stateprov_topic_id, 'What territory is highlighted?', 'CanadaProvincesAndTerritories/NorthwestTerritories.jpg'),
	(ca_stateprov_topic_id, 'What province is highlighted?', 'CanadaProvincesAndTerritories/Saskatchewan.jpg'),
	(ca_stateprov_topic_id, 'What province is highlighted?', 'CanadaProvincesAndTerritories/Quebec.jpg'),
	(ca_stateprov_topic_id, 'What province is highlighted?', 'CanadaProvincesAndTerritories/PrinceEdwardIsland.jpg'),
	(ca_stateprov_topic_id, 'What province is highlighted?', 'CanadaProvincesAndTerritories/Ontario.jpg'),
	(ca_stateprov_topic_id, 'What province is highlighted?', 'CanadaProvincesAndTerritories/NovaScotia.jpg'),
	(ca_stateprov_topic_id, 'What province is highlighted?', 'CanadaProvincesAndTerritories/NewfoundlandAndLabrador.jpg'),
	(ca_stateprov_topic_id, 'What province is highlighted?', 'CanadaProvincesAndTerritories/NewBrunswick.jpg'),
	(ca_stateprov_topic_id, 'What province is highlighted?', 'CanadaProvincesAndTerritories/Manitoba.jpg'),
	(ca_stateprov_topic_id, 'What province is highlighted?', 'CanadaProvincesAndTerritories/BritishColumbia.jpg'),
	(ca_stateprov_topic_id, 'What province is highlighted?', 'CanadaProvincesAndTerritories/Alberta.jpg');


INSERT INTO answer (question_id, answer_text, is_correct)
VALUES
    (51, 'Northwest Territories', false),
    (51, 'Ontario', false),
    (51, 'Yukon', true),
	(51, 'Saskatchewan', false),

    (52, 'Quebec', false),
    (52, 'Northwest Territories', false),
	(52, 'Nunavut', true),
    (52, 'Yukon', false),

    (53, 'Alberta', false),
	(53, 'Manitoba', false),
    (53, 'British Columbia', false),
    (53, 'Northwest Territories', true),

	(54, 'Saskatchewan', true),
    (54, 'Manitoba', false),
    (54, 'Quebec', false),
	(54, 'Yukon', false),

    (55, 'Newfoundland and Labrador', false),
    (55, 'New Brunswick', false),
	(55, 'Quebec', true),
    (55, 'Manitoba', false),

    (56, 'Nova Scotia', false),
	(56, 'Prince Edward Island', true),
    (56, 'Quebec', false),
    (56, 'Newfoundland and Labrador', false),

	(57, 'Quebec', false),
    (57, 'Ontario', true),
    (57, 'Manitoba', false),
	(57, 'Nunavut', false),

    (58, 'Prince Edward Island', false),
    (58, 'Nova Scotia', true),
	(58, 'Newfoundland and Labrador', false),
    (58, 'Quebec', false),

    (59, 'Saskatchewan', false),
	(59, 'Nova Scotia', false),
    (59, 'Newfoundland and Labrador', true),
    (59, 'New Brunswick', false),

	(60, 'Nova Scotia', false),
	(60, 'Ontario', false),
    (60, 'Prince Edward Island', false),
    (60, 'New Brunswick', true),

	(61, 'Manitoba', true),
	(61, 'Alberta', false),
    (61, 'Ontario', false),
    (61, 'Saskatchewan', false),

	(62, 'Quebec', false),
	(62, 'Alberta', false),
    (62, 'British Columbia', true),
    (62, 'Ontario', false),

	(63, 'Ontario', false),
	(63, 'Alberta', true),
    (63, 'Yukon', false),
    (63, 'British Columbia', false);


SELECT topic_id INTO us_flags_topic_id FROM topic WHERE topic_name = 'USA Flags';

INSERT INTO question (topic_id, question_text, image_name)
VALUES
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Alabama.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Alaska.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/AmericanSamoa.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Arizona.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Arkansas.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/California.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Colorado.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Connecticut.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Delaware.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/DistrictOfColumbia.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Florida.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Georgia.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Guam.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Hawaii.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Idaho.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Illinois.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Indiana.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Iowa.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Kansas.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Kentucky.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Louisiana.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Maine.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Maryland.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Massachusetts.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Michigan.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Minnesota.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Mississippi.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Missouri.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Montana.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Nebraska.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Nevada.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/NewHampshire.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/NewJersey.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/NewMexico.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/NewYork.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/NorthCarolina.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/NorthDakota.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/NorthernMarianaIslands.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Ohio.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Oklahoma.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Oregon.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Pennsylvania.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/PuertoRico.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/RhodeIsland.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/SouthCarolina.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/SouthDakota.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Tennessee.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Texas.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/USVirginIslands.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Utah.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Vermont.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Virginia.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/WashingtonState.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/WestVirginia.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Wisconsin.jpg'),
	(us_flags_topic_id, 'Name the flag:', 'USStateAndTerritoryFlags/Wyoming.jpg');


INSERT INTO answer (question_id, answer_text, is_correct)
VALUES
    (64, 'Alabama', true),
    (64, 'Missouri', false),
    (64, 'Mississippi', false),
	(64, 'Florida', false),

    (65, 'Rhode Island', false),
    (65, 'Indiana', false),
	(65, 'Alaska', true),
    (65, 'Hawaii', false),

    (66, 'Northern Mariana Islands', false),
	(66, 'American Samoa', true),
    (66, 'Puerto Rico', false),
    (66, 'US Virgin Islands', false),

	(67, 'California', false),
    (67, 'Colorado', false),
    (67, 'Arizona', true),
	(67, 'Texas', false),

    (68, 'Arkansas', true),
    (68, 'Gerogia', false),
	(68, 'North Carolina', false),
    (68, 'Alabama', false),

    (69, 'Colorado', false),
	(69, 'California', true),
    (69, 'Arizona', false),
    (69, 'Nevada', false),

	(70, 'District of Columbia', false),
    (70, 'California', false),
    (70, 'Connecticut', false),
	(70, 'Colorado', true),

    (71, 'New York', false),
    (71, 'Delaware', false),
	(71, 'New Jersey', false),
    (71, 'Connecticut', true),

    (72, 'Delaware', true),
	(72, 'Minnesota', false),
    (72, 'District of Columbia', false),
    (72, 'Massachusetts', false),

	(73, 'Ohio', false),
	(73, 'District of Columbia', true),
    (73, 'Tennessee', false),
    (73, 'Hawaii', false),

	(74, 'Georgia', false),
	(74, 'Alabama', false),
    (74, 'Florida', true),
    (74, 'Hawaii', false),

	(75, 'Tennessee', false),
	(75, 'Georgia', true),
    (75, 'Mississippi', false),
    (75, 'North Carolina', false),

	(76, 'Puerto Rico', false),
	(76, 'Guam', true),
    (76, 'US Virgin Islands', false),
    (76, 'Northern Mariana Islands', false),

	(77, 'Guam', false),
	(77, 'Louisiana', false),
    (77, 'Hawaii', true),
    (77, 'Northern Mariana Islands', false),

	(78, 'New Hampshire', false),
	(78, 'Montana', false),
    (78, 'Idaho', true),
    (78, 'Nebraska', false),

	(79, 'West Virginia', false),
	(79, 'Illinois', true),
    (79, 'Massachusetts', false),
    (79, 'Rhode Island', false),

	(80, 'Vermont', false),
	(80, 'Oregon', false),
    (80, 'Alaska', false),
    (80, 'Indiana', true),

	(81, 'Texas', false),
	(81, 'Georgia', false),
    (81, 'North Carolina', false),
    (81, 'Iowa', true),

	(82, 'Kentucky', false),
	(82, 'Kansas', true),
    (82, 'Nebraska', false),
    (82, 'Colorado', false),

	(83, 'Kentucky', true),
	(83, 'North Dakota', false),
    (83, 'Vermont', false),
    (83, 'West Virginia', false),

	(84, 'Hawaii', false),
	(84, 'Florida', false),
    (84, 'Louisiana', true),
    (84, 'South Carolina', false),

	(85, 'Vermont', false),
	(85, 'Michigan', false),
    (85, 'Pennsylvania', false),
    (85, 'Maine', true),

	(86, 'Maryland', true),
	(86, 'Massachusetts', false),
    (86, 'Arizona', false),
    (86, 'South Dakota', false),

	(87, 'New York', false),
	(87, 'New Hampshire', false),
    (87, 'Massachusetts', true),
    (87, 'Connecticut', false),

	(88, 'Vermont', false),
	(88, 'Michigan', true),
    (88, 'Iowa', false),
    (88, 'Pennsylvania', false),

	(89, 'Minnesota', true),
	(89, 'South Dakota', false),
    (89, 'Oklahoma', false),
    (89, 'Kansas', false),

	(90, 'Mississippi', true),
	(90, 'North Carolina', false),
    (90, 'Tennessee', false),
    (90, 'Missouri', false),

	(91, 'Utah', false),
	(91, 'North Carolina', false),
    (91, 'Texas', false),
    (91, 'Missouri', true),

	(92, 'Montana', true),
	(92, 'Wyoming', false),
    (92, 'Oregon', false),
    (92, 'Washington', false),

	(93, 'Kansas', false),
	(93, 'Nebraska', true),
    (93, 'Minnesota', false),
    (93, 'Alaska', false),

	(94, 'Virginia', false),
	(94, 'Wisconsin', false),
    (94, 'Utah', false),
    (94, 'Nevada', true),

	(95, 'Delaware', false),
	(95, 'New Hampshire', true),
    (95, 'Maryland', false),
    (95, 'Maine', false),

	(96, 'Pennsylvania', false),
	(96, 'New York', false),
    (96, 'New Jersey', true),
    (96, 'Vermont', false),

	(97, 'Nevada', false),
	(97, 'Utah', false),
    (97, 'Arizona', false),
    (97, 'New Mexico', true),

	(98, 'New York', true),
	(98, 'New Jersey', false),
    (98, 'Connecticut', false),
    (98, 'Massachusetts', false),

	(99, 'West Virginia', false),
	(99, 'South Carolina', false),
    (99, 'Georgia', false),
    (99, 'North Carolina', true),

	(100, 'Utah', false),
	(100, 'South Dakota', false),
    (100, 'North Dakota', true),
    (100, 'Wisconsin', false),

	(101, 'Guam', false),
	(101, 'US Virgin Islands', false),
    (101, 'Northern Mariana Islands', true),
    (101, 'Puerto Rico', false),

	(102, 'Georgia', false),
	(102, 'Virginia', false),
    (102, 'Tennessee', false),
    (102, 'Ohio', true),

	(103, 'Oklahoma', true),
	(103, 'Arizona', false),
    (103, 'New Mexico', false),
    (103, 'Texas', false),

	(104, 'Nevada', false),
	(104, 'Washington', false),
    (104, 'Oregon', true),
    (104, 'Utah', false),

	(105, 'Michigan', false),
	(105, 'Delaware', false),
    (105, 'Maine', false),
    (105, 'Pennsylvania', true),

	(106, 'Ohio', false),
	(106, 'Texas', false),
    (106, 'Puerto Rico', true),
    (106, 'Hawaii', false),

	(107, 'Rhode Island', true),
	(107, 'US Virgin Islands', false),
    (107, 'Hawaii', false),
    (107, 'Northern Mariana Islands', false),

	(108, 'Guam', false),
	(108, 'Hawaii', false),
    (108, 'Rhode Island', false),
    (108, 'South Carolina', true),

	(109, 'South Dakota', true),
	(109, 'North Dakota', false),
    (109, 'North Carolina', false),
    (109, 'New Hampshire', false),

	(110, 'North Carolina', false),
	(110, 'Texas', false),
    (110, 'Tennessee', true),
    (110, 'Mississippi', false),

	(111, 'Iowa', false),
	(111, 'Puerto Rico', false),
    (111, 'Texas', true),
    (111, 'Tennessee', false),

	(112, 'District of Columbia', false),
	(112, 'Puerto Rico', false),
    (112, 'Northern Mariana Islands', false),
    (112, 'US Virgin Islands', true),

	(113, 'Minnesota', false),
	(113, 'Nevada', false),
    (113, 'Illinois', false),
    (113, 'Utah', true),

	(114, 'Maine', false),
	(114, 'New Hampshire', false),
    (114, 'Vermont', true),
    (114, 'Maryland', false),

	(115, 'Virginia', true),
	(115, 'West Virginia', false),
    (115, 'Kentucky', false),
    (115, 'Indiana', false),

	(116, 'Utah', false),
	(116, 'California', false),
    (116, 'Oregon', false),
    (116, 'Washington', true),

	(117, 'Virginia', false),
	(117, 'West Virginia', true),
    (117, 'Kentucky', false),
    (117, 'South Carolina', false),

	(118, 'North Dakota', false),
	(118, 'Michigan', false),
    (118, 'Wisconsin', true),
    (118, 'Montana', false),

	(119, 'Wyoming', true),
	(119, 'Montana', false),
    (119, 'Kansas', false),
    (119, 'Colorado', false);


SELECT topic_id INTO us_capitals_topic_id FROM topic WHERE topic_name = 'US State Capitals';

INSERT INTO question (topic_id, question_text, image_name)
    VALUES
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/MontgomeryAlabama.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/JuneauAlaska.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/PhoenixArizona.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/LittleRockArkansas.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/SacramentoCalifornia.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/DenverColorado.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/HartfordConnecticut.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/DoverDelaware.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/TallahasseeFlorida.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/AtlantaGeorgia.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/HonoluluHawaii.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/BoiseIdaho.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/SpringfieldIllinois.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/IndianapolisIndiana.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/DesMoinesIowa.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/TopekaKansas.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/FrankfortKentucky.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/BatonRougeLouisiana.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/AugustaMaine.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/AnnapolisMaryland.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/BostonMassachusetts.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/LansingMichigan.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/SaintPaulMinnesota.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/JacksonMississippi.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/JeffersonCityMissouri.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/HelenaMontana.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/LincolnNebraska.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/CarsonCityNevada.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/ConcordNewHampshire.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/TrentonNewJersey.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/SantaFeNewMexico.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/AlbanyNewYork.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/RaleighNorthCarolina.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/BismarckNorthDakota.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/ColumbusOhio.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/OklahomaCityOklahoma.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/SalemOregon.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/HarrisburgPennsylvania.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/ProvidenceRhodeIsland.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/ColumbiaSouthCarolina.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/PierreSouthDakota.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/NashvilleTennessee.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/AustinTexas.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/SaltLakeCityUtah.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/MontpelierVermont.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/RichmondVirginia.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/OlympiaWashington.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/CharlestonWestVirginia.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/MadisonWisconsin.jpg'),
	(us_capitals_topic_id, 'Name the capital:', 'USCapitalsImages/CheyenneWyoming.jpg');


INSERT INTO answer (question_id, answer_text, is_correct)
VALUES
    (120, 'Jackson', false),
    (120, 'Montgomery', true),
    (120, 'Mobile', false),
	(120, 'Birmingham', false),

    (121, 'Anchorage', false),
    (121, 'Trenton', false),
	(121, 'Juneau', true),
    (121, 'Bismarck', false),

    (122, 'Phoenix', true),
	(122, 'Santa Fe', false),
    (122, 'Tucson', false),
    (122, 'Mesa', false),

	(123, 'Hot Springs', false),
    (123, 'Fayetteville', false),
    (123, 'Little Rock', true),
	(123, 'Bentonville', false),

    (124, 'Los Angeles', false),
    (124, 'Fresno', false),
	(124, 'San Francisco', false),
    (124, 'Sacramento', true),

    (125, 'Denver', true),
	(125, 'Colorado Springs', false),
    (125, 'Boulder', false),
    (125, 'Fort Collins', false),

	(126, 'Springfield', false),
    (126, 'Providence', false),
    (126, 'New Haven', false),
	(126, 'Hartford', true),

    (127, 'Milford', false),
    (127, 'Dover', true),
	(127, 'Millsboro', false),
    (127, 'Wilmington', false),

    (128, 'Jacksonville', false),
	(128, 'Orlando', false),
    (128, 'Tallahassee', true),
    (128, 'Miami', false),

	(129, 'Columbia', false),
	(129, 'Savannah', false),
    (129, 'Atlanta', true),
    (129, 'Montgomery', false),

	(130, 'Kahului', false),
	(130, 'Hilo', false),
    (130, 'Kailua', false),
    (130, 'Honolulu', true),

	(131, 'Cheyenne', false),
	(131, 'Frankfort', false),
    (131, 'Boise', true),
    (131, 'Idaho Falls', false),

	(132, 'Chicago', false),
	(132, 'Springfield', true),
    (132, 'Peoria', false),
    (132, 'Rockford', false),

	(133, 'Indianapolis', true),
	(133, 'Fort Wayne', false),
    (133, 'Louisville', false),
    (133, 'Springfield', false),

	(134, 'Cedar Rapids', false),
	(134, 'Helena', false),
    (134, 'Bismarck', false),
    (134, 'Des Moines', true),

	(135, 'Des Moines', false),
	(135, 'Topeka', true),
    (135, 'Bismarck', false),
    (135, 'Cheyenne', false),

	(136, 'Richmond', false),
	(136, 'Lexington', false),
    (136, 'Frankfort', true),
    (136, 'Louisville', false),

	(137, 'Shreveport', false),
	(137, 'Baton Rouge', true),
    (137, 'New Orleans', false),
    (137, 'Mobile', false),

	(138, 'Bangor', false),
	(138, 'Montpelier', false),
    (138, 'Annapolis', false),
    (138, 'Augusta', true),

	(139, 'Annapolis', true),
	(139, 'Baltimore', false),
    (139, 'Washington', false),
    (139, 'Lansing', false),

	(140, 'Newport', false),
	(140, 'Providence', false),
    (140, 'Worcester', false),
    (140, 'Boston', true),

	(141, 'Detroit', false),
	(141, 'Lansing', true),
    (141, 'Pierre', false),
    (141, 'Grand Rapids', false),

	(142, 'Saint Paul', true),
	(142, 'Pierre', false),
    (142, 'Minneapolis', false),
    (142, 'Madison', false),

	(143, 'Hattiesburg', false),
	(143, 'Mobile', false),
    (143, 'Jackson', true),
    (143, 'Biloxi', false),

	(144, 'Columbia', false),
	(144, 'Springfield', false),
    (144, 'Saint Louis', false),
    (144, 'Jefferson City', true),

	(145, 'Helena', true),
	(145, 'Bismarck', false),
    (145, 'Billings', false),
    (145, 'Sioux Falls', false),

	(146, 'Des Moines', false),
	(146, 'Omaha', false),
    (146, 'Cedar Rapids', false),
    (146, 'Lincoln', true),

	(147, 'Las Vegas', false),
	(147, 'Sacramento', false),
    (147, 'Reno', false),
    (147, 'Carson City', true),

	(148, 'Portsmouth', false),
	(148, 'Manchester', false),
    (148, 'Concord', true),
    (148, 'Nashua', false),

	(149, 'Harrisburg', false),
	(149, 'Allentown', false),
    (149, 'Atlantic City', false),
    (149, 'Trenton', true),

	(150, 'Phoenix', false),
	(150, 'Roswell', false),
    (150, 'Albuquerque', false),
    (150, 'Santa Fe', true),

	(151, 'New York', false),
	(151, 'Albany', true),
    (151, 'Syracuse', false),
    (151, 'Buffalo', false),

	(152, 'Richmond', false),
	(152, 'Raleigh', true),
    (152, 'Columbia', false),
    (152, 'Charlotte', false),

	(153, 'Fargo', false),
	(153, 'Helena', false),
    (153, 'Bismarck', true),
    (153, 'Sioux Falls', false),

	(154, 'Columbus', true),
	(154, 'Cleveland', false),
    (154, 'Cincinnati', false),
    (154, 'Toledo', false),

	(155, 'Conway', false),
	(155, 'Wichita', false),
    (155, 'Tulsa', false),
    (155, 'Oklahoma City', true),

	(156, 'Portland', false),
	(156, 'Salem', true),
    (156, 'Eugene', false),
    (156, 'Bend', false),

	(157, 'Erie', false),
	(157, 'Philadelphia', false),
    (157, 'Pittsburgh', false),
    (157, 'Harrisburg', true),

	(158, 'Newport', false),
	(158, 'Providence', true),
    (158, 'Hartford', false),
    (158, 'Concord', false),

	(159, 'Savannah', false),
	(159, 'Raleigh', false),
    (159, 'Columbus', false),
    (159, 'Columbia', true),

	(160, 'Pierre', true),
	(160, 'Helena', false),
    (160, 'Sioux Falls', false),
    (160, 'Lincoln', false),

	(161, 'Chattanooga', false),
	(161, 'Knoxville', false),
    (161, 'Memphis', false),
    (161, 'Nashville', true),

	(162, 'Dallas', false),
	(162, 'Austin', true),
    (162, 'Houston', false),
    (162, 'San Antonio', false),

	(163, 'Salt Lake City', true),
	(163, 'Provo', false),
    (163, 'Cheyenne', false),
    (163, 'Pierre', false),

	(164, 'Concord', false),
	(164, 'Burlington', false),
    (164, 'Montpelier', true),
    (164, 'Newport', false),

	(165, 'Richmond', true),
	(165, 'Norfolk', false),
    (165, 'Virginia Beach', false),
    (165, 'Raleigh', false),


	(166, 'Tacoma', false),
	(166, 'Spokane', false),
    (166, 'Seattle', false),
    (166, 'Olympia', true),

	(167, 'Charleston', true),
	(167, 'Richmond', false),
    (167, 'Charlotte', false),
    (167, 'Columbia', false),

	(168, 'Madison', true),
	(168, 'Milwaukee', false),
    (168, 'Green Bay', false),
    (168, 'Rockford', false),

	(169, 'Helena', false),
	(169, 'Casper', false),
    (169, 'Cheyenne', true),
    (169, 'Billings', false);

SELECT topic_id INTO ca_stateprov_caps_topic_id FROM topic WHERE topic_name = 'Canada Province and Territory Capitals';

INSERT INTO question (topic_id, question_text, image_name)
VALUES
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/WhitehorseYukon.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/IqualuitNunavut.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/YellowknifeNorthwestTerritories.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/ReginaSaskatchewan.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/QuebecCityQuebec.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/CharlottetownPrinceEdwardIsland.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/TorontoOntario.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/HalifaxNovaScotia.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/StJohnsNewfoundlandAndLabrador.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/FrederictonNewBrunswick.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/WinnipegManitoba.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/VictoriaBritishColumbia.jpg'),
	(ca_stateprov_caps_topic_id, 'Name the capital:', 'CanadaCapitalsImages/EdmontonAlberta.jpg');


INSERT INTO answer (question_id, answer_text, is_correct)
VALUES
    (170, 'Yellowknife', false),
    (170, 'Toronto', false),
    (170, 'Whitehorse', true),
	(170, 'Regina', false),

    (171, 'Quebec City', false),
    (171, 'Yellowknife', false),
	(171, 'Iqualuit', true),
    (171, 'Whitehorse', false),

    (172, 'Edmonton', false),
	(172, 'Winnipeg', false),
    (172, 'Victoria', false),
    (172, 'Yellowknife', true),

	(173, 'Regina', true),
    (173, 'Winnipeg', false),
    (173, 'Quebec City', false),
	(173, 'Whitehorse', false),

    (174, 'St. John''s', false),
    (174, 'Fredericton', false),
	(174, 'Quebec City', true),
    (174, 'Winnipeg', false),

    (175, 'Halifax', false),
	(175, 'Charlottetown', true),
    (175, 'Quebec City', false),
    (175, 'St. John''s', false),

	(176, 'Quebec City', false),
    (176, 'Toronto', true),
    (176, 'Winnipeg', false),
	(176, 'Iqualuit', false),

    (177, 'Charlottetown', false),
    (177, 'Halifax', true),
	(177, 'St. John''s', false),
    (177, 'Quebec City', false),

    (178, 'Regina', false),
	(178, 'Halifax', false),
    (178, 'St. John''s', true),
    (178, 'Fredericton', false),

	(179, 'Halifax', false),
	(179, 'Toronto', false),
    (179, 'Charlottetown', false),
    (179, 'Fredericton', true),

	(180, 'Winnipeg', true),
	(180, 'Edmonton', false),
    (180, 'Toronto', false),
    (180, 'Regina', false),

	(181, 'Quebec City', false),
	(181, 'Edmonton', false),
    (181, 'Victoria', true),
    (181, 'Toronto', false),

	(182, 'Toronto', false),
	(182, 'Edmonton', true),
    (182, 'Whitehorse', false),
    (182, 'Victoria', false);
	
END $$;

COMMIT;