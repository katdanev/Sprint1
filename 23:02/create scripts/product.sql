-- Table: public.product

-- DROP TABLE IF EXISTS public.product;

CREATE TABLE IF NOT EXISTS public.product
(
    product_id integer NOT NULL,
    product_name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    description text COLLATE pg_catalog."default",
    price money NOT NULL,
    image character varying COLLATE pg_catalog."default",
    category_id integer NOT NULL,
    person_id integer,
    CONSTRAINT product_pkey PRIMARY KEY (product_id),
    CONSTRAINT category_id FOREIGN KEY (category_id)
        REFERENCES public."productCategory" (category_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT person_id_fk FOREIGN KEY (person_id)
        REFERENCES public.person (person_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product
    OWNER to postgres;