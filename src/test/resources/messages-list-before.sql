DELETE from message;

INSERT INTO message(id, text, tag, user_id) VALUES
(1, 'first', 'my-tag' , 1),
(2, 'second', 'more' , 1),
(3, 'third', 'my-tag' , 1),
(4, 'fourth', 'another' , 1);

alter sequence hibernate_sequence restart with 10;