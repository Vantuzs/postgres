DROP TABLE users;

CREATE TABLE users(
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    biography text,
    gender VARCHAR(30),
    is_subscribe boolean,
    birhday date,
    foot_size smallint,
    height numeric(5,2)
);

INSERT INTO users VALUES
('John','Doe','Tyt och mnogo texta OCH OCH OCH OCH OCH OCH OCH MNOGO','Male',true,'2003.04.25',43,1.80);

INSERT INTO users VALUES
('Suzan','Doe','Tyt och mnogo texta OCH OCH OCH OCH OCH OCH OCH MNOGO','Female',true,'2003.07.12',40,1.70),
('Henry','Doe','Tyt och mnogo texta OCH OCH OCH OCH OCH OCH OCH MNOGO','Male',false,'2002.01.25',45,1.90);



INSERT INTO users VALUES('Blacke','Doe','Tyt och mnogo texta OCH OCH OCH OCH OCH OCH OCH MNOGO','Male',false,'2003.04.25',Null,null);