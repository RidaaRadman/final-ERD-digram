
create database malaria;
use malaria ;


CREATE TABLE `admin` (
    `AdminID` int  NOT NULL ,
    `Name` varchar(500)   NOT NULL ,
    `email` varchar(500)   NOT NULL ,
    `phon` int  NOT NULL ,
    `Address` varchar(500)   NULL ,
    `OpreationsID` int  NOT NULL ,
    `employID` int  NOT NULL ,
    `surveillanceID` int  NOT NULL ,
    `entomologicalID` int  NOT NULL ,
    PRIMARY KEY (
        `AdminID`
    )
);

CREATE TABLE `opreations` (
    `OpreationsID` int  NOT NULL ,
    `AdminID` int  NOT NULL ,
    `name`  varchar(500)  NOT NULL ,
    `employID` int  NOT NULL ,
    `surveillanceID` int  NOT NULL ,
    `entomologicalID` int  NOT NULL ,
    PRIMARY KEY (
        `OpreationsID`
    )
);

CREATE TABLE `entomological` (
    `entomologicalID` int  NOT NULL ,
    `OpreationsID` int  NOT NULL ,
    `type` varchar(200)  NOT NULL ,
    PRIMARY KEY (
        `entomologicalID`
    ),
    CONSTRAINT `uc_entomological_type` UNIQUE (
        `type`
    )
);

CREATE TABLE `surveillance` (
    `surveillanceID` int  NOT NULL ,
    `type` varchar(200)  NOT NULL ,
    `OpreationsID` int  NOT NULL ,
    PRIMARY KEY (
        `surveillanceID`
    ),
    CONSTRAINT `uc_surveillance_type` UNIQUE (
        `type`
    )
);

CREATE TABLE `employ` (
    `employID` int  NOT NULL ,
    `Name` varchar(300) NOT NULL ,
    `email`  varchar(500)  NOT NULL ,
    `phon` int  NOT NULL ,
    `Address`  varchar(500) NULL ,
    PRIMARY KEY (
        `employID`
    )
);

CREATE TABLE `stores` (
    `storesID` int  NOT NULL ,
    `Quantity`  varchar(800) not  NULL ,
    `tools` varchar(500)  NOT NULL ,
    `OpreationsID` int  NOT NULL ,
    `surveillanceID` int  NOT NULL ,
    `entomologicalID` int  NOT NULL ,
    PRIMARY KEY (
        `storesID`
    )
);

CREATE TABLE `Purchases` (
    `PurchasesID` int  NOT NULL ,
    `price` int  NOT NULL ,
    `quntity`   varchar(500)not  NULL ,
    `tools` varchar(500)not  NULL ,
    `OpreationsID` int  NOT NULL ,
    `surveillanceID` int  NOT NULL ,
    `entomologicalID` int  NOT NULL ,
    `AdminID` int  NOT NULL ,
    PRIMARY KEY (
        `PurchasesID`
    )
);
insert into admin (Id , name ,phon , adress, email  ) value(1 ,ahmeed , 7795553 , hada) ;
insert into opreations (Id , name  ) value(1 ,Sprayingpesticides ) ;
insert into opreations (Id , name  ) value(1 ,SprayingPesticides ) ;
insert into stores(Id , quantity , tools  ) value(1 ,5229, antagonists) ;
insert into Purchases (Id , quantity , tools, price  ) value(1 , 58992 , pesticides,35248$ ) ;
insert into employ (Id , name ,phon , adress, email  ) value(1 ,ali , 7794863 , al-kweetStreet) ;
insert into surveillance( id , type ) value(1 ,dengueFever);
insert into entomological( id , type ) value(1 ,AedesAegypti);


ALTER TABLE `admin` ADD CONSTRAINT `fk_admin_OpreationsID` FOREIGN KEY(`OpreationsID`)
REFERENCES `opreations` (`OpreationsID`);

ALTER TABLE `admin` ADD CONSTRAINT `fk_admin_employID` FOREIGN KEY(`employID`)
REFERENCES `employ` (`employID`);

ALTER TABLE `admin` ADD CONSTRAINT `fk_admin_surveillanceID` FOREIGN KEY(`surveillanceID`)
REFERENCES `surveillance` (`surveillanceID`);

ALTER TABLE `admin` ADD CONSTRAINT `fk_admin_entomologicalID` FOREIGN KEY(`entomologicalID`)
REFERENCES `entomological` (`entomologicalID`);

ALTER TABLE `opreations` ADD CONSTRAINT `fk_opreations_AdminID` FOREIGN KEY(`AdminID`)
REFERENCES `admin` (`AdminID`);

ALTER TABLE `opreations` ADD CONSTRAINT `fk_opreations_employID` FOREIGN KEY(`employID`)
REFERENCES `employ` (`employID`);

ALTER TABLE `opreations` ADD CONSTRAINT `fk_opreations_surveillanceID` FOREIGN KEY(`surveillanceID`)
REFERENCES `surveillance` (`surveillanceID`);

ALTER TABLE `opreations` ADD CONSTRAINT `fk_opreations_entomologicalID` FOREIGN KEY(`entomologicalID`)
REFERENCES `entomological` (`entomologicalID`);

ALTER TABLE `entomological` ADD CONSTRAINT `fk_entomological_OpreationsID` FOREIGN KEY(`OpreationsID`)
REFERENCES `opreations` (`OpreationsID`);

ALTER TABLE `surveillance` ADD CONSTRAINT `fk_surveillance_OpreationsID` FOREIGN KEY(`OpreationsID`)
REFERENCES `opreations` (`OpreationsID`);

ALTER TABLE `stores` ADD CONSTRAINT `fk_stores_OpreationsID` FOREIGN KEY(`OpreationsID`)
REFERENCES `opreations` (`OpreationsID`);

ALTER TABLE `stores` ADD CONSTRAINT `fk_stores_surveillanceID` FOREIGN KEY(`surveillanceID`)
REFERENCES `surveillance` (`surveillanceID`);

ALTER TABLE `stores` ADD CONSTRAINT `fk_stores_entomologicalID` FOREIGN KEY(`entomologicalID`)
REFERENCES `entomological` (`entomologicalID`);

ALTER TABLE `Purchases` ADD CONSTRAINT `fk_Purchases_OpreationsID` FOREIGN KEY(`OpreationsID`)
REFERENCES `opreations` (`OpreationsID`);

ALTER TABLE `Purchases` ADD CONSTRAINT `fk_Purchases_surveillanceID` FOREIGN KEY(`surveillanceID`)
REFERENCES `surveillance` (`surveillanceID`);

ALTER TABLE `Purchases` ADD CONSTRAINT `fk_Purchases_entomologicalID` FOREIGN KEY(`entomologicalID`)
REFERENCES `entomological` (`entomologicalID`);

ALTER TABLE `Purchases` ADD CONSTRAINT `fk_Purchases_AdminID` FOREIGN KEY(`AdminID`)
REFERENCES `admin` (`AdminID`);

CREATE INDEX `idx_admin_Name`
ON `admin` (`Name`);



