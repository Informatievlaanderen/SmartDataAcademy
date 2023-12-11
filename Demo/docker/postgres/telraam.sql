-- Table: public.telraam

-- DROP TABLE IF EXISTS public.telraam;

CREATE TABLE IF NOT EXISTS public.telraam
(
    id character varying COLLATE pg_catalog."default" NOT NULL,
    object text,
    telling double precision,
    fiets double precision,
    auto double precision,
    zwaar double precision,
    voetganger double precision,
    snelheidv85 double precision,
    tijd double precision,
    sensor text,
    wegsegment text
    CONSTRAINT telraam_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.telraam OWNER to ldes;

