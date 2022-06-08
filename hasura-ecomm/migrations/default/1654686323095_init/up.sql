SET check_function_bodies = false;
CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
CREATE TABLE public.room (
    id text NOT NULL,
    name text NOT NULL,
    user_id text NOT NULL
);
CREATE TABLE public."user" (
    id text NOT NULL,
    name text NOT NULL
);
ALTER TABLE ONLY public.room
    ADD CONSTRAINT "PK_room_id" PRIMARY KEY (id);
ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.room
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public."user"(id);
