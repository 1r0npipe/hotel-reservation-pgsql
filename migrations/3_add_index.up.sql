BEGIN;

CREATE INDEX employee_ind on employee (fname, lname, salary);
CREATE INDEX hotel_ind on hotel (hname,opened_at,loc,zip_code);

COMMIT;