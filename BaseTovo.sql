CREATE DATABASE gestion_entreprise;

\c gestion_entreprise;

CREATE SCHEMA IF NOT EXISTS "public";

CREATE SEQUENCE "public".adresse_id_adresse_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".besoin_id_besoin_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".diplome_id_diplome_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".experience_id_experience_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".salaire_id_salaire_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".service_id_service_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".sexe_id_sexe_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".task_id_task_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".unity_id_unity_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".utilisateur_id_utilisateur_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".wanted_profile_id_wanted_profile_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".workload_id_workload_seq START WITH 20 INCREMENT BY 1;

CREATE  TABLE "public".adresse ( 
	id_adresse            integer DEFAULT nextval('adresse_id_adresse_seq'::regclass) NOT NULL  ,
	adresse              varchar(50)    ,
	status               numeric    ,
	CONSTRAINT adresse_pkey PRIMARY KEY ( id_adresse )
 );

CREATE  TABLE "public".diplome ( 
	id_diplome            integer DEFAULT nextval('diplome_id_diplome_seq'::regclass) NOT NULL  ,
	diplome              varchar(50)    ,
	status               numeric    ,
	CONSTRAINT diplome_pkey PRIMARY KEY ( id_diplome )
 );

CREATE  TABLE "public".experience ( 
	id_experience         integer DEFAULT nextval('experience_id_experience_seq'::regclass) NOT NULL  ,
	experience           varchar(50)    ,
	status               numeric    ,
	CONSTRAINT experience_pkey PRIMARY KEY ( id_experience )
 );

CREATE  TABLE "public".salaire ( 
	id_salaire            integer DEFAULT nextval('salaire_id_salaire_seq'::regclass) NOT NULL  ,
	salaire              double precision    ,
	status               numeric    ,
	CONSTRAINT salaire_pkey PRIMARY KEY ( id_salaire )
 );

CREATE  TABLE "public".service ( 
	id_service            integer DEFAULT nextval('service_id_service_seq'::regclass) NOT NULL  ,
	service              varchar(50)    ,
	fonction             varchar(50)    ,
	creation_date         date    ,
	status               numeric    ,
	CONSTRAINT service_pkey PRIMARY KEY ( id_service )
 );

CREATE  TABLE "public".sexe ( 
	id_sexe               integer DEFAULT nextval('sexe_id_sexe_seq'::regclass) NOT NULL  ,
	sexe                 varchar(20)    ,
	status               numeric    ,
	CONSTRAINT sexe_pkey PRIMARY KEY ( id_sexe )
 );

CREATE  TABLE "public".society ( 
	name                 varchar(50)    ,
	adresse              varchar(50)    ,
	nif                  varchar(50)    ,
	contact              varchar(25)    ,
	secteur              varchar(20)    ,
	legal_statut         numeric    
 );

CREATE  TABLE "public".unity ( 
	id_unity              integer DEFAULT nextval('unity_id_unity_seq'::regclass) NOT NULL  ,
	unity                varchar(20)    ,
	status               numeric    ,
	CONSTRAINT unity_pkey PRIMARY KEY ( id_unity )
 );

CREATE  TABLE "public".utilisateur ( 
	id_utilisateur        integer DEFAULT nextval('utilisateur_id_utilisateur_seq'::regclass) NOT NULL  ,
	id_service            integer    ,
	username             varchar(20)    ,
	"password"           varchar(20)    ,
	mail                 varchar(30)    ,
	status               numeric    ,
	CONSTRAINT utilisateur_pkey PRIMARY KEY ( id_utilisateur )
 );

CREATE  TABLE "public".wanted_profile ( 
	id_wanted_profile      integer DEFAULT nextval('wanted_profile_id_wanted_profile_seq'::regclass) NOT NULL  ,
	poste                varchar(50)    ,
	id_service            integer    ,
	status               numeric    ,
	CONSTRAINT wanted_profile_pkey PRIMARY KEY ( id_wanted_profile )
 );

CREATE  TABLE "public".adresse_note ( 
	id_wanted_profile      integer    ,
	id_adresse            integer    ,
	note                 numeric    
 );

CREATE  TABLE "public".besoin ( 
	id_besoin             integer DEFAULT nextval('besoin_id_besoin_seq'::regclass) NOT NULL  ,
	id_service            integer    ,
	creation_date         date    ,
	description          varchar(200)    ,
	status               numeric    ,
	CONSTRAINT besoin_pkey PRIMARY KEY ( id_besoin )
 );

CREATE  TABLE "public".diplome_note ( 
	id_wanted_profile      integer    ,
	id_diplome            integer    ,
	note                 numeric    
 );

CREATE  TABLE "public".experience_note ( 
	id_wanted_profile      integer    ,
	id_experience         integer    ,
	note                 numeric    
 );

CREATE  TABLE "public".salaire_note ( 
	id_wanted_profile      integer    ,
	id_salaire            integer    ,
	note                 numeric    
 );

CREATE  TABLE "public".sexe_note ( 
	id_wanted_profile      integer    ,
	id_sexe               integer    ,
	note                 numeric    
 );

CREATE  TABLE "public".task ( 
	id_task               integer DEFAULT nextval('task_id_task_seq'::regclass) NOT NULL  ,
	id_besoin             integer    ,
	task                 varchar(150)    ,
	status               numeric    ,
	CONSTRAINT task_pkey PRIMARY KEY ( id_task )
 );

CREATE  TABLE "public".workload ( 
	id_workload           integer DEFAULT nextval('workload_id_workload_seq'::regclass) NOT NULL  ,
	id_besoin             integer    ,
	id_wanted_profile      integer    ,
	quantity             numeric    ,
	id_unity              integer    ,
	CONSTRAINT workload_pkey PRIMARY KEY ( id_workload )
 );

ALTER TABLE "public".adresse_note ADD CONSTRAINT adresse_note_id_adresse_fkey FOREIGN KEY ( id_adresse ) REFERENCES "public".adresse( id_adresse );

ALTER TABLE "public".adresse_note ADD CONSTRAINT adresse_note_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile );

ALTER TABLE "public".besoin ADD CONSTRAINT besoin_id_service_fkey FOREIGN KEY ( id_service ) REFERENCES "public".service( id_service );

ALTER TABLE "public".diplome_note ADD CONSTRAINT diplome_note_id_diplome_fkey FOREIGN KEY ( id_diplome ) REFERENCES "public".diplome( id_diplome );

ALTER TABLE "public".diplome_note ADD CONSTRAINT diplome_note_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile );

ALTER TABLE "public".experience_note ADD CONSTRAINT experience_note_id_experience_fkey FOREIGN KEY ( id_experience ) REFERENCES "public".experience( id_experience );

ALTER TABLE "public".experience_note ADD CONSTRAINT experience_note_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile );

ALTER TABLE "public".salaire_note ADD CONSTRAINT salaire_note_id_salaire_fkey FOREIGN KEY ( id_salaire ) REFERENCES "public".salaire( id_salaire );

ALTER TABLE "public".salaire_note ADD CONSTRAINT salaire_note_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile );

ALTER TABLE "public".sexe_note ADD CONSTRAINT sexe_note_id_sexe_fkey FOREIGN KEY ( id_sexe ) REFERENCES "public".sexe( id_sexe );

ALTER TABLE "public".sexe_note ADD CONSTRAINT sexe_note_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile );

ALTER TABLE "public".task ADD CONSTRAINT task_id_besoin_fkey FOREIGN KEY ( id_besoin ) REFERENCES "public".besoin( id_besoin );

ALTER TABLE "public".utilisateur ADD CONSTRAINT utilisateur_id_service_fkey FOREIGN KEY ( id_service ) REFERENCES "public".service( id_service );

ALTER TABLE "public".wanted_profile ADD CONSTRAINT wanted_profile_id_service_fkey FOREIGN KEY ( id_service ) REFERENCES "public".service( id_service );

ALTER TABLE "public".workload ADD CONSTRAINT workload_id_besoin_fkey FOREIGN KEY ( id_besoin ) REFERENCES "public".besoin( id_besoin );

ALTER TABLE "public".workload ADD CONSTRAINT workload_id_unity_fkey FOREIGN KEY ( id_unity ) REFERENCES "public".unity( id_unity );

ALTER TABLE "public".workload ADD CONSTRAINT workload_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile );

INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 1, 'Andoharanofotsy', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 2, 'Itaosy', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 3, 'Tanjombato', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 4, 'Analakely', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 5, 'Ambohidratrimo', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 6, 'Talatamaty', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 7, 'Behenjy', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 8, 'Imerintsiatosika', 1);
INSERT INTO "public".diplome( id_diplome, diplome, status ) VALUES ( 1, 'CEPE', 1);
INSERT INTO "public".diplome( id_diplome, diplome, status ) VALUES ( 2, 'BEPC', 1);
INSERT INTO "public".diplome( id_diplome, diplome, status ) VALUES ( 3, 'BACC', 1);
INSERT INTO "public".diplome( id_diplome, diplome, status ) VALUES ( 4, 'Licence en info', 1);
INSERT INTO "public".diplome( id_diplome, diplome, status ) VALUES ( 5, 'Master en info', 1);
INSERT INTO "public".diplome( id_diplome, diplome, status ) VALUES ( 6, 'Doctorat en info', 1);
INSERT INTO "public".diplome( id_diplome, diplome, status ) VALUES ( 7, 'licence en gestion', 1);
INSERT INTO "public".diplome( id_diplome, diplome, status ) VALUES ( 8, 'master en gestion', 1);
INSERT INTO "public".diplome( id_diplome, diplome, status ) VALUES ( 9, 'licence en managment', 1);
INSERT INTO "public".diplome( id_diplome, diplome, status ) VALUES ( 10, 'master en managment', 1);
INSERT INTO "public".experience( id_experience, experience, status ) VALUES ( 1, '1 an d`experience', 1);
INSERT INTO "public".experience( id_experience, experience, status ) VALUES ( 2, '3 ans d`experiences', 1);
INSERT INTO "public".experience( id_experience, experience, status ) VALUES ( 3, '5 ans d`experiences', 1);
INSERT INTO "public".salaire( id_salaire, salaire, status ) VALUES ( 1, 200000.0, 1);
INSERT INTO "public".salaire( id_salaire, salaire, status ) VALUES ( 2, 300000.0, 1);
INSERT INTO "public".salaire( id_salaire, salaire, status ) VALUES ( 3, 500000.0, 1);
INSERT INTO "public".salaire( id_salaire, salaire, status ) VALUES ( 4, 700000.0, 1);
INSERT INTO "public".salaire( id_salaire, salaire, status ) VALUES ( 5, 1000000.0, 1);
INSERT INTO "public".salaire( id_salaire, salaire, status ) VALUES ( 6, 1500000.0, 1);
INSERT INTO "public".salaire( id_salaire, salaire, status ) VALUES ( 7, 2000000.0, 1);
INSERT INTO "public".service( id_service, service, fonction, creation_date, status ) VALUES ( 1, 'Securite', 'Securite du Batiment', '2000-10-20', 1);
INSERT INTO "public".service( id_service, service, fonction, creation_date, status ) VALUES ( 2, 'Ressources humaines', 'Gestion horaire', '2000-10-22', 1);
INSERT INTO "public".service( id_service, service, fonction, creation_date, status ) VALUES ( 3, 'Informatique', 'Responsable info', '2000-10-24', 1);
INSERT INTO "public".service( id_service, service, fonction, creation_date, status ) VALUES ( 4, 'Transport', 'service de transport', '2000-10-26', 1);
INSERT INTO "public".sexe( id_sexe, sexe, status ) VALUES ( 1, 'Homme', 1);
INSERT INTO "public".sexe( id_sexe, sexe, status ) VALUES ( 2, 'Femme', 1);
INSERT INTO "public".society( name, adresse, nif, contact, secteur, legal_statut ) VALUES ( 'AUXIMAD', 'Antananarivo', '0012-8221', '+261346595861', 'Informatique', 1);
INSERT INTO "public".unity( id_unity, unity, status ) VALUES ( 1, 'H/J', 1);
INSERT INTO "public".unity( id_unity, unity, status ) VALUES ( 2, 'H/S', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 1, 1, 'Ravao securite', 'Ravao123', 'Ravao@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 2, 1, 'Ralay securite', 'Ralay123', 'Ralay@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 3, 1, 'Bernard securite', 'Bernard123', 'Bernard@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 4, 2, 'Lili RH', 'Lili000', 'Lili@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 5, 2, 'Lanto RH', 'Lanto000', 'Lanto@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 6, 2, 'Voahirana RH', 'Voahirana000', 'Voahirana@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 7, 3, 'Andry Info', 'Andry111', 'Andry@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 8, 3, 'Koto Info', 'koto111', 'Koto@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 9, 3, 'Steave Info', 'Steave111', 'Steave@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 10, 4, 'Larry Transport', 'Larry111', 'Larry@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 11, 4, 'Solo Transport', 'Solo111', 'Solo@gmail.com', 1);
INSERT INTO "public".utilisateur( id_utilisateur, id_service, username, "password", mail, status ) VALUES ( 12, 4, 'Benja Transport', 'Benja111', 'Benja@gmail.com', 1);
INSERT INTO "public".wanted_profile( id_wanted_profile, poste, id_service, status ) VALUES ( 1, 'Developper', 3, 1);
INSERT INTO "public".wanted_profile( id_wanted_profile, poste, id_service, status ) VALUES ( 2, 'Team Leader', 3, 1);
INSERT INTO "public".wanted_profile( id_wanted_profile, poste, id_service, status ) VALUES ( 3, 'Chauffeur', 4, 1);
INSERT INTO "public".wanted_profile( id_wanted_profile, poste, id_service, status ) VALUES ( 4, 'Securite', 1, 1);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 1, 1, 5);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 1, 2, 6);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 1, 4, 10);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 2, 1, 5);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 2, 2, 8);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 2, 4, 10);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 3, 4, 10);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 3, 5, 6);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 3, 2, 7);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 4, 4, 10);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 4, 2, 5);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 4, 6, 3);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 4, 3, 6);
INSERT INTO "public".besoin( id_besoin, id_service, creation_date, description, status ) VALUES ( 1, 3, '2023-08-12', 'Renforcement dev', 1);
INSERT INTO "public".besoin( id_besoin, id_service, creation_date, description, status ) VALUES ( 2, 3, '2023-08-20', 'Recherche Tl', 1);
INSERT INTO "public".besoin( id_besoin, id_service, creation_date, description, status ) VALUES ( 3, 4, '2023-08-30', 'Recherche Chauffeur', 1);
INSERT INTO "public".besoin( id_besoin, id_service, creation_date, description, status ) VALUES ( 4, 1, '2023-09-30', 'Recherche Securite', 1);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 1, 4, 8);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 1, 5, 10);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 2, 5, 8);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 2, 6, 10);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 3, 2, 5);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 3, 3, 10);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 4, 1, 5);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 4, 2, 8);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 4, 3, 10);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 1, 1, 5);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 1, 2, 7);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 1, 3, 10);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 2, 2, 5);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 2, 3, 10);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 3, 1, 5);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 3, 2, 8);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 3, 2, 10);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 4, 1, 6);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 4, 2, 8);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 4, 3, 10);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 2, 1, 0);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 1, 4, 8);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 1, 5, 6);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 2, 5, 6);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 2, 6, 8);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 3, 1, 8);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 3, 2, 6);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 4, 2, 6);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 4, 1, 10);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 1, 1, 8);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 1, 2, 10);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 2, 2, 10);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 2, 1, 9);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 3, 1, 10);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 4, 1, 10);
INSERT INTO "public".task( id_task, id_besoin, task, status ) VALUES ( 1, 1, 'Coder un application', 1);
INSERT INTO "public".task( id_task, id_besoin, task, status ) VALUES ( 2, 2, 'Aide aux conceptions', 1);
INSERT INTO "public".task( id_task, id_besoin, task, status ) VALUES ( 3, 3, 'Aide a la conduite', 1);
INSERT INTO "public".task( id_task, id_besoin, task, status ) VALUES ( 4, 4, 'Aide aux gardienage', 1);
INSERT INTO "public".workload( id_workload, id_besoin, id_wanted_profile, quantity, id_unity ) VALUES ( 1, 1, 1, 2, 1);
INSERT INTO "public".workload( id_workload, id_besoin, id_wanted_profile, quantity, id_unity ) VALUES ( 2, 2, 2, 1, 1);
INSERT INTO "public".workload( id_workload, id_besoin, id_wanted_profile, quantity, id_unity ) VALUES ( 3, 3, 3, 1, 1);
INSERT INTO "public".workload( id_workload, id_besoin, id_wanted_profile, quantity, id_unity ) VALUES ( 4, 4, 4, 1, 1);


-- View pour afficher l'utilisateur avec son service
CREATE VIEW v_user_service AS
SELECT u.*, s.service, s.fonction, s.creation_date FROM utilisateur u 
JOIN service s ON u.id_service = s.id_service;

create or replace view v_salaire_note as
select dn.id_wanted_profile, dn.id_salaire, dn.note, d.salaire, d.status
from salaire_note dn
join salaire d
on d.id_salaire = dn.id_salaire
where d.status = 1;

create or replace view v_sexe_note as
select dn.id_wanted_profile, dn.id_sexe, dn.note, d.sexe, d.status
from sexe_note dn
join sexe d
on d.id_sexe = dn.id_sexe
where d.status = 1;

create or replace view v_experience_note as
select dn.id_wanted_profile, dn.id_experience, dn.note, d.experience, d.status
from experience_note dn
join experience d
on d.id_experience = dn.id_experience
where d.status = 1;

create or replace view v_adresse_note as
select dn.id_wanted_profile, dn.id_adresse, dn.note, d.adresse, d.status
from adresse_note dn
join adresse d
on d.id_adresse = dn.id_adresse
where d.status = 1;

create or replace view v_diplome_note as
select dn.id_wanted_profile, dn.id_diplome, dn.note, d.diplome, d.status
from diplome_note dn
join diplome d
on d.id_diplome = dn.id_diplome
where d.status = 1;

create table candidature(
    id_candidature serial primary key,
    id_wanted_profile int references wanted_profile(id_wanted_profile),
    deposit_date date,
    name varchar(30),
    first_name varchar(30),
    birth_date date,
    id_adresse int references adresse(id_adresse),
    email varchar(30),
    id_sexe int references sexe(id_sexe),
    id_experience int references experience(id_experience),
    id_diplome int references diplome(id_diplome),
    interest_center varchar(30),
    salary_expectation double precision,
    self_profile varchar(200),
    photo varchar(20),
    dossier varchar(30),
    note double precision,
    status int 
);

create table professional_career(
    id_professional_career serial primary key,
    id_candidature int references candidature(id_candidature),
    start_date date,
    end_date date,
    society varchar(30),
    poste varchar(30),
    task varchar(100)
);
create table formation_base(
    id_formation_base serial primary key,
    id_candidature int references candidature(id_candidature),
    year varchar(20),
    diplome varchar(30),
    school varchar(50)
);


create table candidature(
    id_candidature serial primary key,
    id_wanted_profile int references wanted_profile(id_wanted_profile),
    deposit_date date,
    name varchar(30),
    first_name varchar(30),
    birth_date date,
    id_adresse int references adresse(id_adresse),
    email varchar(30),
    id_sexe int references sexe(id_sexe),
    id_experience int references experience(id_experience),
    id_diplome int references diplome(id_diplome),
    interest_center varchar(30),
    salary_expectation double precision,
    self_profile varchar(200),
    photo varchar(20),
    dossier varchar(30),
    note double precision,
    status int 
);

insert into candidature values (default, 1, '2022-02-02', 'Inssa', 'Chalman', '2002-06-19', 1, 'chalman@gmail.com', 1, 1, 3, 'dessiner', 1000000.00, 'Tres hate de vous connaitre', 'maPhoto.png', 'dossier.zip', 6.0, 1);
insert into candidature values (default, 2, '2022-02-02', 'Inssa', 'Zaid', '2002-06-19', 1, 'zaid@gmail.com', 1, 1, 3, 'manger', 1000000.00, 'Motiver de jour en jour', 'maPhoto.png', 'dossier.zip', 5.0, 1);
insert into candidature values (default, 3, '2022-02-02', 'Rasoa', 'Miora', '2002-06-19', 1, 'miora@gmail.com', 2, 1, 3, 'etudier', 1000000.00, 'Je veux apprendre encore plus', 'maPhoto.png', 'dossier.zip', 6.0, 1);
insert into candidature values (default, 4, '2022-02-02', 'Mangany', 'Barbarah', '2002-06-19', 1, 'Barbarah@gmail.com', 2, 1, 3, 'Sport', 1000000.00, 'La joie inspire', 'maPhoto.png', 'dossier.zip', 6.0, 1);

insert into professional_career values (default, 1, '2022-06-10', '2023-05-12', 'inssa studio', 'testeur', 'tester les applications');
insert into professional_career values (default, 2, '2023-01-23', '2023-07-25', 'Habibo', 'livreur', 'livrer les marchandises chez lez clients');
insert into professional_career values (default, 3, '2020-03-04', '2023-02-11', 'Helmica', 'developpeur', 'Developper des logiciels');
insert into professional_career values (default, 4, '2019-03-17', '2023-03-17', 'Grove', 'designer', 'donner des designs aux marchandises');

create table professional_career(
    id_professional_career serial primary key,
    id_candidature int references candidature(id_candidature),
    start_date date,
    end_date date,
    society varchar(30),
    poste varchar(30),
    task varchar(100)
);

create table formation_base(
    id_formation_base serial primary key,
    id_candidature int references candidature(id_candidature),
    year varchar(20),
    diplome varchar(30),
    school varchar(50)
);

create table annonce (
    id_annonce serial primary key,
    id_besoin integer,
    id_service integer,
    nom_annonce varchar(100),
    date_annonce date,
    status integer,
    foreign key(id_besoin) references besoin(id_besoin),
    foreign key(id_service) references service(id_service)
);

insert into annonce(id_annonce, id_besoin, id_service, nom_annonce, date_annonce, status) values(default, 1, 3, '2023-08-30_Transport_annonce.png','2023-08-30', 1);
insert into annonce(id_annonce, id_besoin, id_service, nom_annonce, date_annonce, status) values(default, 4, 1, '2023-09-30_Securite_annonce.png','2023-09-30', 1);
insert into annonce(id_annonce, id_besoin, id_service, nom_annonce, date_annonce, status) values(default, 20, 3, '2023-10-14_Ressources humaines_annonce.png','2023-10-14', 1);

create view v_user_service as 
select u.*, s.service, s.fonction, s.creation_date from utilisateur u 
join service s on u.id_service = s.id_service;

create view v_diplome_wanted_profile as
select dn.id_wanted_profile,dn.id_diplome, wp.id_service, d.diplome, dn.note, wp.poste, 
d.status as status_diplome, wp.status as status_wanted_profile from diplome_note dn 
join diplome d on dn.id_diplome=d.id_diplome 
join wanted_profile wp on wp.id_wanted_profile=dn.id_wanted_profile;

create view v_experience_wanted_profile as
select en.id_wanted_profile, en.id_experience, wp.id_service, e.experience, en.note, wp.poste, 
e.status as status_experience, wp.status as status_wanted_profile from experience_note en 
join experience e on en.id_experience=e.id_experience 
join wanted_profile wp on en.id_wanted_profile=wp.id_wanted_profile;
