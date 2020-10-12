create schema clinic;

create table clinic.patient(
    	id 		bigserial primary key,
    	full_name 	text not null,
    	birthdate 	date,
    	phone_number 	character varying(11) unique 
);

create table clinic.position_doctor(
	id 		bigserial primary key,
	position_name 	text not null,
	description 	text not null
);

create table clinic.department(
	id 		bigserial primary key,
	department_name text not null,
	floor_number 	int not null default 1 check(floor_number > 0 and floor_number < 16)
);

create table clinic.service(
	id 		bigserial primary key,
	service 	text not null,
	price 		money not null
);

create table clinic.doctor(
	id 		bigserial primary key,
	position_id 	int,
	department_id 	int,	
	full_name 	text not null,
	phone_number 	int unique not null,
	constraint fk_position   foreign key(position_id)   references clinic.position_doctor(id),
    	constraint fk_department foreign key(department_id) references clinic.department(id)
);

create table clinic.doctor_visit(
	id              bigserial primary key,
	doctor_id 	int,
	patient_id 	int,
	service_id 	int,
	visit_date 	date not null,
	price 		money not null,
	constraint fk_doctor  foreign key(doctor_id)  references clinic.doctor(id),
	constraint fk_patient foreign key(patient_id) references clinic.patient(id),
    	constraint fk_service foreign key(service_id) references clinic.service(id)
);
