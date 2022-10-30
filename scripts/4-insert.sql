
-- has (s_id, p_id, qty)
INSERT INTO has VALUES('00001', '50001', 5000);
INSERT INTO has VALUES('00001', '50006', 800);
INSERT INTO has VALUES('00001', '50007', 350);
INSERT INTO has VALUES('00002', '50002', 500);
INSERT INTO has VALUES('00002', '50003', 2500);
INSERT INTO has VALUES('00002', '50009', 500);
INSERT INTO has VALUES('00002', '50010', 200);
INSERT INTO has VALUES('00003', '50001', 2300);
INSERT INTO has VALUES('00003', '50008', 5000);
INSERT INTO has VALUES('00003', '50002', 10000);
INSERT INTO has VALUES('00003', '50003', 2900);
INSERT INTO has VALUES('00004', '50004', 10000);
INSERT INTO has VALUES('00004', '50005', 10000);

-- supplies               (transac_id, p_id,   s_id,    d_id, pending_or_done, date, qty)
INSERT INTO supplies VALUES('60000', '50001', '00001', '10001', 0, "2022-10-01", 1000);
INSERT INTO supplies VALUES('60001', '50006', '00001', '10001', 0, "2022-09-30", 500);
INSERT INTO supplies VALUES('60002', '50007', '00001', '10001', 0, "2022-08-11", 200);
INSERT INTO supplies VALUES('60003', '50002', '00002', '10001', 0, "2022-10-01", 400);
INSERT INTO supplies VALUES('60004', '50003', '00002', '10001', 0, "2022-10-11", 1000);
INSERT INTO supplies VALUES('60005', '50010', '00002', '10002', 0, "2022-10-31", 100);
INSERT INTO supplies VALUES('60006', '50001', '00003', '10002', 0, "2022-09-01", 1000);
INSERT INTO supplies VALUES('60007', '50008', '00003', '10002', 0, "2022-09-21", 2500);
INSERT INTO supplies VALUES('60008', '50002', '00003', '10002', 0, "2022-09-11", 3500);
INSERT INTO supplies VALUES('60009', '50004', '00004', '10002', 0, "2022-09-21", 1000);
INSERT INTO supplies VALUES('60010', '50005', '00004', '10002', 0, "2022-08-31", 2500);
INSERT INTO supplies VALUES('60011', '50005', '00004', '10002', 0, "2022-09-21", 2500);


-- distributes               (consign_id, p_id,   d_id,   r_id, pending_or_done, date, qty)
INSERT INTO distributes VALUES('70001', '50001', '10001', '20001', 0, "2022-11-21", 750);
INSERT INTO distributes VALUES('70002', '50006', '10001', '20001', 0, "2022-11-21", 250);
INSERT INTO distributes VALUES('70003', '50007', '10001', '20001', 0, "2022-11-21", 100);
INSERT INTO distributes VALUES('70004', '50002', '10001', '20001', 0, "2022-11-21", 250);
INSERT INTO distributes VALUES('70005', '50003', '10001', '20001', 0, "2022-11-21", 500);
INSERT INTO distributes VALUES('70006', '50010', '10002', '20001', 0, "2022-11-21", 50);
INSERT INTO distributes VALUES('70007', '50001', '10002', '20002', 0, "2022-11-21", 500);
INSERT INTO distributes VALUES('70008', '50008', '10002', '20002', 0, "2022-11-21", 300);
INSERT INTO distributes VALUES('70009', '50002', '10002', '20002', 0, "2022-11-21", 1000);
INSERT INTO distributes VALUES('70010', '50004', '10002', '20002', 0, "2022-10-21", 700);
INSERT INTO distributes VALUES('70011', '50005', '10002', '20002', 0, "2022-10-21", 1000);
INSERT INTO distributes VALUES('70012', '50005', '10002', '20002', 0, "2022-10-21", 1000);


-- invoice_line               (inv_line_id, p_id,   r_id,   c_id,  qty)
INSERT INTO invoice_line VALUES('80001', '50001', '20001', '30001', 10);
INSERT INTO invoice_line VALUES('80002', '50006', '20001', '30002', 4);
INSERT INTO invoice_line VALUES('80003', '50007', '20001', '30003', 1);
INSERT INTO invoice_line VALUES('80004', '50002', '20001', '30004', 5);
INSERT INTO invoice_line VALUES('80005', '50003', '20001', '30001', 2);
INSERT INTO invoice_line VALUES('80006', '50010', '20001', '30002', 1);
INSERT INTO invoice_line VALUES('80007', '50001', '20002', '30003', 4);
INSERT INTO invoice_line VALUES('80008', '50008', '20002', '30004', 7);
INSERT INTO invoice_line VALUES('80009', '50002', '20002', '30001', 8);
INSERT INTO invoice_line VALUES('80010', '50004', '20002', '30002', 9);
INSERT INTO invoice_line VALUES('80011', '50005', '20002', '30005', 2);
INSERT INTO invoice_line VALUES('80012', '50005', '20002', '30005', 2);

-- invoice (inv_id, c_id, date)
INSERT INTO invoice VALUES('90001', '30001', "2022-12-09");
INSERT INTO invoice VALUES('90002', '30002', "2022-12-10");
INSERT INTO invoice VALUES('90003', '30003', "2022-12-01");
INSERT INTO invoice VALUES('90004', '30004', "2022-12-11");
INSERT INTO invoice VALUES('90005', '30005', "2022-11-11");
INSERT INTO invoice VALUES('90006', '30001', "2022-12-09");
INSERT INTO invoice VALUES('90007', '30002', "2022-12-10");

-- inv_has (inv_line_id, inv_id)
INSERT INTO inv_has VALUES('80001', '90001');
INSERT INTO inv_has VALUES('80002', '90002');
INSERT INTO inv_has VALUES('80003', '90003');
INSERT INTO inv_has VALUES('80004', '90004');
INSERT INTO inv_has VALUES('80005', '90001');
INSERT INTO inv_has VALUES('80006', '90002');
INSERT INTO inv_has VALUES('80007', '90003');
INSERT INTO inv_has VALUES('80008', '90004');
INSERT INTO inv_has VALUES('80009', '90006');
INSERT INTO inv_has VALUES('80010', '90007');
INSERT INTO inv_has VALUES('80011', '90005');
INSERT INTO inv_has VALUES('80012', '90005');
