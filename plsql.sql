
-- ============================================
-- Hospital Management Database System
-- File: plsql.sql
-- Description: PL/SQL blocks, procedure, function
-- ============================================


-- A. Simple PL/SQL Block
-- Display the total number of patients

DECLARE
    Total_Patients NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO Total_Patients
    FROM PATIENT;

    DBMS_OUTPUT.PUT_LINE(
        'Total number of patients = ' || Total_Patients
    );
END;
/


-- B. Stored Procedure
-- Print appointment dates for a given doctor name

CREATE OR REPLACE PROCEDURE Doctor_Appointments (
    Doctor_Name IN VARCHAR2
)
AS
BEGIN
    FOR Row_date IN (
        SELECT APPOINTMENT.APP_DATE
        FROM APPOINTMENT, DOCTOR
        WHERE APPOINTMENT.DR_ID = DOCTOR.DR_ID
          AND DOCTOR.DR_NAME = Doctor_Name
        ORDER BY APPOINTMENT.APP_DATE
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Appointment Date: ' ||
            TO_CHAR(Row_date.APP_DATE, 'YYYY-MM-DD')
        );
    END LOOP;
END;
/


-- Test the stored procedure

DECLARE
    doctor_name VARCHAR2(50) := 'Dr. Deema mohammed';
BEGIN
    DBMS_OUTPUT.PUT_LINE('Doctor Name = ' || doctor_name);
    Doctor_Appointments(doctor_name);
END;
/


-- C. Function
-- Return the total appointment cost for a patient ID

CREATE OR REPLACE FUNCTION Total_Appointment_Cost_For_Patient (
    Patient_ID NUMBER
)
RETURN NUMBER
AS
    Total_Appointment_Cost NUMBER;
BEGIN
    SELECT NVL(SUM(APP_COST), 0)
    INTO Total_Appointment_Cost
    FROM APPOINTMENT
    WHERE P_ID = Patient_ID;

    RETURN Total_Appointment_Cost;
END;
/


-- Test the function

DECLARE
    Patient_ID_Number NUMBER := 1;
    Total_Cost_For_Patient NUMBER;
BEGIN
    Total_Cost_For_Patient :=
        Total_Appointment_Cost_For_Patient(Patient_ID_Number);

    DBMS_OUTPUT.PUT_LINE(
        'Patient ID = ' || Patient_ID_Number
    );

    DBMS_OUTPUT.PUT_LINE(
        'Total appointment cost = ' || Total_Cost_For_Patient
    );
END;
/
