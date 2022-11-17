-- 1
create database lab5;

-- 2
create table Warehouses(
    code int,
    location varchar(255),
    capacity int,
    primary key(code)
);
create table Boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouses int,
    foreign key (warehouses) references Warehouses(code)
);

-- 3
INSERT INTO Warehouses(code, location, capacity) VALUES(1, 'Chicago', 3);
INSERT INTO Warehouses(code, location, capacity) VALUES(2, 'Rocks', 4);
INSERT INTO Warehouses(code, location, capacity) VALUES(3, 'New York', 7);
INSERT INTO Warehouses(code, location, capacity) VALUES(4, 'Los Angeles', 2);
INSERT INTO Warehouses(code, location, capacity) VALUES(5, 'San Francisco', 8);

INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('0MN7', 'Rocks', 180, 3);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('4H8P', 'Rocks', 250, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('4RT3', 'Scissors', 190, 4);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('7G3H', 'Rocks', 200, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('8JN6', 'Papers', 75, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('8Y6U', 'Papers', 50, 3);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('9J6F', 'Papers', 175, 2);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('LL08', 'Rocks', 140, 4);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('P0H6', 'Scissors', 125, 1);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('P2T6', 'Scissors', 150, 2);
INSERT INTO Boxes(code, contents, value, warehouses) VALUES ('TUSS', 'Papers', 90, 5);

-- 4
select warehouses from Boxes;

-- 5
select * from Boxes
where value > 150;

--6
select distinct contents from boxes;

-- 7
select Boxes.code, Boxes.contents, Warehouses.location, Warehouses.capacity from Boxes, Warehouses
where Boxes.warehouses = Warehouses.code;

-- 8
select Boxes.code, Boxes.contents, Warehouses.location, Warehouses.capacity from Boxes, Warehouses
where Boxes.warehouses = Warehouses.code and Warehouses.capacity > 2;

-- 9
insert into Warehouses(code, location, capacity) values (6, 'New York', 3);

-- 10
insert into Boxes(code, contents, value, warehouses) values ('H5RT', 'Papers', 200, 2);

-- 11
select (value + value * 15/100) as value from Boxes
order by value DESC
limit 1 offset 2;

-- 12
delete from Boxes
where value < 150;

-- 13
delete from Warehouses where location = 'New York'
returning *;
