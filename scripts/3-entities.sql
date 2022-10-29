-- insert stuff to put data

-- users
INSERT INTO user VALUES('00001', 0, SHA2('password', 256));
INSERT INTO user VALUES('00003', 0, SHA2('wenomechainsama', 256));
INSERT INTO user VALUES('00012', 0, SHA2('tumajarbisaun', 256));
INSERT INTO user VALUES('00053', 0, SHA2('wifelinlooof', 256));

INSERT INTO user VALUES('10001', 1, SHA2('password', 256));
INSERT INTO user VALUES('10013', 1, SHA2('alanturing', 256));

INSERT INTO user VALUES('20001', 2, SHA2('password', 256));
INSERT INTO user VALUES('20012', 2, SHA2('quemedirias', 256));

INSERT INTO user VALUES('30001', 3, SHA2('password', 256));
INSERT INTO user VALUES('30013', 3, SHA2('mepregunto', 256));

-- main entities (id, name, place, phno)
INSERT INTO supplier VALUES('00001', "Narayan Enterprises", "Dharwad", 9876543210);
INSERT INTO supplier VALUES('00003', "WTWE Ltd.", "Bengaluru", 9654988221);
INSERT INTO supplier VALUES('00012', "Devdatt & Co.", "Mangaluru", 9800897867);
INSERT INTO supplier VALUES('00053', "ADT Products", "Pune", 9563535273);

INSERT INTO distributor VALUES('10001', "Kalyani Distributors", "Hubli", 9123015982);
INSERT INTO distributor VALUES('10013', "Doraemon Wholesalers", "Dhanbad", 8978575632);

INSERT INTO retailer VALUES('20001', "SDB Retailers", "Solapur", 9867001639);
INSERT INTO retailer VALUES('20012', "BBC Stores", "Kurnool", 9672528033);

INSERT INTO customer VALUES('30001', "Nirmit", "Panipat", 9868978575);
INSERT INTO customer VALUES('30013', "Chiru", "Belagavi", 9230273920);

-- (id, name, rate, features)
INSERT INTO product VALUES('50001', 'Notebook', 23.02, 'many pages');
INSERT INTO product VALUES('50002', 'Metal Scrap', 543.23, 'assorted metal');
INSERT INTO product VALUES('50003', 'Water Bottle', 119.99, 'stay hydrated');
INSERT INTO product VALUES('50004', 'Lego Building Set', 2500.01, 'b r i c c');
INSERT INTO product VALUES('50005', 'Plane Figurine', 534.05, 'as shown on tv');
INSERT INTO product VALUES('50006', 'Lab Manual', 100.00, 'many pages');
INSERT INTO product VALUES('50007', 'Laptop', 70023.24, 'with touchscreen');
INSERT INTO product VALUES('50008', 'Chocolate Coins', 323.24, 'golden');
INSERT INTO product VALUES('50009', 'YouTuber Merch', 8342.23, 'free copypasta');
INSERT INTO product VALUES('50010', 'WTWE Goodies', 32.12, 'me pregunto que me dirias');

