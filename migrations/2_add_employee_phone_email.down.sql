BEGIN;

ALTER TABLE employee
    DROP COLUMN phone,
    DROP COLUMN email;

COMMIT;