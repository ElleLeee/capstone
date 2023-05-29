set linesize 130
set echo on

drop table capstone_sentReminders cascade constraints;
drop table capstone_reminder cascade constraints;
drop table capstone_appointment cascade constraints;
drop table capstone_service cascade constraints;
drop table capstone_availabletime cascade constraints;
drop table capstone_day cascade constraints;
drop table capstone_medicalform cascade constraints;
drop table capstone_consentform cascade constraints;
drop table capstone_user cascade constraints;
drop table capstone_role cascade constraints;

create table capstone_role(
    roleid integer constraint sys_capstone_role_PK PRIMARY key,
    constraint sys_capstone_role_roleid_ck check (roleid in (1,2)),
    role varchar2(25)
);


CREATE TABLE capstone_user (
    userid INTEGER GENERATED ALWAYS AS IDENTITY,
    constraint sys_capstone_user_pk PRIMARY key (userid),
    firstname VARCHAR2(25) NOT NULL,
    lastname VARCHAR2(25) NOT NULL,
    email_address VARCHAR2(50) CONSTRAINT sys_capstone_user_email_uk UNIQUE NOT NULL,
    CONSTRAINT sys_capstone_user_email_ck CHECK (REGEXP_LIKE(email_address, '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}')),
    phone_number CHAR(12) CONSTRAINT sys_capstone_user_phone_uk UNIQUE NOT NULL,
    CONSTRAINT sys_capstone_user_phone_ck CHECK (REGEXP_LIKE(phone_number, '[0-9]{3}')),
    password VARCHAR2(25) NOT NULL,
    roleid INTEGER default 1, --normal user
    CONSTRAINT sys_capstone_user_roleid_fk FOREIGN KEY (roleid) REFERENCES capstone_role (roleid),
    isactive INTEGER DEFAULT 1,
    CONSTRAINT sys_capstone_user_isactive_ck CHECK (isactive in (1,2))
);


-- create consent form here
--create medical form here

create table capstone_day(
    fulldate date not null,
    constraint sys_capstone_day_pk PRIMARY key (fulldate),
    year integer not null,
    dayname varchar2(10) not null,
    constraint sys_capstone_day_dayname_ck check (dayname in ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')),
    daynumber integer not null,
    constraint sys_capstone_day_daynumber_ck check (daynumber>0 and daynumber<=31),
    monthName varchar2(10) not null,
    constraint sys_capstone_day_monthname_ck check (monthname in ('January','February','March','April','May','June','July','August','September','October','November','December'))
);

create table capstone_availabletime(
    timeid INTEGER GENERATED ALWAYS AS IDENTITY,
    constraint sys_capstone_avaitime_pk PRIMARY key (timeid),
    fulldate date not null,
    --constraint sys_capstone_avai_time_pk PRIMARY key (day),
    constraint sys_capstone_avai_time_fk FOREIGN key (fulldate) REFERENCES capstone_day (fulldate),
    start_time integer not null,
    --constraint sys_capstone_avai_time_pk PRIMARY key (day,start_time),
    constraint sys_capstone_avai_time_start_ck check (start_time>0 and start_time<13),
    end_time integer not null,
    constraint sys_capstone_avai_time_end_ck check (end_time>0 and end_time<13)
);

create table capstone_service(
    serviceid integer constraint sys_capstone_service_pk PRIMARY key,
    serviceName varchar2(30) not null
);

create table capstone_appointment(
    appointmentid INTEGER GENERATED ALWAYS AS IDENTITY,
    constraint sys_capstone_appointment_pk PRIMARY key (appointmentid),
    userid integer not null,
    constraint  sys_capstone_appointment_userfk FOREIGN key (userid) REFERENCES capstone_user(userid),
    timeid INTEGER,
    constraint sys_capstone_appointment_timefk FOREIGN key (timeid) references capstone_availabletime (timeid),
    -- day date not null,
    -- constraint  sys_capstone_appointment_dayfk FOREIGN key (day) REFERENCES capstone_availabletime(day),
    -- start_time integer not null,
    -- constraint  sys_capstone_appointment_startfk FOREIGN key (start_time) REFERENCES capstone_availabletime(start_time),
    -- end_time integer not null,
    -- constraint  sys_capstone_appointment_endfk FOREIGN key (end_time) REFERENCES capstone_availabletime(end_time),
    serviceid integer not null,
    constraint  sys_capstone_appointment_servicefk FOREIGN key (serviceid) REFERENCES capstone_service(serviceid),
    description varchar2(250),
    isupcoming integer default 1,
    constraint sys_capstone_appt_upcoming_ck check (isupcoming in (1,2)) --1 = hasnt passed yet
    --2 = appt has passed
);

create table capstone_reminder(
    reminderid INTEGER GENERATED ALWAYS AS IDENTITY,
    constraint sys_capstone_reminder_pk PRIMARY key (reminderid),
    userid integer not null,
    constraint  sys_capstone_reminder_userfk FOREIGN key (userid) REFERENCES capstone_user(userid),
    appointmentid integer not null,
    constraint  sys_capstone_reminder_apptfk FOREIGN key (appointmentid) REFERENCES capstone_appointment(appointmentid),
    typereminder integer not null,
    constraint sys_capstone_reminder_type_ck check (typereminder in (1,2,3)),
    sendTime date not null
    -- CONSTRAINT sys_capstone_reminder_sendtime_ck CHECK (sendTime = dateadd(day, -1, (SELECT start_time FROM capstone_appointment WHERE appointmentid = capstone_reminder.appointmentid)))
);

create table capstone_sentReminders(
    reminderid not null PRIMARY key,
    constraint sys_sent_reminder_fk FOREIGN key (reminderid) references capstone_reminder (reminderid)
);
