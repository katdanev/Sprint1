-- Table: public.address

-- DROP TABLE IF EXISTS public.address;

CREATE TABLE IF NOT EXISTS public.address
(
    address_id integer NOT NULL,
    street_address character varying(30) COLLATE pg_catalog."default" NOT NULL,
    city character varying(25) COLLATE pg_catalog."default" NOT NULL,
    province character varying(25) COLLATE pg_catalog."default" NOT NULL,
    postal_code character varying(8) COLLATE pg_catalog."default" NOT NULL,
    address_type character varying(30) COLLATE pg_catalog."default" NOT NULL,
    person_id integer,
    CONSTRAINT "customerAddress_pkey" PRIMARY KEY (address_id),
    CONSTRAINT person_id_fk FOREIGN KEY (person_id)
        REFERENCES public.person (person_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.address
    OWNER to postgres;