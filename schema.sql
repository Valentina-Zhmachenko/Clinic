create schema clinic;

create table clinic.patient(
    id bigserial primary key,
    full_name text,
    birthdate date,
    phone_number int
);

create table clinic.doctor_visit(
	id bigserial primary key,
	doctor_id bigserial,
	patient_id bigserial,
	service_id bigserial,
	visit_date date,
	price money,
	constraint fk_doctor foreign key(doctor_id) references doctor(id),
	constraint fk_patient foreign key(patient_id) references patient(id),
	constraint fk_service foreign key(service_id) references service(id)
);

create table clinic.service(
	id bigserial primary key,
	service text,
	price money
);

create table clinic.doctor(
	id bigserial primary key,
	position_id bigserial,
	department_id bigserial,	
	full_name text,
	phone_number int,
	constraint fk_position foreign key(position_id) references position(id),
	constraint fk_department foreign key(department_id) references department(id),
);

create table clinic.position(
	id bigserial primary key,
	position_name text,
	description text
);

create table clinic.department(
	id bigserial primary key,
	department_name text,
	floor_number int
);
