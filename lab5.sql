create database lab4;

create table Warehouses
(
    code     integer,
    location varchar(255),
    capacity integer,
    primary key (code)
);

create table Boxes
(
    code       char(4),
    contents   varchar(255),
    value      real,
    warehouses integer,
    foreign key (warehouses) references warehouses (code)
);

INSERT INTO Warehouses(code, location, capacity) VALUES (1, 'Chicago', 3);
INSERT INTO Warehouses(code, location, capacity) VALUES (2, 'Rocks', 4);
INSERT INTO Warehouses(code, location, capacity)
VALUES (3, 'New York', 7);
INSERT INTO Warehouses(code, location, capacity)
VALUES (4, 'Los Angeles', 2);
INSERT INTO Warehouses(code, location, capacity)
VALUES (5, 'San Francisko', 8);

INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('0MN7', 'Rocks', 180, 3);
INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('4H8P', 'Rocks', 250, 1);
INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('4RT3', 'Scissors', 190, 4);
INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('7G3H', 'Rocks', 200, 1);
INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('8JN6', 'Papers', 75, 1);
INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('8Y6U', 'Papers', 50, 3);
INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('9J6F', 'Papers', 175, 2);
INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('LL08', 'Rocks', 140, 4);
INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('P0H6', 'Scissors', 125, 1);
INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('P2T6', 'Scissors', 150, 2);
INSERT INTO Boxes(code, contents, value, warehouses)
VALUES ('TUSS', 'Papers', 90, 5);


select *
from warehouses;

select *
from boxes
where value > 150;

select distinct contents
from boxes;

select warehouses, count(*)
from boxes
group by warehouses;

select warehouses, count(*)
from boxes
group by warehouses
having count(*) > 2;

insert into warehouses(code, location, capacity)
values (6, 'New York', 3);

insert into boxes(code, contents, value, warehouses)
values ('H5RT', 'Papers', 200, 2);

update boxes
set value = value - value * 0.15
where value = (select distinct value from boxes order by value desc limit 1 offset 2);

delete
from boxes
where value < 150;

delete
from boxes
where warehouses in (select code from warehouses where location = 'New York')
returning *;