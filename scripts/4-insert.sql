-- has (s_id, p_id, qty)
INSERT INTO has VALUES('00001', '50001', 5000);
INSERT INTO has VALUES('00001', '50006', 800);
INSERT INTO has VALUES('00001', '50007', 350);
INSERT INTO has VALUES('00003', '50002', 500);
INSERT INTO has VALUES('00003', '50003', 2500);
INSERT INTO has VALUES('00003', '50009', 500);
INSERT INTO has VALUES('00003', '50010', 200);
INSERT INTO has VALUES('00012', '50001', 2300);
INSERT INTO has VALUES('00012', '50008', 5000);
INSERT INTO has VALUES('00012', '50002', 10000);
INSERT INTO has VALUES('00012', '50003', 2900);
INSERT INTO has VALUES('00053', '50004', 10000);
INSERT INTO has VALUES('00053', '50005', 10000);

-- supplies (transac_id, p_id, s_id, d_id, pending_or_done, date, qty)

-- distributes (consign_id, p_id, d_id, r_id, pending_or_done, date, qty)


-- invoice_line (inv_line_id, p_id, r_id, c_id, qty)

-- invoice (inv_id, c_id, date)

-- has (inv_line_id, inv_id)