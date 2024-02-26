-- Table: public.orderInvoice

-- DROP TABLE IF EXISTS public."orderInvoice";

CREATE TABLE IF NOT EXISTS public."orderInvoice"
(
    invoice_id integer NOT NULL,
    person_id integer NOT NULL,
    date date NOT NULL,
    shipping_information text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "orderInvoice_pkey" PRIMARY KEY (invoice_id),
    CONSTRAINT person_id_fk FOREIGN KEY (person_id)
        REFERENCES public.person (person_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."orderInvoice"
    OWNER to postgres;