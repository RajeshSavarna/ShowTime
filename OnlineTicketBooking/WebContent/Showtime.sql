CREATE table "MOVIE_DETAIL" (
    "MOVIE_ID"     NUMBER NOT NULL,
    "TITLE"        VARCHAR2(40) NOT NULL,
    "IMAGE"        VARCHAR2(400),
    "GENRE"        VARCHAR2(40),
    "LANGUAGE"     VARCHAR2(10),
    "CERTIFICATE"  VARCHAR2(10),
    "DURATION"     VARCHAR2(40),
    "CAST"         VARCHAR2(400),
    "DIRECTOR"     VARCHAR2(40),
    "TRAILER_URL"  VARCHAR2(400),
    "DESCRIPTION"  VARCHAR2(4000),
    "RELEASE_DATE" DATE,
    "RATING"       VARCHAR2(40),
    constraint  "MOVIE_DETAIL_PK" primary key ("MOVIE_ID")
)
/

CREATE sequence "MOVIE_DETAIL_SEQ" 
/

CREATE trigger "BI_MOVIE_DETAIL"  
  before insert on "MOVIE_DETAIL"              
  for each row 
begin  
    select "MOVIE_DETAIL_SEQ".nextval into :NEW.MOVIE_ID from dual;
end;

/


CREATE table "USER_DETAIL" (
    "USER_ID"    NUMBER NOT NULL,
    "NAME"       VARCHAR2(50) NOT NULL,
    "GENDER"     VARCHAR2(10),
    "EMAIL"      VARCHAR2(40) NOT NULL,
    "PASSWORD"   VARCHAR2(40) NOT NULL,
    "CONTACT"    VARCHAR2(15),
    "ADDRESS"    VARCHAR2(100),
    "CITY"       VARCHAR2(40) NOT NULL,
    "STATE"      VARCHAR2(40) NOT NULL,
    constraint  "USER_DETAIL_PK" primary key ("USER_ID")
)
/

CREATE sequence "USER_DETAIL_SEQ" 
/

CREATE trigger "BI_USER_DETAIL"  
  before insert on "USER_DETAIL"              
  for each row 
begin  
    select "USER_DETAIL_SEQ".nextval into :NEW.USER_ID from dual;
end;
/   


CREATE table "THEATRE_DETAIL" (
    "THEATRE_ID"     NUMBER NOT NULL,
    "NAME"           VARCHAR2(40) NOT NULL,
    "ADDRESS"        VARCHAR2(400) NOT NULL,
    "CITY"           VARCHAR2(40) NOT NULL,
    "STATE"          VARCHAR2(40) NOT NULL,
    "CONTACT_PERSON" VARCHAR2(40),
    "CONTACT_NUMBER" VARCHAR2(15),
    constraint  "THEATRE_DETAIL_PK" primary key ("THEATRE_ID")
)
/

CREATE sequence "THEATRE_DETAIL_SEQ" 
/

CREATE trigger "BI_THEATRE_DETAIL"  
  before insert on "THEATRE_DETAIL"              
  for each row 
begin  
    select "THEATRE_DETAIL_SEQ".nextval into :NEW.THEATRE_ID from dual;
end;
/   

CREATE TABLE  "SHOW_DETAIL" 
   (	"SHOW_ID" NUMBER NOT NULL ENABLE, 
	"MOVIE_ID" NUMBER NOT NULL ENABLE, 
	"THEATRE_ID" NUMBER NOT NULL ENABLE, 
	"SHOW_DATE" TIMESTAMP (0) NOT NULL ENABLE, 
	"BOOKED_SEAT" VARCHAR2(4000), 
	"PRICE" NUMBER NOT NULL ENABLE, 
	 CONSTRAINT "SHOW_DETAIL_PK" PRIMARY KEY ("SHOW_ID") ENABLE
   )
/
CREATE sequence "SHOW_DETAIL_SEQ" 
/
CREATE OR REPLACE TRIGGER  "BI_SHOW_DETAIL" 
  before insert on "SHOW_DETAIL"               
  for each row  
begin   
    select "SHOW_DETAIL_SEQ".nextval into :NEW.SHOW_ID from dual; 
end; 

/

CREATE table "BOOKING_DETAIL" (
    "BOOKING_ID"     NUMBER NOT NULL,
    "ORDER_DATE"     TIMESTAMP NOT NULL,
    "MOVIE_NAME"     VARCHAR2(40) NOT NULL,
    "LANGUAGE"       VARCHAR2(40) NOT NULL,
    "CERTIFICATE"    VARCHAR2(40) NOT NULL,
    "THEATRE_NAME"   VARCHAR2(40) NOT NULL,
    "CITY"           VARCHAR2(40) NOT NULL,
    "ADDRESS"        VARCHAR2(400) NOT NULL,
    "STATE"          VARCHAR2(40) NOT NULL,
    "SHOW_ID"        NUMBER NOT NULL,
    "SHOW_DATE"      TIMESTAMP NOT NULL,
    "PRICE"          NUMBER NOT NULL,
    "SEAT_NUMBER"    VARCHAR2(400) NOT NULL,
    "SEAT_QTY"       NUMBER NOT NULL,
    "TAX"            NUMBER NOT NULL,
    "T_COST"         NUMBER NOT NULL,
    "TOTAL_COST"     NUMBER NOT NULL,
    "CUSTOMER_EMAIL" VARCHAR2(400),
    "CONTACT"        VARCHAR2(40),
    constraint  "BOOKING_DETAIL_PK" primary key ("BOOKING_ID")
)
/

CREATE sequence "BOOKING_DETAIL_SEQ" 
/

CREATE trigger "BI_BOOKING_DETAIL"  
  before insert on "BOOKING_DETAIL"              
  for each row 
begin  
    select "BOOKING_DETAIL_SEQ".nextval into :NEW.BOOKING_ID from dual;
end;
/   