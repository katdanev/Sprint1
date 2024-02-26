-- Table: public.vendor_products_join

-- DROP TABLE IF EXISTS public.vendor_products_join;

CREATE TABLE IF NOT EXISTS public.vendor_products_join
(
    person_id integer NOT NULL,
    product_id integer NOT NULL,
    CONSTRAINT person_id_fk FOREIGN KEY (person_id)
        REFERENCES public.person (person_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT product_id_fk FOREIGN KEY (product_id)
        REFERENCES public.product (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.vendor_products_join
    OWNER to postgres;