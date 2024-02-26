-- Table: public.productCategory

-- DROP TABLE IF EXISTS public."productCategory";

CREATE TABLE IF NOT EXISTS public."productCategory"
(
    category_id integer NOT NULL,
    category_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "productCategory_pkey" PRIMARY KEY (category_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."productCategory"
    OWNER to postgres;