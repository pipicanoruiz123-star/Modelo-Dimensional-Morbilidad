


CREATE TABLE DIM_SPECIALTY (
                spk_specialty BIGINT NOT NULL,
                spe_cod_specialty  VARCHAR(20) NOT NULL,
                spe_specialty_name VARCHAR(255) NOT NULL,
                spe_effectivefrom  DATETIME,
                spe_effectiveto DATETIME,
                spe_version NUMERIC,
                CONSTRAINT DIM_SPECIALTY_pk PRIMARY KEY (spk_specialty)
)


CREATE TABLE DIM_ASSURANCE (
                spk_assurance BIGINT IDENTITY NOT NULL,
                as_cod_eapb VARCHAR(20) NOT NULL,
                as_eapb_name VARCHAR(255),
                as_group VARCHAR(255),
                as_effectivefrom DATETIME,
                as_effectiveto DATETIME,
                as_version NUMERIC,
                CONSTRAINT DIM_ASSURANCE_pk PRIMARY KEY (spk_assurance)
)

CREATE TABLE DIM_SERVICES (
                spk_service BIGINT IDENTITY NOT NULL,
                ser_cod_service VARCHAR(20) NOT NULL,
                ser_service_name VARCHAR(255),
                ser_effectivefrom DATETIME,
                ser_effectiveto DATETIME,
                ser_version NUMERIC,
                CONSTRAINT DIM_SERVICES_pk PRIMARY KEY (spk_service)
)

CREATE TABLE DIM_DIAGNOSIS (
                spk_diagnosis BIGINT IDENTITY NOT NULL,
                diag_code_cie VARCHAR(20) NOT NULL,
                diag_diagnostic_name VARCHAR(255),
                diag_group VARCHAR(255),
                diag_effectivefrom DATETIME,
                diag_effectiveto DATETIME,
                diag_version NUMERIC,
                CONSTRAINT DIM_DIAGNOSIS_pk PRIMARY KEY (spk_diagnosis)
)

CREATE TABLE DIM_PATIENT_PROFILE (
                spk_patient BIGINT IDENTITY NOT NULL,
                pat_gender VARCHAR(20),
                pat_age_range VARCHAR(20),
                pat_zona VARCHAR(30),
                pat_ethnicity VARCHAR(30),
                pat_patient_type VARCHAR(50),
                CONSTRAINT DIM_PATIENT_PROFILE_pk PRIMARY KEY (spk_patient)
)

CREATE TABLE DIM_MUNICIPALITIES (
                spk_municipalities BIGINT IDENTITY NOT NULL,
                num_cod_municipality BIGINT NOT NULL,
                mun_name VARCHAR(100),
                mun_subregion VARCHAR(60),
                mun_effectivefrom DATETIME,
                mun_effectiveto DATETIME,
                mun_version NUMERIC,
                CONSTRAINT DIM_MUNICIPALITIES_pk PRIMARY KEY (spk_municipalities)
)


CREATE TABLE DIM_TIMES (
                SPK_time BIGINT NOT NULL,
                tim_date DATETIME,
                tim_nom_month VARCHAR(20),
                tim_num_month NUMERIC,
                tim_num_quarter NUMERIC,
                tim_nom_quarter VARCHAR(20),
                tim_nom_semester VARCHAR(20),
                tim_num_semester NUMERIC,
                tim_year NUMERIC,
                CONSTRAINT DIM_TIMES_pk PRIMARY KEY (SPK_time)
)

CREATE TABLE FACT_EVENTS_ATTENTION (
                spk_events BIGINT IDENTITY NOT NULL,
                spk_patient BIGINT NOT NULL,
                spk_diagnosis BIGINT NOT NULL,
                spk_service BIGINT NOT NULL,
                spk_assurance BIGINT NOT NULL,
                spk_municipalities BIGINT NOT NULL,
                spk_specialty BIGINT NOT NULL,
                spk_time BIGINT NOT NULL,
                even_quantity_atencion NUMERIC,
                CONSTRAINT FACT_EVENTS_ATTENTION_pk PRIMARY KEY (spk_events)
)

ALTER TABLE FACT_EVENTS_ATTENTION ADD CONSTRAINT DIM_SPECIALTY_FACT_EVENTS_ATTENTION_fk
FOREIGN KEY (spk_specialty)
REFERENCES DIM_SPECIALTY (spk_specialty)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FACT_EVENTS_ATTENTION ADD CONSTRAINT DIM_ASSURANCE_FACT_EVENTS_ATTENTION_fk
FOREIGN KEY (spk_assurance)
REFERENCES DIM_ASSURANCE (spk_assurance)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FACT_EVENTS_ATTENTION ADD CONSTRAINT DIM_SERVICES_FACT_EVENTS_ATTENTION_fk
FOREIGN KEY (spk_service)
REFERENCES DIM_SERVICES (spk_service)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FACT_EVENTS_ATTENTION ADD CONSTRAINT DIM_DIAGNOSIS_FACT_EVENTS_ATTENTION_fk
FOREIGN KEY (spk_diagnosis)
REFERENCES DIM_DIAGNOSIS (spk_diagnosis)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FACT_EVENTS_ATTENTION ADD CONSTRAINT DIM_PATIENT_PROFILE_FACT_EVENTS_ATTENTION_fk
FOREIGN KEY (spk_patient)
REFERENCES DIM_PATIENT_PROFILE (spk_patient)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FACT_EVENTS_ATTENTION ADD CONSTRAINT DIM_MUNICIPALITIES_FACT_EVENTS_ATTENTION_fk
FOREIGN KEY (spk_municipalities)
REFERENCES DIM_MUNICIPALITIES (spk_municipalities)
ON DELETE NO ACTION
ON UPDATE NO ACTION

ALTER TABLE FACT_EVENTS_ATTENTION ADD CONSTRAINT DIM_TIMES_FACT_EVENTS_ATTENTION_fk
FOREIGN KEY (spk_time)
REFERENCES DIM_TIMES (SPK_time)
ON DELETE NO ACTION
ON UPDATE NO ACTION