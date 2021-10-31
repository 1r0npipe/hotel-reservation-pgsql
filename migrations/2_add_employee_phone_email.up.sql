BEGIN;

ALTER TABLE employee
    ADD COLUMN phone text,
    ADD COLUMN email text;

COMMIT;