-- Table: public.product_order

-- DROP TABLE IF EXISTS public.product_order;

CREATE TABLE IF NOT EXISTS public.product_order
(
    product_id integer NOT NULL,
    invoice_id integer NOT NULL,
    CONSTRAINT invoice_id_fk FOREIGN KEY (invoice_id)
        REFERENCES public."orderInvoice" (invoice_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT product_id_fk FOREIGN KEY (product_id)
        REFERENCES public.product (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product_order
    OWNER to postgres;