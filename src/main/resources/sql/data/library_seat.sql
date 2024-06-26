drop table if exists library_seat;
create table library_seat
(
    seat_id   varchar(100) not null comment '座位id'
        primary key,
    room_id   varchar(100) null comment '图书室id',
    name      varchar(20) null comment '座位名称',
    repair    tinyint(1) null comment '维修状态',
    x         int null comment 'x坐标',
    y         int null comment 'y坐标',
    direction smallint null comment '方向',
    width     int null comment '宽',
    height    int null comment '高'
);

INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('0akn9ykp8mdddve7wog81', 'dsackacsvjakcaw1', '0qiq17z1sms', 0, 12, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('17f4r84y8q9', 'dsackacbjakcaw3', 'ue4na9jk6to', 0, 14, 12, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('1xf2tqi8kinizkfv5hweu9', 'dsackacbjakcdfw4', 'rt4mx548z6d', 0, 2, 2, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('2623djj8c2zdyvclugx8qc', 'dsackacsvjakcaw1', '5lp3vwhw8r8', 0, 9, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('3k9wwycvuy7fyuwajakiys', 'dsackacsvjakcaw1', 'zs6gophq5l', 0, 11, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('3ldfv7xoitg1csczsfvbz3', 'dsackacsvjakcaw1', 'ypwnls2xvqc', 0, 7, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('3ridr0z3z6opccrxa653er', 'dsackacsvjakcaw1', 'fwlecor6wkf', 0, 3, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('40d8kjckt2h0b36e2npsujo', 'dsackacbjakcdfw4', 'u44y9rnvqb', 0, 0, 1, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('44gvbn9t85eqbn6zex4nlr', 'dsackacbjakcdfw4', 'dw42dsamcvm', 0, 4, 1, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('49lmomv82vx', 'dsackacbjakcaw3', 'xnd4inepiz', 0, 14, 13, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('5plu8p4hxx8qlkzx5cgw0r', 'dsackacsvjakcaw1', '3iphx891y6', 0, 3, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('63zzr2lwagxq2g40v972ig', 'dsackacbjakcdfw4', 'd7qtdebyt68', 0, 2, 3, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('6blel019tpm9or7agaeprs', 'dsackacsvjakcaw1', 'xfxmbu81imq', 0, 4, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('6f13z12wma6dkkgqbpfd2o', 'dsackacsvjakcaw1', 'c1kjdqetlh6', 0, 10, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('6hj1wxa4ftctzogbt3iqmo', 'dsackacbjakcdfw4', 'alselxu01qn', 0, 4, 0, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('6jdfk5c3r7ez5aho984dal', 'dsackacsvjakcaw1', 'hc3z0j8yji', 0, 4, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('6zh02j091822g01boa4ydw', 'dsackacsvjakcaw1', 'u89jc8rrqel', 0, 5, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('754kgrs9qdozjahr7ixygq', 'dsackacbjakcdfw4', 'va0gjcggda', 0, 6, 0, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('7783s9drl2x', 'dsackacbjakcaw3', '7lezi1ljr79', 0, 11, 12, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('77za5wemjx4ap72f1q4e6r', 'dsackacsvjakcaw1', '1h241rfylug', 0, 5, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('7pfy8qhfi1dvro1qee80mk', 'dsackacsvjakcaw1', 'dzun8gbr41', 0, 1, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('7xt8bxzt18hr18wbkywwbd', 'dsackacsvjakcaw1', '9nai6z75a4h', 0, 1, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('81tpqm5x8r5h06h67ndki', 'dsackacsvjakcaw1', 'fnvg9ljq9s7', 0, 10, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('8j67voxxvx8t0m0rc2ryqe', 'dsackacbjakcdfw4', 'ikbqsyhikw', 0, 6, 2, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('8pcym8vs6qatceo83nt9i', 'dsackacsvjakcaw1', 'fbpy60tfkeq', 0, 8, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('8pzt7xyytcbrdcsbxptmq', 'dsackacsvjakcaw1', 'z48kz6f0ive', 0, 0, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('8sow51kodll6t25len3cvx', 'dsackacbjakcdfw4', 'a7p8c0hu34k', 0, 0, 2, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('8xzgk48wyyf9bdla0q0ztk', 'dsackacbjakcdfw4', 'jg4v78pfbej', 0, 0, 3, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('95t7ha66d2k', 'dsackacbjakcaw3', 'zmb6oiuh6fk', 0, 15, 13, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('9zk5e1x3xqj', 'dsackacbjakcaw3', '3bohomrw093', 0, 21, 12, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1001', 'dsackacbjakcaw3', 'A1001', 0, 0, 0, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1002', 'dsackacbjakcaw3', 'A1002', 0, 0, 1, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1003', 'dsackacbjakcaw3', 'A1003', 0, 2, 0, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1004', 'dsackacbjakcaw3', 'A1004', 0, 2, 1, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1005', 'dsackacbjakcaw3', 'A1005', 0, 3, 0, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1006', 'dsackacbjakcaw3', 'A1006', 0, 3, 1, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1007', 'dsackacbjakcaw3', 'A1007', 0, 5, 0, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1008', 'dsackacbjakcaw3', 'A1008', 0, 5, 1, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1009', 'dsackacbjakcaw3', 'A1009', 0, 6, 0, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1010', 'dsackacbjakcaw3', 'A1010', 0, 6, 1, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1011', 'dsackacbjakcaw3', 'A1011', 0, 8, 0, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1012', 'dsackacbjakcaw3', 'A1012', 0, 8, 1, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1013', 'dsackacbjakcaw3', 'A1013', 0, 9, 0, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1014', 'dsackacbjakcaw3', 'A1014', 0, 9, 1, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1015', 'dsackacbjakcaw3', 'A1015', 0, 11, 0, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1016', 'dsackacbjakcaw3', 'A1016', 0, 11, 1, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1017', 'dsackacbjakcaw3', 'A1017', 0, 12, 0, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1018', 'dsackacbjakcaw3', 'A1018', 0, 12, 1, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1019', 'dsackacbjakcaw3', 'A1019', 0, 14, 0, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1020', 'dsackacbjakcaw3', 'A1020', 0, 14, 1, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1021', 'dsackacbjakcaw3', 'A1021', 0, 15, 0, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1022', 'dsackacbjakcaw3', 'A1022', 0, 15, 1, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1023', 'dsackacbjakcaw3', 'A1023', 0, 17, 0, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1024', 'dsackacbjakcaw3', 'A1024', 0, 17, 1, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1025', 'dsackacbjakcaw3', 'A1025', 0, 0, 3, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1026', 'dsackacbjakcaw3', 'A1026', 0, 0, 4, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1027', 'dsackacbjakcaw3', 'A1027', 0, 2, 3, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1028', 'dsackacbjakcaw3', 'A1028', 0, 2, 4, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1029', 'dsackacbjakcaw3', 'A1029', 0, 3, 3, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1030', 'dsackacbjakcaw3', 'A1030', 0, 3, 4, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1031', 'dsackacbjakcaw3', 'A1031', 0, 5, 3, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1032', 'dsackacbjakcaw3', 'A1032', 0, 5, 4, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1033', 'dsackacbjakcaw3', 'A1033', 0, 6, 3, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1034', 'dsackacbjakcaw3', 'A1134', 0, 6, 4, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1035', 'dsackacbjakcaw3', 'A1135', 0, 8, 3, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1036', 'dsackacbjakcaw3', 'A1136', 0, 8, 4, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1037', 'dsackacbjakcaw3', 'A109', 0, 9, 3, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1038', 'dsackacbjakcaw3', 'A110', 0, 9, 4, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1039', 'dsackacbjakcaw3', 'A111', 0, 11, 3, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1040', 'dsackacbjakcaw3', 'A112', 0, 11, 4, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1041', 'dsackacbjakcaw3', 'A109', 0, 12, 4, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1042', 'dsackacbjakcaw3', 'A110', 0, 12, 3, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1043', 'dsackacbjakcaw3', 'A111', 0, 14, 4, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1044', 'dsackacbjakcaw3', 'A112', 0, 14, 3, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1045', 'dsackacbjakcaw3', 'A109', 0, 15, 4, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1046', 'dsackacbjakcaw3', 'A110', 0, 15, 3, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1047', 'dsackacbjakcaw3', 'A111', 0, 17, 4, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1048', 'dsackacbjakcaw3', 'A112', 0, 17, 3, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1049', 'dsackacbjakcaw3', 'A101', 0, 0, 7, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1050', 'dsackacbjakcaw3', 'A102', 0, 0, 6, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1051', 'dsackacbjakcaw3', 'A103', 0, 2, 7, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1052', 'dsackacbjakcaw3', 'A104', 0, 2, 6, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1053', 'dsackacbjakcaw3', 'A105', 0, 3, 7, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1054', 'dsackacbjakcaw3', 'A106', 0, 3, 6, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1055', 'dsackacbjakcaw3', 'A107', 0, 5, 7, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1056', 'dsackacbjakcaw3', 'A108', 0, 5, 6, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1057', 'dsackacbjakcaw3', 'A109', 0, 6, 7, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1058', 'dsackacbjakcaw3', 'A110', 0, 6, 6, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1059', 'dsackacbjakcaw3', 'A111', 0, 8, 7, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1060', 'dsackacbjakcaw3', 'A112', 0, 8, 6, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1061', 'dsackacbjakcaw3', 'A109', 0, 9, 7, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1062', 'dsackacbjakcaw3', 'A110', 0, 9, 6, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1063', 'dsackacbjakcaw3', 'A111', 0, 11, 7, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1064', 'dsackacbjakcaw3', 'A112', 0, 11, 6, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1065', 'dsackacbjakcaw3', 'A109', 0, 12, 7, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1066', 'dsackacbjakcaw3', 'A110', 0, 12, 6, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1067', 'dsackacbjakcaw3', 'A111', 0, 14, 7, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1068', 'dsackacbjakcaw3', 'A112', 0, 14, 6, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1069', 'dsackacbjakcaw3', 'A109', 0, 15, 7, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1070', 'dsackacbjakcaw3', 'A110', 0, 15, 6, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1071', 'dsackacbjakcaw3', 'A111', 0, 17, 7, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1072', 'dsackacbjakcaw3', 'A112', 0, 17, 6, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1073', 'dsackacbjakcaw3', 'A101', 0, 0, 10, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1074', 'dsackacbjakcaw3', 'A102', 0, 0, 9, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1075', 'dsackacbjakcaw3', 'A103', 0, 2, 10, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1076', 'dsackacbjakcaw3', 'A104', 0, 2, 9, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1077', 'dsackacbjakcaw3', 'A105', 0, 3, 10, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1078', 'dsackacbjakcaw3', 'A106', 0, 3, 9, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1079', 'dsackacbjakcaw3', 'A107', 0, 5, 10, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1080', 'dsackacbjakcaw3', 'A108', 0, 5, 9, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1081', 'dsackacbjakcaw3', 'A109', 0, 6, 10, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1082', 'dsackacbjakcaw3', 'A110', 0, 6, 9, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1083', 'dsackacbjakcaw3', 'A111', 0, 8, 10, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1084', 'dsackacbjakcaw3', 'A112', 0, 8, 9, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1085', 'dsackacbjakcaw3', 'A109', 0, 9, 10, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1086', 'dsackacbjakcaw3', 'A110', 0, 9, 9, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1087', 'dsackacbjakcaw3', 'A111', 0, 11, 10, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1088', 'dsackacbjakcaw3', 'A112', 0, 11, 9, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1089', 'dsackacbjakcaw3', 'A109', 0, 12, 10, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1090', 'dsackacbjakcaw3', 'A110', 0, 12, 9, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1091', 'dsackacbjakcaw3', 'A111', 0, 14, 10, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1092', 'dsackacbjakcaw3', 'A112', 0, 14, 9, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1093', 'dsackacbjakcaw3', 'A109', 0, 15, 10, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1094', 'dsackacbjakcaw3', 'A110', 0, 15, 9, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1095', 'dsackacbjakcaw3', 'A111', 0, 17, 10, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1096', 'dsackacbjakcaw3', 'A112', 0, 17, 9, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1200', 'dsackacbjakcaw3', 'A1200', 0, 18, 6, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1201', 'dsackacbjakcaw3', 'A1201', 0, 18, 7, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1202', 'dsackacbjakcaw3', 'A1202', 0, 20, 6, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1203', 'dsackacbjakcaw3', 'A1203', 0, 20, 7, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1205', 'dsackacbjakcaw3', 'A109', 0, 18, 10, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1206', 'dsackacbjakcaw3', 'A110', 0, 18, 9, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1207', 'dsackacbjakcaw3', 'A111', 0, 20, 10, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1208', 'dsackacbjakcaw3', 'A112', 0, 20, 9, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1209', 'dsackacbjakcaw3', 'A109', 0, 3, 13, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1210', 'dsackacbjakcaw3', 'A110', 0, 3, 12, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1211', 'dsackacbjakcaw3', 'A111', 0, 5, 13, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1212', 'dsackacbjakcaw3', 'A112', 0, 5, 12, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1213', 'dsackacbjakcaw3', 'A109', 0, 0, 13, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1214', 'dsackacbjakcaw3', 'A110', 0, 0, 12, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1215', 'dsackacbjakcaw3', 'A111', 0, 2, 13, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1216', 'dsackacbjakcaw3', 'A112', 0, 2, 12, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1217', 'dsackacbjakcaw3', 'A109', 0, 21, 0, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1218', 'dsackacbjakcaw3', 'A110', 0, 18, 4, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1219', 'dsackacbjakcaw3', 'A111', 0, 21, 3, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1220', 'dsackacbjakcaw3', 'A112', 0, 21, 4, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1221', 'dsackacbjakcaw3', 'A109', 0, 18, 0, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1222', 'dsackacbjakcaw3', 'A110', 0, 21, 1, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1223', 'dsackacbjakcaw3', 'A111', 0, 18, 3, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1224', 'dsackacbjakcaw3', 'A112', 0, 18, 1, 3, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1225', 'dsackacbjakcaw3', 'A109', 0, 20, 4, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1226', 'dsackacbjakcaw3', 'A110', 0, 20, 3, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1227', 'dsackacbjakcaw3', 'A111', 0, 23, 4, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1228', 'dsackacbjakcaw3', 'A112', 0, 23, 3, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1229', 'dsackacbjakcaw3', 'A109', 0, 20, 1, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1230', 'dsackacbjakcaw3', 'A110', 0, 20, 0, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1231', 'dsackacbjakcaw3', 'A111', 0, 23, 0, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('A1232', 'dsackacbjakcaw3', 'A112', 0, 23, 1, 1, 11, 11);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('absfghll8zmxckx8b98xs', 'dsackacbjakcdfw4', 'ebksy3frw3', 0, 6, 3, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('aq5uo86dagk', 'dsackacbjakcaw3', 'igeaf4pe1x', 0, 20, 13, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('az42fyqvdh7ryf0yfb3tgm', 'dsackacbjakcdfw4', 'wc3w3fcdphp', 0, 2, 1, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('b9ax6pi6wehp5236qljmp7', 'dsackacsvjakcaw1', 'lyf52uun7tm', 0, 5, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('bzagjxss0graf2670zkueq', 'dsackacsvjakcaw1', 'co7jiaytond', 0, 12, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('bzccltml5u', 'dsackacbjakcaw3', '6xzktzftum7', 0, 11, 13, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('c03foqmbq6t8g2gcf3oq', 'dsackacsvjakcaw1', '3fox3u6d56b', 0, 2, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('c6awt9bvqff6hr0shasojk', 'dsackacsvjakcaw1', '4yvur3pvv3h', 0, 8, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('ceh8srm0ctq', 'dsackacbjakcaw3', 'g4scfpywbxr', 0, 9, 13, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('cp7vodfwrlzxsnx4w6xr', 'dsackacbjakcdfw4', '9p2vfotchnn', 0, 0, 0, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('cq19u6d0wl', 'dsackacbjakcaw3', 'glbhs240owj', 0, 21, 7, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('cr4ly8v0bna7f75y69u4p3', 'dsackacsvjakcaw1', 'tjzleqzodlh', 0, 4, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('crndojo2lar614a8kbw62', 'dsackacsvjakcaw1', '3dp3yx6tbvy', 0, 9, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('cwtwuaqzws7s0ik8qj5cie', 'dsackacsvjakcaw1', 'skm481jp1ba', 0, 0, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('d6v5irx2anw3rv69pmak92', 'dsackacsvjakcaw1', 'm9v02mt5guk', 0, 4, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('d79ugbesn2u2t29fl598qd', 'dsackacsvjakcaw1', 'r1vk1y9pqy8', 0, 2, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('e39ap7ybot', 'dsackacbjakcaw3', 'l5d4oy8l8e', 0, 17, 12, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('e6pjfomui0r', 'dsackacbjakcaw3', 's7u8qg2qd6n', 0, 15, 12, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('em6pfv1vhasbrvwd6eo8lf', 'dsackacsvjakcaw1', 'b5td1hqbku', 0, 11, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('geoq0pjrz4c906t4z9jvo', 'dsackacsvjakcaw1', 'hxugb5v3kiu', 0, 9, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('glps0ulzej4', 'dsackacbjakcaw3', 'yu2fos3mbed', 0, 23, 7, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('hbyr45xktlw74s1ldpjfqq', 'dsackacsvjakcaw1', 'tz2yg40zzs', 0, 8, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('hf7tam2a06n', 'dsackacbjakcaw3', '0hmoq4ole80i', 0, 12, 13, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('hqaehfipelnybzbnqxx5dd', 'dsackacsvjakcaw1', 'hd9ejtzk8ua', 0, 8, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('hs8zaj0e5kr', 'dsackacbjakcaw3', '6n10m7qfssl', 0, 6, 12, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('i17ks3ckuw8pnf2gtlnn5', 'dsackacsvjakcaw1', 'u9zjcjirau', 0, 8, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('i46cxyzy2fykjfrtwjdz', 'dsackacsvjakcaw1', '9p2foiqygot', 0, 6, 11, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('ilny6fwj9lstyo5mdmwue', 'dsackacsvjakcaw1', 'on9lxwjch3l', 0, 9, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('ipo5uslaoospli8ksz830s', 'dsackacbjakcdfw4', 'woqnn9oknvj', 0, 6, 1, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('j8zptv91llerszhemla3y8', 'dsackacbjakcdfw4', 'lb7b7op72eo', 0, 4, 2, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('jfoo99n8y24gfh9zuh0ql', 'dsackacsvjakcaw1', 'tvruqnqli78', 0, 11, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('jkbc194tuc55ystq576cm', 'dsackacsvjakcaw1', 'zh1d52kyyia', 0, 8, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('ju2t1qqyihp', 'dsackacbjakcaw3', '3lx4f8izznm', 0, 23, 10, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('juh94rac60nvo75pxh6ff', 'dsackacsvjakcaw1', 'ywm95en4mgj', 0, 10, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('kb2taxa7sapyyilgn0o45b', 'dsackacsvjakcaw1', 'ad2sd3kjlo', 0, 0, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('kdom068atyh5p6ph32oavh', 'dsackacsvjakcaw1', 'nmfycapphun', 0, 7, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('lc2dnaf1wnp', 'dsackacbjakcaw3', 'xchg4d113lh', 0, 17, 13, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('lga9h3qybgb06v6fxa57zea', 'dsackacsvjakcaw1', '3m5lyasderl', 0, 7, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('ltxfjcurj3e', 'dsackacbjakcaw3', 'qrnxmqb8ey', 0, 12, 12, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('mme0t3zi8q', 'dsackacbjakcaw3', 'wqt3gpf4mz', 0, 21, 13, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('mqllremecaj0cg28ez04hmg', 'dsackacbjakcdfw4', '2flg6iagull', 0, 4, 3, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('mujcu5iuq3npo0eqlkfol', 'dsackacsvjakcaw1', 'tzf3zrhylb', 0, 5, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('ncqnv9fis8z23pqyoztja', 'dsackacsvjakcaw1', 'sn4py785ao', 0, 0, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('niret6widxlo38o1hu5r7', 'dsackacsvjakcaw1', '58nlzuouogf', 0, 12, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('nk7vgcbh5oq4uchufdi3n', 'dsackacsvjakcaw1', 'u8m1m2bmrac', 0, 12, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('np4vak5jsp', 'dsackacbjakcaw3', '0k0cmg0knry', 0, 21, 6, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('nprkt3uxfyrrj281yovt9', 'dsackacsvjakcaw1', 'x8bs0e8m8j', 0, 3, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('nr766n7kgi8fpzhrliz85s', 'dsackacsvjakcaw1', 'ozgdngc22qq', 0, 11, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('o1rvbrufc5g', 'dsackacbjakcaw3', 'du371194q1l', 0, 23, 6, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('oss5nx24um', 'dsackacbjakcaw3', 'g2jxntuiiyk', 0, 18, 13, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('p3ibremnbz9fnyqjqwqfw', 'dsackacsvjakcaw1', 'xehnjbujyro', 0, 3, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('p3xvmzjpinrx3glchlfe6', 'dsackacsvjakcaw1', '2j20r7f58ip', 0, 10, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('p951ydfb4umhto336jycxj', 'dsackacsvjakcaw1', 'scoukpzp16c', 0, 5, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('qacs5ld6qns5tcshrrka9', 'dsackacsvjakcaw1', '9wor7zfn058', 0, 7, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('qs52hlhhvdl', 'dsackacbjakcaw3', '51bllm1p0b', 0, 6, 13, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('qt327egeew', 'dsackacbjakcaw3', 'epqyh67e1tl', 0, 21, 9, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('quk2cqgkgmiy008msub8zl', 'dsackacsvjakcaw1', 'jp4cw7svbh', 0, 3, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('rg99so0bhn8j6ko2h7kakq', 'dsackacsvjakcaw1', 'ntu2wdi5mq', 0, 3, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('s0pfo2n471m', 'dsackacbjakcaw3', '0zmzukvaxe1g', 0, 21, 10, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('sf907f9iok56zctgzj7sm', 'dsackacsvjakcaw1', '6fhaii2qcmp', 0, 11, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('snu754yh52', 'dsackacbjakcaw3', 'm3zbrqfpzr', 0, 23, 13, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('t48754c0df', 'dsackacbjakcaw3', '90u0dfwcpyg', 0, 9, 12, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('t9v026qhbx', 'dsackacbjakcaw3', '0zcjs3alfpdb', 0, 23, 9, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('u02okram64bi06t6gafhlf', 'dsackacbjakcdfw4', 'pd4gbbsz2f', 0, 2, 0, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('ucbdna3vbjrh1eumzxf4wk', 'dsackacsvjakcaw1', '6qubgxc1ku3', 0, 11, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('uicnkvoabho', 'dsackacbjakcaw3', '4qebigbyaxh', 0, 8, 12, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('unn8furhvnjpu7gbabjan', 'dsackacsvjakcaw1', '5ml4misvkgs', 0, 1, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('uss4rhmxe89ncpg38ivnv', 'dsackacsvjakcaw1', 'ck7jd1xq44w', 0, 7, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('v1dljci1e5oycz0wuz27p', 'dsackacsvjakcaw1', 'xr6cfdinkas', 0, 10, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('v3db0m49snfuf27f8xjy6i', 'dsackacsvjakcaw1', 'yqxuq2rns7', 0, 1, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('vfc0vptj38j71e11nt9ewa', 'dsackacsvjakcaw1', 'rww0b3xywng', 0, 1, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('vjb7xj55rm', 'dsackacbjakcaw3', '3y9ffixi8ze', 0, 18, 12, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('vkdhxfpiktf22evdgwx1ab', 'dsackacsvjakcaw1', 'dgtumkhcd0o', 0, 5, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('vop6zp290dos08sntbwhs', 'dsackacsvjakcaw1', 'b7p2rzi40a5', 0, 12, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('vprxn8fjdeeqge9yqdnp3', 'dsackacsvjakcaw1', '455497sxw38', 0, 2, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('vqc6lvjd74je7zjboc5jt', 'dsackacsvjakcaw1', 'hs6gkbmtodg', 0, 7, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('w0f82xi6qwm5njxtfs4pge', 'dsackacsvjakcaw1', 'oa8dyzfvb4h', 0, 4, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('wa9pfhfl9q0j1xe551hl3k', 'dsackacsvjakcaw1', 'maab7viba2d', 0, 12, 1, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('ws3lxhgd3cksv6pp5yfzw', 'dsackacsvjakcaw1', '7d63fxlq57q', 0, 0, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('x3eh1wqk7i', 'dsackacbjakcaw3', 'pxvjbrchw1', 0, 23, 12, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('x8sc0we97zjziie04a0k', 'dsackacsvjakcaw1', 'e3eop46oefv', 0, 2, 6, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('xe8ywvtakbjrucpqqpb0g', 'dsackacsvjakcaw1', 'ffqksj3kpch', 0, 2, 4, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('xeoqe9f5wo4rve2fshyu7', 'dsackacsvjakcaw1', 'w1lc2r1x4at', 0, 9, 3, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('xk460lyxwyflnx7oirt23o', 'dsackacsvjakcaw1', 'nfom781zmi', 0, 0, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('xlh7k95g4si1lik6s1qu7o', 'dsackacsvjakcaw1', 'bxhmjabkqgc', 0, 4, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('y70pfa5tiod', 'dsackacbjakcaw3', 'k7gwu3i8cb', 0, 8, 13, 3, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('ycrdrmifijaaizebkjcl9', 'dsackacsvjakcaw1', 'abh8smh1il6', 0, 10, 7, 0, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('yor5s9e72ji', 'dsackacbjakcaw3', 'j8bpzmxteph', 0, 20, 12, 1, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('ysrlfeaxrok5kyd5aenwcd', 'dsackacsvjakcaw1', 'wtm2pdcerxn', 0, 9, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('z8ro382ccbcdwo7uecayer', 'dsackacsvjakcaw1', '4w9xevfvf7', 0, 2, 9, 2, 1, 1);
INSERT INTO library.library_seat (seat_id, room_id, name, repair, x, y, direction, width, height)
VALUES ('zu9dwdsin633kpydqob2h', 'dsackacsvjakcaw1', 'oc1h6shaj0l', 0, 1, 6, 2, 1, 1);
