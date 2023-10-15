CREATE SCHEMA IF NOT EXISTS "public";

CREATE SEQUENCE "public".adresse_id_adresse_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".answer_id_answer_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".besoin_id_besoin_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".candidature_id_candidature_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".diplome_id_diplome_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".experience_id_experience_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".formation_base_id_formation_base_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".professional_career_id_professional_career_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".question_id_question_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".quiz_id_quiz_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".quiz_type_id_quiz_type_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".salaire_id_salaire_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".service_id_service_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".sexe_id_sexe_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".task_id_task_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".unity_id_unity_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".utilisateur_id_utilisateur_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".wanted_profile_id_wanted_profile_seq START WITH 20 INCREMENT BY 1;

CREATE SEQUENCE "public".workload_id_workload_seq START WITH 20 INCREMENT BY 1;

CREATE  TABLE "public".adresse ( 
	id_adresse           integer DEFAULT nextval('adresse_id_adresse_seq'::regclass) NOT NULL  ,
	adresse              varchar(50)    ,
	status               numeric    ,
	CONSTRAINT adresse_pkey PRIMARY KEY ( id_adresse )
 );

CREATE  TABLE "public".answer ( 
	id_answer            integer DEFAULT nextval('answer_id_answer_seq'::regclass) NOT NULL  ,
	answer               varchar(50)    ,
	"value"              integer    ,
	CONSTRAINT pk_answer PRIMARY KEY ( id_answer )
 );

CREATE  TABLE "public".diplome ( 
	id_diplome           integer DEFAULT nextval('diplome_id_diplome_seq'::regclass) NOT NULL  ,
	diplome              varchar(50)    ,
	status               numeric    ,
	CONSTRAINT diplome_pkey PRIMARY KEY ( id_diplome )
 );

CREATE  TABLE "public".experience ( 
	id_experience        integer DEFAULT nextval('experience_id_experience_seq'::regclass) NOT NULL  ,
	experience           varchar(50)    ,
	status               numeric    ,
	CONSTRAINT experience_pkey PRIMARY KEY ( id_experience )
 );

CREATE  TABLE "public".question ( 
	id_question          integer DEFAULT nextval('question_id_question_seq'::regclass) NOT NULL  ,
	question             varchar(50)    ,
	score                integer    ,
	id_answer            integer    ,
	CONSTRAINT question_pkey PRIMARY KEY ( id_question ),
	CONSTRAINT question_id_answer_fkey FOREIGN KEY ( id_answer ) REFERENCES "public".answer( id_answer )   
 );

CREATE  TABLE "public".quiz_type ( 
	id_quiz_type         integer DEFAULT nextval('quiz_type_id_quiz_type_seq'::regclass) NOT NULL  ,
	quiz_type            varchar(30)    ,
	CONSTRAINT pk_quiz_type PRIMARY KEY ( id_quiz_type )
 );

CREATE  TABLE "public".salaire ( 
	id_salaire           integer DEFAULT nextval('salaire_id_salaire_seq'::regclass) NOT NULL  ,
	salaire              double precision    ,
	status               numeric    ,
	CONSTRAINT salaire_pkey PRIMARY KEY ( id_salaire )
 );

CREATE  TABLE "public".service ( 
	id_service           integer DEFAULT nextval('service_id_service_seq'::regclass) NOT NULL  ,
	service              varchar(50)    ,
	fonction             varchar(50)    ,
	creation_date        date    ,
	status               numeric    ,
	CONSTRAINT service_pkey PRIMARY KEY ( id_service )
 );

CREATE  TABLE "public".sexe ( 
	id_sexe              integer DEFAULT nextval('sexe_id_sexe_seq'::regclass) NOT NULL  ,
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
	id_unity             integer DEFAULT nextval('unity_id_unity_seq'::regclass) NOT NULL  ,
	unity                varchar(20)    ,
	status               numeric    ,
	CONSTRAINT unity_pkey PRIMARY KEY ( id_unity )
 );

CREATE  TABLE "public".utilisateur ( 
	id_utilisateur       integer DEFAULT nextval('utilisateur_id_utilisateur_seq'::regclass) NOT NULL  ,
	id_service           integer    ,
	username             varchar(20)    ,
	"password"           varchar(20)    ,
	mail                 varchar(30)    ,
	status               numeric    ,
	CONSTRAINT utilisateur_pkey PRIMARY KEY ( id_utilisateur ),
	CONSTRAINT utilisateur_id_service_fkey FOREIGN KEY ( id_service ) REFERENCES "public".service( id_service )   
 );

CREATE  TABLE "public".besoin ( 
	id_besoin            integer DEFAULT nextval('besoin_id_besoin_seq'::regclass) NOT NULL  ,
	id_service           integer    ,
	creation_date        date    ,
	description          varchar(200)    ,
	status               numeric    ,
	CONSTRAINT besoin_pkey PRIMARY KEY ( id_besoin ),
	CONSTRAINT besoin_id_service_fkey FOREIGN KEY ( id_service ) REFERENCES "public".service( id_service )   
 );

CREATE  TABLE "public".quiz ( 
	id_quiz              integer DEFAULT nextval('quiz_id_quiz_seq'::regclass) NOT NULL  ,
	id_service           integer    ,
	quiz_name            varchar(50)    ,
	id_quiz_type         integer    ,
	id_question          integer    ,
	CONSTRAINT pk_quiz PRIMARY KEY ( id_quiz ),
	CONSTRAINT fk_quiz_service FOREIGN KEY ( id_service ) REFERENCES "public".service( id_service )   ,
	CONSTRAINT fk_quiz_quiz_type FOREIGN KEY ( id_quiz_type ) REFERENCES "public".quiz_type( id_quiz_type )   ,
	CONSTRAINT fk_quiz_question FOREIGN KEY ( id_question ) REFERENCES "public".question( id_question )   
 );

CREATE  TABLE "public".task ( 
	id_task              integer DEFAULT nextval('task_id_task_seq'::regclass) NOT NULL  ,
	id_besoin            integer    ,
	task                 varchar(150)    ,
	status               numeric    ,
	CONSTRAINT task_pkey PRIMARY KEY ( id_task ),
	CONSTRAINT task_id_besoin_fkey FOREIGN KEY ( id_besoin ) REFERENCES "public".besoin( id_besoin )   
 );

CREATE  TABLE "public".wanted_profile ( 
	id_wanted_profile    integer DEFAULT nextval('wanted_profile_id_wanted_profile_seq'::regclass) NOT NULL  ,
	poste                varchar(50)    ,
	id_service           integer    ,
	status               numeric    ,
	id_quiz              integer    ,
	CONSTRAINT wanted_profile_pkey PRIMARY KEY ( id_wanted_profile ),
	CONSTRAINT wanted_profile_id_service_fkey FOREIGN KEY ( id_service ) REFERENCES "public".service( id_service )   ,
	CONSTRAINT fk_wanted_profile_quiz FOREIGN KEY ( id_quiz ) REFERENCES "public".quiz( id_quiz )   
 );

CREATE  TABLE "public".workload ( 
	id_workload          integer DEFAULT nextval('workload_id_workload_seq'::regclass) NOT NULL  ,
	id_besoin            integer    ,
	id_wanted_profile    integer    ,
	quantity             numeric    ,
	id_unity             integer    ,
	CONSTRAINT workload_pkey PRIMARY KEY ( id_workload ),
	CONSTRAINT workload_id_besoin_fkey FOREIGN KEY ( id_besoin ) REFERENCES "public".besoin( id_besoin )   ,
	CONSTRAINT workload_id_unity_fkey FOREIGN KEY ( id_unity ) REFERENCES "public".unity( id_unity )   ,
	CONSTRAINT workload_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile )   
 );

CREATE  TABLE "public".adresse_note ( 
	id_wanted_profile    integer    ,
	id_adresse           integer    ,
	note                 numeric    ,
	CONSTRAINT adresse_note_id_adresse_fkey FOREIGN KEY ( id_adresse ) REFERENCES "public".adresse( id_adresse )   ,
	CONSTRAINT adresse_note_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile )   
 );

CREATE  TABLE "public".candidature ( 
	id_candidature       integer DEFAULT nextval('candidature_id_candidature_seq'::regclass) NOT NULL  ,
	id_wanted_profile    integer    ,
	deposit_date         date    ,
	name                 varchar(30)    ,
	first_name           varchar(30)    ,
	birth_date           date    ,
	id_adresse           integer    ,
	email                varchar(30)    ,
	id_sexe              integer    ,
	id_experience        integer    ,
	id_diplome           integer    ,
	interest_center      varchar(30)    ,
	salary_expectation   double precision    ,
	self_profile         varchar(200)    ,
	photo                varchar(20)    ,
	dossier              varchar(30)    ,
	note                 double precision    ,
	status               integer    ,
	CONSTRAINT candidature_pkey PRIMARY KEY ( id_candidature ),
	CONSTRAINT candidature_id_adresse_fkey FOREIGN KEY ( id_adresse ) REFERENCES "public".adresse( id_adresse )   ,
	CONSTRAINT candidature_id_diplome_fkey FOREIGN KEY ( id_diplome ) REFERENCES "public".diplome( id_diplome )   ,
	CONSTRAINT candidature_id_experience_fkey FOREIGN KEY ( id_experience ) REFERENCES "public".experience( id_experience )   ,
	CONSTRAINT candidature_id_sexe_fkey FOREIGN KEY ( id_sexe ) REFERENCES "public".sexe( id_sexe )   ,
	CONSTRAINT candidature_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile )   
 );

CREATE  TABLE "public".diplome_note ( 
	id_wanted_profile    integer    ,
	id_diplome           integer    ,
	note                 numeric    ,
	CONSTRAINT diplome_note_id_diplome_fkey FOREIGN KEY ( id_diplome ) REFERENCES "public".diplome( id_diplome )   ,
	CONSTRAINT diplome_note_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile )   
 );

CREATE  TABLE "public".experience_note ( 
	id_wanted_profile    integer    ,
	id_experience        integer    ,
	note                 numeric    ,
	CONSTRAINT experience_note_id_experience_fkey FOREIGN KEY ( id_experience ) REFERENCES "public".experience( id_experience )   ,
	CONSTRAINT experience_note_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile )   
 );

CREATE  TABLE "public".formation_base ( 
	id_formation_base    integer DEFAULT nextval('formation_base_id_formation_base_seq'::regclass) NOT NULL  ,
	id_candidature       integer    ,
	"year"               varchar(20)    ,
	diplome              varchar(30)    ,
	school               varchar(50)    ,
	CONSTRAINT formation_base_pkey PRIMARY KEY ( id_formation_base ),
	CONSTRAINT formation_base_id_candidature_fkey FOREIGN KEY ( id_candidature ) REFERENCES "public".candidature( id_candidature )   
 );

CREATE  TABLE "public".professional_career ( 
	id_professional_career integer DEFAULT nextval('professional_career_id_professional_career_seq'::regclass) NOT NULL  ,
	id_candidature       integer    ,
	start_date           date    ,
	end_date             date    ,
	society              varchar(30)    ,
	poste                varchar(30)    ,
	task                 varchar(100)    ,
	CONSTRAINT professional_career_pkey PRIMARY KEY ( id_professional_career ),
	CONSTRAINT professional_career_id_candidature_fkey FOREIGN KEY ( id_candidature ) REFERENCES "public".candidature( id_candidature )   
 );

CREATE  TABLE "public".salaire_note ( 
	id_wanted_profile    integer    ,
	id_salaire           integer    ,
	note                 numeric    ,
	CONSTRAINT salaire_note_id_salaire_fkey FOREIGN KEY ( id_salaire ) REFERENCES "public".salaire( id_salaire )   ,
	CONSTRAINT salaire_note_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile )   
 );

CREATE  TABLE "public".sexe_note ( 
	id_wanted_profile    integer    ,
	id_sexe              integer    ,
	note                 numeric    ,
	CONSTRAINT sexe_note_id_sexe_fkey FOREIGN KEY ( id_sexe ) REFERENCES "public".sexe( id_sexe )   ,
	CONSTRAINT sexe_note_id_wanted_profile_fkey FOREIGN KEY ( id_wanted_profile ) REFERENCES "public".wanted_profile( id_wanted_profile )   
 );

CREATE VIEW "public".v_adresse_note AS SELECT dn.id_wanted_profile,
    dn.id_adresse,
    dn.note,
    d.adresse,
    d.status
   FROM (adresse_note dn
     JOIN adresse d ON ((d.id_adresse = dn.id_adresse)))
  WHERE (d.status = (1)::numeric);

CREATE VIEW "public".v_diplome_note AS SELECT dn.id_wanted_profile,
    dn.id_diplome,
    dn.note,
    d.diplome,
    d.status
   FROM (diplome_note dn
     JOIN diplome d ON ((d.id_diplome = dn.id_diplome)))
  WHERE (d.status = (1)::numeric);

CREATE VIEW "public".v_experience_note AS SELECT dn.id_wanted_profile,
    dn.id_experience,
    dn.note,
    d.experience,
    d.status
   FROM (experience_note dn
     JOIN experience d ON ((d.id_experience = dn.id_experience)))
  WHERE (d.status = (1)::numeric);

CREATE VIEW "public".v_salaire_note AS SELECT dn.id_wanted_profile,
    dn.id_salaire,
    dn.note,
    d.salaire,
    d.status
   FROM (salaire_note dn
     JOIN salaire d ON ((d.id_salaire = dn.id_salaire)))
  WHERE (d.status = (1)::numeric);

CREATE VIEW "public".v_sexe_note AS SELECT dn.id_wanted_profile,
    dn.id_sexe,
    dn.note,
    d.sexe,
    d.status
   FROM (sexe_note dn
     JOIN sexe d ON ((d.id_sexe = dn.id_sexe)))
  WHERE (d.status = (1)::numeric);

CREATE VIEW "public".v_user_service AS SELECT u.id_utilisateur,
    u.id_service,
    u.username,
    u.password,
    u.mail,
    u.status,
    s.service,
    s.fonction,
    s.creation_date
   FROM (utilisateur u
     JOIN service s ON ((u.id_service = s.id_service)));

INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 1, 'Andoharanofotsy', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 2, 'Itaosy', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 3, 'Tanjombato', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 4, 'Analakely', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 5, 'Ambohidratrimo', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 6, 'Talatamaty', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 7, 'Behenjy', 1);
INSERT INTO "public".adresse( id_adresse, adresse, status ) VALUES ( 8, 'Imerintsiatosika', 1);
INSERT INTO "public".answer( id_answer, answer, "value" ) VALUES ( 1, 'A1', 0);
INSERT INTO "public".answer( id_answer, answer, "value" ) VALUES ( 2, 'A11', 1);
INSERT INTO "public".answer( id_answer, answer, "value" ) VALUES ( 3, 'A2', 0);
INSERT INTO "public".answer( id_answer, answer, "value" ) VALUES ( 4, 'A21', 0);
INSERT INTO "public".answer( id_answer, answer, "value" ) VALUES ( 5, 'A22', 1);
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
INSERT INTO "public".question( id_question, question, score, id_answer ) VALUES ( 1, 'Q1', 1, 2);
INSERT INTO "public".question( id_question, question, score, id_answer ) VALUES ( 2, 'Q2', 1, 5);
INSERT INTO "public".quiz_type( id_quiz_type, quiz_type ) VALUES ( 1, 'Question');
INSERT INTO "public".quiz_type( id_quiz_type, quiz_type ) VALUES ( 2, 'Reponse');
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
INSERT INTO "public".besoin( id_besoin, id_service, creation_date, description, status ) VALUES ( 1, 3, '2023-08-12', 'Renforcement dev', 1);
INSERT INTO "public".besoin( id_besoin, id_service, creation_date, description, status ) VALUES ( 2, 3, '2023-08-20', 'Recherche Tl', 1);
INSERT INTO "public".besoin( id_besoin, id_service, creation_date, description, status ) VALUES ( 3, 4, '2023-08-30', 'Recherche Chauffeur', 1);
INSERT INTO "public".besoin( id_besoin, id_service, creation_date, description, status ) VALUES ( 4, 1, '2023-09-30', 'Recherche Securite', 1);
INSERT INTO "public".besoin( id_besoin, id_service, creation_date, description, status ) VALUES ( 20, 2, '2023-10-15', 'On recrute un gardient', 10);
INSERT INTO "public".quiz( id_quiz, id_service, quiz_name, id_quiz_type, id_question ) VALUES ( 1, 2, 'Quiz de test', 1, 1);
INSERT INTO "public".quiz( id_quiz, id_service, quiz_name, id_quiz_type, id_question ) VALUES ( 2, 2, 'Quiz de test', 1, 2);
INSERT INTO "public".task( id_task, id_besoin, task, status ) VALUES ( 1, 1, 'Coder un application', 1);
INSERT INTO "public".task( id_task, id_besoin, task, status ) VALUES ( 2, 2, 'Aide aux conceptions', 1);
INSERT INTO "public".task( id_task, id_besoin, task, status ) VALUES ( 3, 3, 'Aide a la conduite', 1);
INSERT INTO "public".task( id_task, id_besoin, task, status ) VALUES ( 4, 4, 'Aide aux gardienage', 1);
INSERT INTO "public".task( id_task, id_besoin, task, status ) VALUES ( 20, 20, 'garder la maison', 1);
INSERT INTO "public".wanted_profile( id_wanted_profile, poste, id_service, status, id_quiz ) VALUES ( 1, 'Developper', 3, 1, null);
INSERT INTO "public".wanted_profile( id_wanted_profile, poste, id_service, status, id_quiz ) VALUES ( 2, 'Team Leader', 3, 1, null);
INSERT INTO "public".wanted_profile( id_wanted_profile, poste, id_service, status, id_quiz ) VALUES ( 3, 'Chauffeur', 4, 1, null);
INSERT INTO "public".wanted_profile( id_wanted_profile, poste, id_service, status, id_quiz ) VALUES ( 4, 'Securite', 1, 1, null);
INSERT INTO "public".wanted_profile( id_wanted_profile, poste, id_service, status, id_quiz ) VALUES ( 20, ' Gardient ', 1, 1, null);
INSERT INTO "public".workload( id_workload, id_besoin, id_wanted_profile, quantity, id_unity ) VALUES ( 1, 1, 1, 2, 1);
INSERT INTO "public".workload( id_workload, id_besoin, id_wanted_profile, quantity, id_unity ) VALUES ( 2, 2, 2, 1, 1);
INSERT INTO "public".workload( id_workload, id_besoin, id_wanted_profile, quantity, id_unity ) VALUES ( 3, 3, 3, 1, 1);
INSERT INTO "public".workload( id_workload, id_besoin, id_wanted_profile, quantity, id_unity ) VALUES ( 4, 4, 4, 1, 1);
INSERT INTO "public".workload( id_workload, id_besoin, id_wanted_profile, quantity, id_unity ) VALUES ( 20, 20, 20, 40, 1);
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
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 20, 1, 10);
INSERT INTO "public".adresse_note( id_wanted_profile, id_adresse, note ) VALUES ( 20, 3, 8);
INSERT INTO "public".candidature( id_candidature, id_wanted_profile, deposit_date, name, first_name, birth_date, id_adresse, email, id_sexe, id_experience, id_diplome, interest_center, salary_expectation, self_profile, photo, dossier, note, status ) VALUES ( 1, 1, '2023-10-14', 'Rakoto', 'Fy', '2005-08-10', 2, 'andriafymichael@gmail.com', 1, 1, 4, ' Basket', 1000000.0, 'je veux etre un bon developper', 'CV.png', 'downloadfile-157.pdf', 33.0, 1);
INSERT INTO "public".candidature( id_candidature, id_wanted_profile, deposit_date, name, first_name, birth_date, id_adresse, email, id_sexe, id_experience, id_diplome, interest_center, salary_expectation, self_profile, photo, dossier, note, status ) VALUES ( 2, 1, '2023-10-14', 'Rakoto', 'Fy', '2005-08-10', 2, 'andriafymichael@gmail.com', 1, 1, 4, ' Basket', 1000000.0, 'Okay', 'CV.png', 'downloadfile-157.pdf', 33.0, 1);
INSERT INTO "public".candidature( id_candidature, id_wanted_profile, deposit_date, name, first_name, birth_date, id_adresse, email, id_sexe, id_experience, id_diplome, interest_center, salary_expectation, self_profile, photo, dossier, note, status ) VALUES ( 3, 1, '2023-10-15', 'Rakoto', 'Fy', '2005-08-10', 2, 'andriafymichael@gmail.com', 1, 1, 5, ' Basket -  Jeux vidéos', 1000000.0, 'Corie donatien waouhh', 'CV.png', 'INFO-P15-ETU1998-TP402.rar', 35.0, 1);
INSERT INTO "public".candidature( id_candidature, id_wanted_profile, deposit_date, name, first_name, birth_date, id_adresse, email, id_sexe, id_experience, id_diplome, interest_center, salary_expectation, self_profile, photo, dossier, note, status ) VALUES ( 4, 1, '2023-10-15', 'Rakoto', 'Fy', '2005-08-10', 2, 'andriafymichael@gmail.com', 1, 1, 4, ' Basket', 1000000.0, 'Corie Faniah et Corie Donatien je vous aime', 'CV.png', 'INFO-P15-ETU1998-TP402.rar', 33.0, 1);
INSERT INTO "public".candidature( id_candidature, id_wanted_profile, deposit_date, name, first_name, birth_date, id_adresse, email, id_sexe, id_experience, id_diplome, interest_center, salary_expectation, self_profile, photo, dossier, note, status ) VALUES ( 5, 2, '2023-10-15', 'Rakoto', 'Fy', '2005-08-10', 2, 'andriafymichael@gmail.com', 1, 1, 5, ' Basket', 1500000.0, 'Chercher une filles blanc et curly', 'CV.png', 'INFO-P15-ETU1998-TP402.rar', 33.0, 1);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 1, 4, 8);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 1, 5, 10);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 2, 5, 8);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 2, 6, 10);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 3, 2, 5);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 3, 3, 10);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 4, 1, 5);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 4, 2, 8);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 4, 3, 10);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 20, 1, 5);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 20, 2, 8);
INSERT INTO "public".diplome_note( id_wanted_profile, id_diplome, note ) VALUES ( 20, 3, 10);
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
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 20, 2, 10);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 20, 3, 10);
INSERT INTO "public".experience_note( id_wanted_profile, id_experience, note ) VALUES ( 20, 1, 8);
INSERT INTO "public".formation_base( id_formation_base, id_candidature, "year", diplome, school ) VALUES ( 1, 2, '2023', 'License', 'ITU');
INSERT INTO "public".formation_base( id_formation_base, id_candidature, "year", diplome, school ) VALUES ( 2, 3, '2023', 'Master', 'ITU');
INSERT INTO "public".formation_base( id_formation_base, id_candidature, "year", diplome, school ) VALUES ( 3, 4, '2023', 'License', 'ITU');
INSERT INTO "public".formation_base( id_formation_base, id_candidature, "year", diplome, school ) VALUES ( 4, 5, '2013', 'CEPE', 'La pie Ambaniala');
INSERT INTO "public".professional_career( id_professional_career, id_candidature, start_date, end_date, society, poste, task ) VALUES ( 1, 2, '2023-10-14', '2024-10-14', 'SMIG', 'Developper', 'Dev;');
INSERT INTO "public".professional_career( id_professional_career, id_candidature, start_date, end_date, society, poste, task ) VALUES ( 2, 3, '2023-10-15', '2024-10-15', 'SMIG', 'Developper', 'Dev;');
INSERT INTO "public".professional_career( id_professional_career, id_candidature, start_date, end_date, society, poste, task ) VALUES ( 3, 4, '2023-10-15', '2024-10-16', 'SADEC', 'Developper', 'Coder des applications;');
INSERT INTO "public".professional_career( id_professional_career, id_candidature, start_date, end_date, society, poste, task ) VALUES ( 4, 5, '2023-10-15', '2024-10-15', 'SMIG', 'Developper', 'Participer a la conception;Coder les appications;');
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 1, 4, 8);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 1, 5, 6);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 2, 5, 6);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 2, 6, 8);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 3, 1, 8);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 3, 2, 6);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 4, 2, 6);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 4, 1, 10);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 20, 1, 10);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 20, 2, 8);
INSERT INTO "public".salaire_note( id_wanted_profile, id_salaire, note ) VALUES ( 20, 3, 7);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 1, 1, 8);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 1, 2, 10);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 2, 2, 10);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 2, 1, 9);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 3, 1, 10);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 4, 1, 10);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 20, 1, 10);
INSERT INTO "public".sexe_note( id_wanted_profile, id_sexe, note ) VALUES ( 20, 2, 5);