USE DATABASE supplychainDB;

CREATE TABLE user(
    user_id INT NOT NULL,
    user_type INT NOT NULL CHECK(user_type>=0 AND user_type<=3), --chk constr
    pass VARCHAR(64), -- hash and store
    PRIMARY KEY(user_id, user_type)
)
CREATE TABLE supplier(
    s_id INT PRIMARY KEY,
    s_name VARCHAR(35) NOT NULL,
    s_city VARCHAR(30),
    s_phno NUMERIC(10) NOT NULL,
    FOREIGN KEY(s_id) REFERENCES user(user_id)
);
CREATE TABLE distributor(
    d_id INT PRIMARY KEY,
    d_name VARCHAR(35) NOT NULL,
    d_city VARCHAR(30),
    d_phno NUMERIC(10) NOT NULL,
    FOREIGN KEY(d_id) REFERENCES user(user_id)
);
CREATE TABLE retailer(
    r_id INT PRIMARY KEY,
    r_name VARCHAR(35) NOT NULL,
    r_city VARCHAR(30),
    r_phno NUMERIC(10) NOT NULL,
    FOREIGN KEY(r_id) REFERENCES user(user_id)
);
CREATE TABLE customer(
    c_id INT PRIMARY KEY,
    c_name VARCHAR(35) NOT NULL,
    c_city VARCHAR(30) NOT NULL,
    c_phno NUMERIC(10) NOT NULL,,
    FOREIGN KEY(c_id) REFERENCES user(user_id)
);
CREATE TABLE product(
    p_id INT PRIMARY KEY,
    p_name VARCHAR(35) NOT NULL,
    p_rate NUMERIC(5,2) NOT NULL,
    p_features VARCHAR(60)
);

CREATE TABLE has(
    p_id INT,
    s_id INT,
    has_qty INT CHECK(has_qty>0),
    PRIMARY KEY(p_id, s_id),
    FOREIGN KEY(p_id) REFERENCES product(p_id),
    FOREIGN KEY(s_id) REFERENCES supplier(s_id)
);
CREATE TABLE supplies(
    transac_id INT,
    p_id INT NOT NULL,
    s_id INT NOT NULL,
    d_id INT NOT NULL,
    pending_or_done BOOLEAN,
    date DATE,
    s_qty INT CHECK(s_qty>0),
    PRIMARY KEY(transac_id),
    FOREIGN KEY(p_id) REFERENCES product(p_id),
    FOREIGN KEY(s_id) REFERENCES supplier(s_id),
    FOREIGN KEY(d_id) REFERENCES distributor(d_id)
);
CREATE TABLE distributes(
    consign_id INT,
    p_id INT NOT NULL,
    r_id INT NOT NULL,
    d_id INT NOT NULL,
    pending_or_done BOOLEAN,
    date DATE,
    d_qty INT CHECK(d_qty>0),
    PRIMARY KEY(consign_id),
    FOREIGN KEY(p_id) REFERENCES product(p_id),
    FOREIGN KEY(r_id) REFERENCES retailer(r_id),
    FOREIGN KEY(d_id) REFERENCES distributor(d_id)
);
CREATE TABLE invoice_line(
    inv_line_id INT,
    p_id INT NOT NULL,
    r_id INT NOT NULL,
    c_id INT NOT NULL,
    want_qty INT CHECK(want_qty>0),
    PRIMARY KEY(inv_line_id),
    FOREIGN KEY(p_id) REFERENCES product(p_id),
    FOREIGN KEY(r_id) REFERENCES retailer(r_id),
    FOREIGN KEY(c_id) REFERENCES customer(c_id)
);
-- qty is passed on entirely until retailer. invoiceline will have qty less than retailer stock.
CREATE TABLE inv_has(
    inv_line_id INT,
    inv_id INT,
    PRIMARY KEY(inv_id, inv_line_id),
    FOREIGN KEY(inv_id) REFERENCES invoice(inv_id),
    FOREIGN KEY(inv_line_id) REFERENCES invoice_line(inv_line_id)
);
CREATE TABLE invoice(
    inv_id INT,
    c_id INT NOT NULL,
    PRIMARY KEY(inv_id),
    inv_date DATE,
    FOREIGN KEY(c_id) REFERENCES customer(c_id)
);
