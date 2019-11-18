CREATE TABLE channels (id NUMERIC, 
					name VARCHAR(100), 
					charge NUMERIC(6,2), 
					channel_type NUMERIC, 
					PRIMARY KEY(id));
					
INSERT INTO channels(id, name, charge, channel_type) VALUES (1, 'HBO', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (2, 'Cartoon Network', 15, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (3, 'Comedy Central', 12, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (4, 'National Geographic', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (5, 'Animal Planet', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (6, 'ESPN', 20, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (7, 'STAR Sports', 20, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (8, 'Nickelodeon', 15, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (9, 'BBC', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (10, 'Discovery', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (11, 'Food Network', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (12, 'ABC', 0, 0);
INSERT INTO channels(id, name, charge, channel_type) VALUES (13, 'NBC', 0, 0);
INSERT INTO channels(id, name, charge, channel_type) VALUES (14, 'FOX', 0, 0);
INSERT INTO channels(id, name, charge, channel_type) VALUES (15, 'MTV', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (16, 'BabyTV', 30, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (17, 'Hallmark', 15, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (18, 'History TV', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (19, 'Cooking Channel', 10, 1);
INSERT INTO channels(id, name, charge, channel_type) VALUES (20, 'CBS', 0, 0);

SELECT * FROM channels;