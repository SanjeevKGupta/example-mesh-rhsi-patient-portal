drop table if exists bills;
drop table if exists appointments;
drop table if exists appointment_requests;
drop table if exists patients;
drop table if exists doctors;

create table patients (
    id                      serial primary key,
    name                    varchar not null,
    zip                     varchar not null,
    phone                   varchar not null,
    email                   varchar not null
);

create table doctors (
    id                      serial primary key,
    name                    varchar not null,
    phone                   varchar,
    email                   varchar
);

create table appointment_requests (
    id                      serial primary key,
    patient_id              integer not null references patients,
    datetime                timestamp not null,
    description             varchar not null
);

create table appointments (
    id                      serial primary key,
    appointment_request_id  integer not null references appointment_requests,
    doctor_id               integer not null references doctors,
    datetime                timestamp not null
);

create table bills (
    id                      serial primary key,
    appointment_id          integer not null references appointments,
    amount_due              integer not null,
    payment_datetime        timestamp
);

create or replace function notify_changes() returns trigger as $$
declare
begin
    raise warning 'Changes!';
    notify changes;
    return new;
end;
$$ language plpgsql;

create trigger patients_changes
after insert or update or delete or truncate on patients
execute procedure notify_changes();

create trigger doctors_changes
after insert or update or delete or truncate on doctors
execute procedure notify_changes();

create trigger appointments_changes
after insert or update or delete or truncate on appointments
execute procedure notify_changes();

create trigger appointment_requests_changes
after insert or update or delete or truncate on appointment_requests
execute procedure notify_changes();

create trigger bills_changes
after insert or update or delete or truncate on bills
execute procedure notify_changes();

insert into patients
  (name, zip, phone, email)
values
  ('Roxy Renner', '01821', '206-455-7225', 'monkey@example.net'),
  ('Dwight Schrute', '02143', '555-102-3087', 'recyclops@example.net'),
  ('Gabe Lewis', '12345', '555-103-4098', 'skeletonman@example.net'),
  ('Jim Halpert', '98823', '617-234-5678', 'bigtuna@example.net'),
  ('Kelly Kapoor', '12345', '555-781-6723', 'businessb@example.net'),
  ('Kevin Malone', '12345', '555-123-3345', 'cookiemonster@example.net'),
  ('Michael Scott', '12345', '555-987-2345', 'scarn@example.net'),
  ('Oscar Martinez', '12345', '555-555-5555', 'actually@example.net'),
  ('Pam Beesly', '02474', '509-213-9901', 'pampam@example.net'),
  ('Ryan Howard', '88642', '274-754-2798', 'temp@example.net'),
  ('Toby Flenderson', '99891', '555-278-0870', 'theworst@example.net');

insert into doctors
  (name, phone, email)
values
  ('Benjamin Pierce', '555-555-1001', 'hawkeye@example.net'),
  ('Beverly Crusher', '555-555-1002', 'gates@example.net'),
  ('Derek Shepherd', '555-555-1010', 'mcdreamy@example.net'),
  ('Doogie Howser', '555-555-1003', 'neil@example.net'),
  ('Gregory House', '555-555-1011', 'hugh@example.net'),
  ('JD Dorian', '555-555-1012', 'bambi@example.net'),
  ('Leonard McCoy', '555-555-1004', 'bones@example.net'),
  ('Meredith Grey', '555-555-1013', 'person@example.net'),
  ('Michaela Quinn', '555-555-1005', 'drmike@example.net'),
  ('Miranda Bailey', '555-555-1006', 'chief@example.net');

insert into appointment_requests (patient_id, datetime, description)
values (1, current_timestamp, 'Knee surgery');

insert into appointment_requests (patient_id, datetime, description)
values (1, current_timestamp, 'Routine checkup');

insert into appointments(appointment_request_id, doctor_id, datetime)
values (1, 1, current_timestamp);

insert into bills(appointment_id, amount_due)
values (1, 400);

insert into appointment_requests (patient_id, datetime, description)
values (2, current_timestamp, 'Concussion');

insert into appointments(appointment_request_id, doctor_id, datetime)
values (3, 2, current_timestamp);

insert into bills(appointment_id, amount_due)
values (2, 350);
