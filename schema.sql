create schema clinic;

create table clinic.patient(
    id 			bigserial primary key,
    full_name 		text not null,
    birthday 		date,
    phone_number 	character varying(11) unique 
);

create table clinic.position_doctor(
    id 		        bigserial primary key,
    position_name 	text not null,
    description 	text not null
);

create table clinic.department(
    id 			bigserial primary key,
    department_name     text not null,
    floor_number 	int not null default 1 check(floor_number > 0 and floor_number < 16)
);

create table clinic.service(
    id 			bigserial primary key,
    service 		text not null,
    price 		money not null
);

create table clinic.doctor(
    id 			bigserial primary key,
    position_id 	bigserial,
    department_id 	bigserial,	
    full_name 		text not null,
    phone_number 	character varying(11) unique not null,
    constraint fk_position foreign key(position_id) references clinic.position_doctor(id),
    constraint fk_department foreign key(department_id) references clinic.department(id)
);

create table clinic.doctor_visit(
    id                  bigserial primary key,
    doctor_id 		bigserial,
    patient_id 		bigserial,
    service_id 		bigserial,
    visit_date 		date not null,
    price 		money not null,
    constraint fk_doctor foreign key(doctor_id) references clinic.doctor(id),
    constraint fk_patient foreign key(patient_id) references clinic.patient(id),
    constraint fk_service foreign key(service_id) references clinic.service(id)
);

insert into clinic.patient (full_name, birthday, phone_number) values 
    ('Седых Иван Петрович',            '1996-12-02',  89203347656),
    ('Лагутина Мария Степановна',      '2000-02-03',  89208647477),
    ('Ильин Андрей Сергеевич',         '1990-05-17',  89293363312),
    ('Пономарев Степан Александрович', '1975-02-09',  89305589090),   
    ('Левина Наталья Алексеевна',      '1998-10-13',  89203458987),
    ('Слепцова Наталья Сергеевна',     '1958-11-24',  89206588997);

insert into clinic.position_doctor (position_name, description) values
    ('Нейрохирург',      'Диагностика и хирургическое лечение заболеваний центральной и периферической нервной систем'),
    ('Терапевт',         'Диагностика, лечение и профилактика заболеваний внутренних органов и систем'),
    ('Офтальмолог',      'Диагностика, лечение и профилактика глазных заболеваний'),
    ('Травматолог',      'Лечение механических повреждений, ожогов, болезней и других нарушений опорно-двигательного аппарата'),
    ('Хирург',           'Диагностика и лечение патологических состояний, требующих оперативного вмешательства'),
    ('Невролог',         'Диагностика и лечение болезней, связанных с нервной системой'),
    ('Анастезиолог',     'Обеспечение безопасности больного во время операции и в ближайший послеоперационный период'),
    ('Дерматовенеролог', 'Диагностика, профилактика и лечение венерических и кожных заболеваний');

insert into clinic.department (department_name, floor_number) values
    ('Терапевтическое',     3),
    ('Офтальмологическое',  9),
    ('Хирургическое',       5),
    ('Травматологическое',  11),
    ('Неврологическое',     2),
    ('Нейрохирургическое ', 4);

insert into clinic.service (service, price) values
    ('Лечение в дневном стационаре', 980),
    ('Офтальмоскопия', 1250),
    ('Внутривенное введение лекарственного препарата', 400),
    ('Дерматоскопия', 1200),
    ('Наложение гипса на плечо', 500),
    ('Лечение астигматизма', 3000),
    ('Рентгеноскопия', 1200);

insert into clinic.doctor (full_name, phone_number, position_id, department_id) values
    ('Соболев Илья Семенович',       89298874465, 6, 3),
    ('Перова Мария Евгеньевна',      89203321459, 1, 4),
    ('Корнев Аретем Александрович',  89208498524, 5, 1),
    ('Белова Виктория Александровна',89301254288, 4, 2),
    ('Сошин Александ Александрович', 89307749075, 3, 2),
    ('Шишлов Сергей Васильевич',     89290083432, 7, 5);

insert into clinic.doctor_visit (visit_date, price, doctor_id, patient_id, service_id) values
    ('1991-12-01', 1250, 4, 1, 2),
    ('2008-10-29', 1250, 4, 3, 1),
    ('2005-03-30', 500,  6, 5, 7),
    ('1990-06-09', 3000, 4, 1, 4),
    ('2002-11-14', 500,  6, 1, 3),
    ('1999-09-19', 400,  1, 2, 1),
    ('1999-06-08', 400,  1, 5, 5),
    ('1987-12-05', 980,  3, 4, 2)



















