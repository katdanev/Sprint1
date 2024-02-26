-- Table: public.productCategory_Product_join

-- DROP TABLE IF EXISTS public."productCategory_Product_join";

CREATE TABLE IF NOT EXISTS public."productCategory_Product_join"
(
    product_id integer NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT category_id_fk FOREIGN KEY (category_id)
        REFERENCES public."productCategory" (category_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT product_id_fk FOREIGN KEY (product_id)
        REFERENCES public.product (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."productCategory_Product_join"
    OWNER to postgres;