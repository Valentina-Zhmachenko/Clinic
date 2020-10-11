create schema clinic;

create table clinic.patient(
    id bigserial primary key,
    full_name text unique,
    birthdate date,
    phone_number text
);
