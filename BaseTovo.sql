CREATE SCHEMA IF NOT EXISTS "public";

CREATE SEQUENCE "public".adresse_idadresse_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".besoin_idbesoin_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".diplome_iddiplome_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".experience_idexperience_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".salaire_idsalaire_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".service_idservice_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".sexe_idsexe_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".task_idtask_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".unity_idunity_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".utilisateur_idutilisateur_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".wantedprofile_idwantedprofile_seq START WITH 1 INCREMENT BY 1;

CREATE SEQUENCE "public".workload_idworkload_seq START WITH 1 INCREMENT BY 1;

CREATE  TABLE "public".adresse ( 
	idadresse            integer DEFAULT nextval('adresse_idadresse_seq'::regclass) NOT NULL  ,
	adresse              varchar(50)    ,
	status               numeric    ,
	CONSTRAINT adresse_pkey PRIMARY KEY ( idadresse )
 );

CREATE  TABLE "public".diplome ( 
	iddiplome            integer DEFAULT nextval('diplome_iddiplome_seq'::regclass) NOT NULL  ,
	diplome              varchar(50)    ,
	status               numeric    ,
	CONSTRAINT diplome_pkey PRIMARY KEY ( iddiplome )
 );

CREATE  TABLE "public".experience ( 
	idexperience         integer DEFAULT nextval('experience_idexperience_seq'::regclass) NOT NULL  ,
	experience           varchar(50)    ,
	status               numeric    ,
	CONSTRAINT experience_pkey PRIMARY KEY ( idexperience )
 );

CREATE  TABLE "public".salaire ( 
	idsalaire            integer DEFAULT nextval('salaire_idsalaire_seq'::regclass) NOT NULL  ,
	salaire              double precision    ,
	status               numeric    ,
	CONSTRAINT salaire_pkey PRIMARY KEY ( idsalaire )
 );

CREATE  TABLE "public".service ( 
	idservice            integer DEFAULT nextval('service_idservice_seq'::regclass) NOT NULL  ,
	service              varchar(50)    ,
	fonction             varchar(50)    ,
	creationdate         date    ,
	status               numeric    ,
	CONSTRAINT service_pkey PRIMARY KEY ( idservice )
 );

CREATE  TABLE "public".sexe ( 
	idsexe               integer DEFAULT nextval('sexe_idsexe_seq'::regclass) NOT NULL  ,
	sexe                 varchar(20)    ,
	status               numeric    ,
	CONSTRAINT sexe_pkey PRIMARY KEY ( idsexe )
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
	idunity              integer DEFAULT nextval('unity_idunity_seq'::regclass) NOT NULL  ,
	unity                varchar(20)    ,
	status               numeric    ,
	CONSTRAINT unity_pkey PRIMARY KEY ( idunity )
 );

CREATE  TABLE "public".utilisateur ( 
	idutilisateur        integer DEFAULT nextval('utilisateur_idutilisateur_seq'::regclass) NOT NULL  ,
	idservice            integer    ,
	username             varchar(20)    ,
	"password"           varchar(20)    ,
	mail                 varchar(30)    ,
	status               numeric    ,
	CONSTRAINT utilisateur_pkey PRIMARY KEY ( idutilisateur )
 );

CREATE  TABLE "public".wantedprofile ( 
	idwantedprofile      integer DEFAULT nextval('wantedprofile_idwantedprofile_seq'::regclass) NOT NULL  ,
	poste                varchar(50)    ,
	idservice            integer    ,
	status               numeric    ,
	CONSTRAINT wantedprofile_pkey PRIMARY KEY ( idwantedprofile )
 );

CREATE  TABLE "public".adressenote ( 
	idwantedprofile      integer    ,
	idadresse            integer    ,
	note                 numeric    
 );

CREATE  TABLE "public".besoin ( 
	idbesoin             integer DEFAULT nextval('besoin_idbesoin_seq'::regclass) NOT NULL  ,
	idservice            integer    ,
	creationdate         date    ,
	description          varchar(200)    ,
	status               numeric    ,
	CONSTRAINT besoin_pkey PRIMARY KEY ( idbesoin )
 );

CREATE  TABLE "public".diplomenote ( 
	idwantedprofile      integer    ,
	iddiplome            integer    ,
	note                 numeric    
 );

CREATE  TABLE "public".experiencenote ( 
	idwantedprofile      integer    ,
	idexperience         integer    ,
	note                 numeric    
 );

CREATE  TABLE "public".salairenote ( 
	idwantedprofile      integer    ,
	idsalaire            integer    ,
	note                 numeric    
 );

CREATE  TABLE "public".sexenote ( 
	idwantedprofile      integer    ,
	idsexe               integer    ,
	note                 numeric    
 );

CREATE  TABLE "public".task ( 
	idtask               integer DEFAULT nextval('task_idtask_seq'::regclass) NOT NULL  ,
	idbesoin             integer    ,
	task                 varchar(150)    ,
	status               numeric    ,
	CONSTRAINT task_pkey PRIMARY KEY ( idtask )
 );

CREATE  TABLE "public".workload ( 
	idworkload           integer DEFAULT nextval('workload_idworkload_seq'::regclass) NOT NULL  ,
	idbesoin             integer    ,
	idwantedprofile      integer    ,
	quantity             numeric    ,
	idunity              integer    ,
	CONSTRAINT workload_pkey PRIMARY KEY ( idworkload )
 );

ALTER TABLE "public".adressenote ADD CONSTRAINT adressenote_idadresse_fkey FOREIGN KEY ( idadresse ) REFERENCES "public".adresse( idadresse );

ALTER TABLE "public".adressenote ADD CONSTRAINT adressenote_idwantedprofile_fkey FOREIGN KEY ( idwantedprofile ) REFERENCES "public".wantedprofile( idwantedprofile );

ALTER TABLE "public".besoin ADD CONSTRAINT besoin_idservice_fkey FOREIGN KEY ( idservice ) REFERENCES "public".service( idservice );

ALTER TABLE "public".diplomenote ADD CONSTRAINT diplomenote_iddiplome_fkey FOREIGN KEY ( iddiplome ) REFERENCES "public".diplome( iddiplome );

ALTER TABLE "public".diplomenote ADD CONSTRAINT diplomenote_idwantedprofile_fkey FOREIGN KEY ( idwantedprofile ) REFERENCES "public".wantedprofile( idwantedprofile );

ALTER TABLE "public".experiencenote ADD CONSTRAINT experiencenote_idexperience_fkey FOREIGN KEY ( idexperience ) REFERENCES "public".experience( idexperience );

ALTER TABLE "public".experiencenote ADD CONSTRAINT experiencenote_idwantedprofile_fkey FOREIGN KEY ( idwantedprofile ) REFERENCES "public".wantedprofile( idwantedprofile );

ALTER TABLE "public".salairenote ADD CONSTRAINT salairenote_idsalaire_fkey FOREIGN KEY ( idsalaire ) REFERENCES "public".salaire( idsalaire );

ALTER TABLE "public".salairenote ADD CONSTRAINT salairenote_idwantedprofile_fkey FOREIGN KEY ( idwantedprofile ) REFERENCES "public".wantedprofile( idwantedprofile );

ALTER TABLE "public".sexenote ADD CONSTRAINT sexenote_idsexe_fkey FOREIGN KEY ( idsexe ) REFERENCES "public".sexe( idsexe );

ALTER TABLE "public".sexenote ADD CONSTRAINT sexenote_idwantedprofile_fkey FOREIGN KEY ( idwantedprofile ) REFERENCES "public".wantedprofile( idwantedprofile );

ALTER TABLE "public".task ADD CONSTRAINT task_idbesoin_fkey FOREIGN KEY ( idbesoin ) REFERENCES "public".besoin( idbesoin );

ALTER TABLE "public".utilisateur ADD CONSTRAINT utilisateur_idservice_fkey FOREIGN KEY ( idservice ) REFERENCES "public".service( idservice );

ALTER TABLE "public".wantedprofile ADD CONSTRAINT wantedprofile_idservice_fkey FOREIGN KEY ( idservice ) REFERENCES "public".service( idservice );

ALTER TABLE "public".workload ADD CONSTRAINT workload_idbesoin_fkey FOREIGN KEY ( idbesoin ) REFERENCES "public".besoin( idbesoin );

ALTER TABLE "public".workload ADD CONSTRAINT workload_idunity_fkey FOREIGN KEY ( idunity ) REFERENCES "public".unity( idunity );

ALTER TABLE "public".workload ADD CONSTRAINT workload_idwantedprofile_fkey FOREIGN KEY ( idwantedprofile ) REFERENCES "public".wantedprofile( idwantedprofile );

INSERT INTO "public".adresse( idadresse, adresse, status ) VALUES ( 1, 'Andoharanofotsy', 1);
INSERT INTO "public".adresse( idadresse, adresse, status ) VALUES ( 2, 'Itaosy', 1);
INSERT INTO "public".adresse( idadresse, adresse, status ) VALUES ( 3, 'Tanjombato', 1);
INSERT INTO "public".adresse( idadresse, adresse, status ) VALUES ( 4, 'Analakely', 1);
INSERT INTO "public".adresse( idadresse, adresse, status ) VALUES ( 5, 'Ambohidratrimo', 1);
INSERT INTO "public".adresse( idadresse, adresse, status ) VALUES ( 6, 'Talatamaty', 1);
INSERT INTO "public".adresse( idadresse, adresse, status ) VALUES ( 7, 'Behenjy', 1);
INSERT INTO "public".adresse( idadresse, adresse, status ) VALUES ( 8, 'Imerintsiatosika', 1);
INSERT INTO "public".diplome( iddiplome, diplome, status ) VALUES ( 1, 'CEPE', 1);
INSERT INTO "public".diplome( iddiplome, diplome, status ) VALUES ( 2, 'BEPC', 1);
INSERT INTO "public".diplome( iddiplome, diplome, status ) VALUES ( 3, 'BACC', 1);
INSERT INTO "public".diplome( iddiplome, diplome, status ) VALUES ( 4, 'Licence en info', 1);
INSERT INTO "public".diplome( iddiplome, diplome, status ) VALUES ( 5, 'Master en info', 1);
INSERT INTO "public".diplome( iddiplome, diplome, status ) VALUES ( 6, 'Doctorat en info', 1);
INSERT INTO "public".diplome( iddiplome, diplome, status ) VALUES ( 7, 'licence en gestion', 1);
INSERT INTO "public".diplome( iddiplome, diplome, status ) VALUES ( 8, 'master en gestion', 1);
INSERT INTO "public".diplome( iddiplome, diplome, status ) VALUES ( 9, 'licence en managment', 1);
INSERT INTO "public".diplome( iddiplome, diplome, status ) VALUES ( 10, 'master en managment', 1);
INSERT INTO "public".experience( idexperience, experience, status ) VALUES ( 1, '1 an d`experience', 1);
INSERT INTO "public".experience( idexperience, experience, status ) VALUES ( 2, '3 ans d`experiences', 1);
INSERT INTO "public".experience( idexperience, experience, status ) VALUES ( 3, '5 ans d`experiences', 1);
INSERT INTO "public".salaire( idsalaire, salaire, status ) VALUES ( 1, 200000.0, 1);
INSERT INTO "public".salaire( idsalaire, salaire, status ) VALUES ( 2, 300000.0, 1);
INSERT INTO "public".salaire( idsalaire, salaire, status ) VALUES ( 3, 500000.0, 1);
INSERT INTO "public".salaire( idsalaire, salaire, status ) VALUES ( 4, 700000.0, 1);
INSERT INTO "public".salaire( idsalaire, salaire, status ) VALUES ( 5, 1000000.0, 1);
INSERT INTO "public".salaire( idsalaire, salaire, status ) VALUES ( 6, 1500000.0, 1);
INSERT INTO "public".salaire( idsalaire, salaire, status ) VALUES ( 7, 2000000.0, 1);
INSERT INTO "public".service( idservice, service, fonction, creationdate, status ) VALUES ( 1, 'Securite', 'Securite du Batiment', '2000-10-20', 1);
INSERT INTO "public".service( idservice, service, fonction, creationdate, status ) VALUES ( 2, 'Ressources humaines', 'Gestion horaire', '2000-10-22', 1);
INSERT INTO "public".service( idservice, service, fonction, creationdate, status ) VALUES ( 3, 'Informatique', 'Responsable info', '2000-10-24', 1);
INSERT INTO "public".service( idservice, service, fonction, creationdate, status ) VALUES ( 4, 'Transport', 'service de transport', '2000-10-26', 1);
INSERT INTO "public".sexe( idsexe, sexe, status ) VALUES ( 1, 'Homme', 1);
INSERT INTO "public".sexe( idsexe, sexe, status ) VALUES ( 2, 'Femme', 1);
INSERT INTO "public".society( name, adresse, nif, contact, secteur, legal_statut ) VALUES ( 'AUXIMAD', 'Antananarivo', '0012-8221', '+261346595861', 'Informatique', 1);
INSERT INTO "public".unity( idunity, unity, status ) VALUES ( 1, 'H/J', 1);
INSERT INTO "public".unity( idunity, unity, status ) VALUES ( 2, 'H/S', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 1, 1, 'Ravao securite', 'Ravao123', 'Ravao@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 2, 1, 'Ralay securite', 'Ralay123', 'Ralay@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 3, 1, 'Bernard securite', 'Bernard123', 'Bernard@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 4, 2, 'Lili RH', 'Lili000', 'Lili@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 5, 2, 'Lanto RH', 'Lanto000', 'Lanto@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 6, 2, 'Voahirana RH', 'Voahirana000', 'Voahirana@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 7, 3, 'Andry Info', 'Andry111', 'Andry@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 8, 3, 'Koto Info', 'koto111', 'Koto@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 9, 3, 'Steave Info', 'Steave111', 'Steave@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 10, 4, 'Larry Transport', 'Larry111', 'Larry@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 11, 4, 'Solo Transport', 'Solo111', 'Solo@gmail.com', 1);
INSERT INTO "public".utilisateur( idutilisateur, idservice, username, "password", mail, status ) VALUES ( 12, 4, 'Benja Transport', 'Benja111', 'Benja@gmail.com', 1);
INSERT INTO "public".wantedprofile( idwantedprofile, poste, idservice, status ) VALUES ( 1, 'Developper', 3, 1);
INSERT INTO "public".wantedprofile( idwantedprofile, poste, idservice, status ) VALUES ( 2, 'Team Leader', 3, 1);
INSERT INTO "public".wantedprofile( idwantedprofile, poste, idservice, status ) VALUES ( 3, 'Chauffeur', 4, 1);
INSERT INTO "public".wantedprofile( idwantedprofile, poste, idservice, status ) VALUES ( 4, 'Securite', 1, 1);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 1, 1, 5);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 1, 2, 6);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 1, 4, 10);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 2, 1, 5);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 2, 2, 8);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 2, 4, 10);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 3, 4, 10);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 3, 5, 6);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 3, 2, 7);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 4, 4, 10);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 4, 2, 5);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 4, 6, 3);
INSERT INTO "public".adressenote( idwantedprofile, idadresse, note ) VALUES ( 4, 3, 6);
INSERT INTO "public".besoin( idbesoin, idservice, creationdate, description, status ) VALUES ( 1, 3, '2023-08-12', 'Renforcement dev', 1);
INSERT INTO "public".besoin( idbesoin, idservice, creationdate, description, status ) VALUES ( 2, 3, '2023-08-20', 'Recherche Tl', 1);
INSERT INTO "public".besoin( idbesoin, idservice, creationdate, description, status ) VALUES ( 3, 4, '2023-08-30', 'Recherche Chauffeur', 1);
INSERT INTO "public".besoin( idbesoin, idservice, creationdate, description, status ) VALUES ( 4, 1, '2023-09-30', 'Recherche Securite', 1);
INSERT INTO "public".diplomenote( idwantedprofile, iddiplome, note ) VALUES ( 1, 4, 8);
INSERT INTO "public".diplomenote( idwantedprofile, iddiplome, note ) VALUES ( 1, 5, 10);
INSERT INTO "public".diplomenote( idwantedprofile, iddiplome, note ) VALUES ( 2, 5, 8);
INSERT INTO "public".diplomenote( idwantedprofile, iddiplome, note ) VALUES ( 2, 6, 10);
INSERT INTO "public".diplomenote( idwantedprofile, iddiplome, note ) VALUES ( 3, 2, 5);
INSERT INTO "public".diplomenote( idwantedprofile, iddiplome, note ) VALUES ( 3, 3, 10);
INSERT INTO "public".diplomenote( idwantedprofile, iddiplome, note ) VALUES ( 4, 1, 5);
INSERT INTO "public".diplomenote( idwantedprofile, iddiplome, note ) VALUES ( 4, 2, 8);
INSERT INTO "public".diplomenote( idwantedprofile, iddiplome, note ) VALUES ( 4, 3, 10);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 1, 1, 5);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 1, 2, 7);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 1, 3, 10);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 2, 2, 5);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 2, 3, 10);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 3, 1, 5);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 3, 2, 8);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 3, 2, 10);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 4, 1, 6);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 4, 2, 8);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 4, 3, 10);
INSERT INTO "public".experiencenote( idwantedprofile, idexperience, note ) VALUES ( 2, 1, 0);
INSERT INTO "public".salairenote( idwantedprofile, idsalaire, note ) VALUES ( 1, 4, 8);
INSERT INTO "public".salairenote( idwantedprofile, idsalaire, note ) VALUES ( 1, 5, 6);
INSERT INTO "public".salairenote( idwantedprofile, idsalaire, note ) VALUES ( 2, 5, 6);
INSERT INTO "public".salairenote( idwantedprofile, idsalaire, note ) VALUES ( 2, 6, 8);
INSERT INTO "public".salairenote( idwantedprofile, idsalaire, note ) VALUES ( 3, 1, 8);
INSERT INTO "public".salairenote( idwantedprofile, idsalaire, note ) VALUES ( 3, 2, 6);
INSERT INTO "public".salairenote( idwantedprofile, idsalaire, note ) VALUES ( 4, 2, 6);
INSERT INTO "public".salairenote( idwantedprofile, idsalaire, note ) VALUES ( 4, 1, 10);
INSERT INTO "public".sexenote( idwantedprofile, idsexe, note ) VALUES ( 1, 1, 8);
INSERT INTO "public".sexenote( idwantedprofile, idsexe, note ) VALUES ( 1, 2, 10);
INSERT INTO "public".sexenote( idwantedprofile, idsexe, note ) VALUES ( 2, 2, 10);
INSERT INTO "public".sexenote( idwantedprofile, idsexe, note ) VALUES ( 2, 1, 9);
INSERT INTO "public".sexenote( idwantedprofile, idsexe, note ) VALUES ( 3, 1, 10);
INSERT INTO "public".sexenote( idwantedprofile, idsexe, note ) VALUES ( 4, 1, 10);
INSERT INTO "public".task( idtask, idbesoin, task, status ) VALUES ( 1, 1, 'Coder un application', 1);
INSERT INTO "public".task( idtask, idbesoin, task, status ) VALUES ( 2, 2, 'Aide aux conceptions', 1);
INSERT INTO "public".task( idtask, idbesoin, task, status ) VALUES ( 3, 3, 'Aide a la conduite', 1);
INSERT INTO "public".task( idtask, idbesoin, task, status ) VALUES ( 4, 4, 'Aide aux gardienage', 1);
INSERT INTO "public".workload( idworkload, idbesoin, idwantedprofile, quantity, idunity ) VALUES ( 1, 1, 1, 2, 1);
INSERT INTO "public".workload( idworkload, idbesoin, idwantedprofile, quantity, idunity ) VALUES ( 2, 2, 2, 1, 1);
INSERT INTO "public".workload( idworkload, idbesoin, idwantedprofile, quantity, idunity ) VALUES ( 3, 3, 3, 1, 1);
INSERT INTO "public".workload( idworkload, idbesoin, idwantedprofile, quantity, idunity ) VALUES ( 4, 4, 4, 1, 1);