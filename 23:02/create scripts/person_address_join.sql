-- Table: public.person_address_join

-- DROP TABLE IF EXISTS public.person_address_join;

CREATE TABLE IF NOT EXISTS public.person_address_join
(
    person_id integer NOT NULL,
    address_id integer NOT NULL,
    CONSTRAINT address_id_fk FOREIGN KEY (address_id)
        REFERENCES public.address (address_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT person_id_fk FOREIGN KEY (person_id)
        REFERENCES public.person (person_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.person_address_join
    OWNER to postgres;