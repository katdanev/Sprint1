-- Table: public.vendor

-- DROP TABLE IF EXISTS public.vendor;

CREATE TABLE IF NOT EXISTS public.vendor
(
    vendor_id integer NOT NULL,
    person_id integer NOT NULL,
    vendor_name character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT vendor_pkey PRIMARY KEY (vendor_id),
    CONSTRAINT person_id FOREIGN KEY (person_id)
        REFERENCES public.person (person_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.vendor
    OWNER to postgres;