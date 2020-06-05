DELETE from user_role;
DELETE from usr;

INSERT INTO usr(id, active, password, username) VALUES
(1, true, '$2a$08$ELhrY3AF7Llo5MwyckybEOmj.RU.cy1Vx0RGDuauMlJKpx2p5Xbty', 'admin'),
(2, true, '$2a$08$YrZM9dUueAhBbakDWc7GSeD7Hud.x/mMDoJ/M5OWFGzPVhIvzqBMK', 'user1');

INSERT INTO user_role(user_id, roles) VALUES
(1, 'USER'), (1, 'ADMIN'),
(2, 'USER');