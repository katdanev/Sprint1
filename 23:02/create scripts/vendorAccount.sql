-- Table: public.vendorAccount

-- DROP TABLE IF EXISTS public."vendorAccount";

CREATE TABLE IF NOT EXISTS public."vendorAccount"
(
    account_id integer NOT NULL,
    person_id integer NOT NULL,
    username character varying COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "vendorAccount_pkey" PRIMARY KEY (account_id),
    CONSTRAINT person_id_fk FOREIGN KEY (person_id)
        REFERENCES public.person (person_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."vendorAccount"
    OWNER to postgres;