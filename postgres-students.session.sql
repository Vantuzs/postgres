DROP TABLE users;

CREATE TABLE users(
    first_name VARCHAR(64) NOT NULL CONSTRAINT first_name_not_empty CHECK (first_name !=''),
    last_name VARCHAR(64) NOT NULL CONSTRAINT last_name_not_empty CHECK (last_name !=''),
    email varchar(64) NOT NULL CONSTRAINT email_not_empty CHECK (email !='') UNIQUE,
    gender VARCHAR(30) NOT NULL CONSTRAINT gender_not_empty CHECK ( gender !=''),
    is_subscribe boolean NOT NULL,
    birhday date CONSTRAINT birhday_current_date CHECK(birhday <= current_date),
    foot_size smallint,
    height numeric(5,2) CONSTRAINT too_high_user CHECK(height <2.4)
);

DROP TABLE users;


INSERT INTO users VALUES
('Suzan','Doe','qwes@ewqe.rews','Female',true,'2003.07.12',40,1.70),
('Henry','Doe','sadsaw@dsawwww.com','Male',false,'2002.01.25',45,1.90),
('Draco','Doe','sadsaw@dsaewqwwww.com','Male',false,'2002.01.25',45,2.3);

INSERT INTO users VALUES
('Peter','Parcker','qwes@ewqe.redsadsadsaws','Female',true,'2025.02.19',40,1.70);

-- CONSTRAINT 