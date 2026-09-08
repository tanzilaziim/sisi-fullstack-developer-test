CREATE DATABASE sisi_test;

USE sisi_test;

CREATE TABLE `MENU_LEVEL` (
    `ID_LEVEL` varchar(3) NOT NULL,
    `LEVEL` varchar(60),
    PRIMARY KEY (`ID_LEVEL`)
);

CREATE TABLE `USER` (
    `ID_USER` varchar(30) NOT NULL,
    `NAMA_USER` varchar(60),
    `USERNAME` varchar(60),
    `PASSWORD` varchar(60),
    `EMAIL` varchar(200),
    `NO_HP` varchar(30),
    `WA` varchar(30),
    `PIN` varchar(30),
    `ID_JENIS_USER` varchar(3),
    `STATUS_USER` varchar(30),
    `DELETE_MARK` varchar(1),
    `CREATE_BY` varchar(30),
    `CREATE_DATE` timestamp NULL DEFAULT NULL,
    `UPDATE_BY` varchar(30),
    `UPDATE_DATE` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`ID_USER`)
);

CREATE TABLE `MENU` (
    `MENU_ID` varchar(3) NOT NULL,
    `ID_LEVEL` varchar(3),
    `MENU_NAME` varchar(300),
    `MENU_LINK` varchar(300),
    `MENU_ICON` varchar(300),
    `PARENT_ID` varchar(30),
    `CREATE_BY` varchar(30),
    `CREATE_DATE` date,
    `DELETE_MARK` varchar(1),
    `UPDATE_BY` varchar(30),
    `UPDATE_DATE` date,
    PRIMARY KEY (`MENU_ID`),
    FOREIGN KEY (`ID_LEVEL`) REFERENCES `MENU_LEVEL` (`ID_LEVEL`)
);

CREATE TABLE `MENU_USER` (
    `NO_SETTING` int NOT NULL,
    `ID_USER` varchar(30),
    `MENU_ID` varchar(3),
    `CREATE_DATE` varchar(30),
    `CREATE_TIME` timestamp NULL DEFAULT NULL,
    `DELETE_MARK` varchar(1),
    `UPDATE_BY` varchar(30),
    `UPDATE_DATE` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`NO_SETTING`),
    FOREIGN KEY (`ID_USER`) REFERENCES `USER` (`ID_USER`),
    FOREIGN KEY (`MENU_ID`) REFERENCES `MENU` (`MENU_ID`)
);

CREATE TABLE `USER_FOTO` (
    `NO_FOTO` int NOT NULL,
    `ID_USER` varchar(30),
    `FOTO` varchar(200),
    `CREATE_BY` varchar(30),
    `CREATE_DATE` timestamp NULL DEFAULT NULL,
    `DELETE_MARK` varchar(1),
    `UPDATE_BY` varchar(30),
    `UPDATE_DATE` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`NO_FOTO`),
    FOREIGN KEY (`ID_USER`) REFERENCES `USER` (`ID_USER`)
);

CREATE TABLE `USER_ACTIVITY` (
    `NO_ACTIVITY` int NOT NULL,
    `ID_USER` varchar(30),
    `DISCRIPSI` varchar(300),
    `STATUS` varchar(30),
    `MENU_ID` varchar(3),
    `DELETE_MARK` varchar(1),
    `CREATE_BY` varchar(30),
    `CREATE_DATE` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`NO_ACTIVITY`),
    FOREIGN KEY (`ID_USER`) REFERENCES `USER` (`ID_USER`)
);

CREATE TABLE `I_ERROR_APPLICATION` (
    `ERROR_ID` int NOT NULL,
    `ID_USER` varchar(30),
    `ERROR_DATE` varchar(3),
    `MODULES` varchar(100),
    `CONTROLLER` varchar(200),
    `FUNCTION` varchar(200),
    `ERROR_LINE` varchar(30),
    `ERROR_MESSAGE` varchar(1000),
    `STATUS` varchar(30),
    `PARAM` varchar(300),
    `CREATE_DATE` varchar(30),
    `CREATE_TIME` timestamp NULL DEFAULT NULL,
    `DELETE_MARK` varchar(1),
    `UPDATE_BY` varchar(30),
    `UPDATE_DATE` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`ERROR_ID`),
    FOREIGN KEY (`ID_USER`) REFERENCES `USER` (`ID_USER`)
);