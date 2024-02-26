-- Table: public.customerAccount

-- DROP TABLE IF EXISTS public."customerAccount";

CREATE TABLE IF NOT EXISTS public."customerAccount"
(
    account_id integer NOT NULL,
    person_id integer NOT NULL,
    username character varying(15) COLLATE pg_catalog."default" NOT NULL,
    password character varying(15) COLLATE pg_catalog."default" NOT NULL,
    payment_information text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "customerAccount_pkey" PRIMARY KEY (account_id),
    CONSTRAINT person_id_fk FOREIGN KEY (person_id)
        REFERENCES public.person (person_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."customerAccount"
    OWNER to postgres;