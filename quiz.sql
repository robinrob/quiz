drop table questions;

CREATE TABLE questions (
	id 				serial PRIMARY KEY,
    question        varchar(100) UNIQUE NOT NULL,
    answer		    varchar(100) NOT NULL,
    marked          boolean NOT NULL DEFAULT FALSE,
    score		    integer NOT NULL DEFAULT 0
);

insert into questions