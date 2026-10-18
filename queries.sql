
-- ============================================
-- Hospital Management Database System
-- File: queries.sql
-- Description: SQL queries for hospital data
-- ============================================


-- Q1: Display all patients' names and phone numbers
SELECT P_NAME, PHONE
FROM PATIENT;


-- Q2: List all doctors hired after 2020
SELECT DR_ID, DR_NAME, HIRE_DATE
FROM DOCTOR
WHERE HIRE_DATE > DATE '2020-12-31';


-- Q3: Show all treatments that cost more than 500
SELECT T_ID, NAME_T, T_COST
FROM TREATMENT
WHERE T_COST > 500;


-- Q4: List all departments located on the 2nd floor
SELECT DEP_ID, DEP_NAME
FROM DEPARTMENT
WHERE NUM_FLOOR = 2;


-- Q5: Find the total number of patients
SELECT COUNT(*) AS TOTAL_PATIENTS
FROM PATIENT;


-- Q6: List all doctors and their department names
SELECT DOCTOR.DR_ID,
       DOCTOR.DR_NAME,
       DEPARTMENT.DEP_NAME
FROM DOCTOR
JOIN DEPARTMENT
    ON DOCTOR.DEP_ID = DEPARTMENT.DEP_ID;


-- Q7: Display patients' names and appointment dates
SELECT PATIENT.P_NAME,
       APPOINTMENT.APP_DATE
FROM PATIENT
JOIN APPOINTMENT
    ON PATIENT.P_ID = APPOINTMENT.P_ID;


-- Q8: Find the total number of appointments for each doctor
SELECT DOCTOR.DR_ID,
       DOCTOR.DR_NAME,
       COUNT(APPOINTMENT.APP_ID) AS TOTAL_APPOINTMENTS
FROM DOCTOR
JOIN APPOINTMENT
    ON DOCTOR.DR_ID = APPOINTMENT.DR_ID
GROUP BY DOCTOR.DR_ID, DOCTOR.DR_NAME;


-- Q9: Show all treatments received by Ali Ahmed
SELECT PATIENT.P_NAME,
       TREATMENT.NAME_T
FROM PATIENT
JOIN RECEIVE
    ON PATIENT.P_ID = RECEIVE.P_ID
JOIN TREATMENT
    ON RECEIVE.T_ID = TREATMENT.T_ID
WHERE PATIENT.P_NAME = 'Ali Ahmed';


-- Q10: Retrieve appointments with a cost higher
-- than the average appointment cost
SELECT *
FROM APPOINTMENT
WHERE APP_COST > (
    SELECT AVG(APP_COST)
    FROM APPOINTMENT
);


-- Q11: List patients, their doctors, and departments
SELECT PATIENT.P_NAME,
       DOCTOR.DR_NAME,
       DEPARTMENT.DEP_NAME
FROM PATIENT
JOIN APPOINTMENT
    ON PATIENT.P_ID = APPOINTMENT.P_ID
JOIN DOCTOR
    ON APPOINTMENT.DR_ID = DOCTOR.DR_ID
JOIN DEPARTMENT
    ON DOCTOR.DEP_ID = DEPARTMENT.DEP_ID;


-- Q12: Find the average treatment cost per department
SELECT DEPARTMENT.DEP_NAME,
       AVG(TREATMENT.T_COST) AS AVG_TREATMENT_COST
FROM DEPARTMENT
JOIN DOCTOR
    ON DEPARTMENT.DEP_ID = DOCTOR.DEP_ID
JOIN APPOINTMENT
    ON DOCTOR.DR_ID = APPOINTMENT.DR_ID
JOIN PATIENT
    ON APPOINTMENT.P_ID = PATIENT.P_ID
JOIN RECEIVE
    ON PATIENT.P_ID = RECEIVE.P_ID
JOIN TREATMENT
    ON RECEIVE.T_ID = TREATMENT.T_ID
GROUP BY DEPARTMENT.DEP_NAME;


-- Q13: Find patients who have never had an appointment
-- with a Cardiology doctor
SELECT PATIENT.P_ID, PATIENT.P_NAME
FROM PATIENT
WHERE PATIENT.P_ID NOT IN (
    SELECT APPOINTMENT.P_ID
    FROM APPOINTMENT
    JOIN DOCTOR
        ON APPOINTMENT.DR_ID = DOCTOR.DR_ID
    WHERE DOCTOR.SPECIALTY = 'Cardiology'
);


-- Q14: List the top 3 doctors by total appointment cost
SELECT DOCTOR.DR_ID,
       DOCTOR.DR_NAME,
       SUM(APPOINTMENT.APP_COST) AS TOTAL_COST
FROM DOCTOR
JOIN APPOINTMENT
    ON DOCTOR.DR_ID = APPOINTMENT.DR_ID
GROUP BY DOCTOR.DR_ID, DOCTOR.DR_NAME
ORDER BY TOTAL_COST DESC
FETCH FIRST 3 ROWS ONLY;


-- Q15: Find the department with the largest
-- number of appointments
SELECT DEPARTMENT.DEP_ID,
       DEPARTMENT.DEP_NAME,
       COUNT(APPOINTMENT.APP_ID) AS TOTAL_APPOINTMENTS
FROM DEPARTMENT
JOIN DOCTOR
    ON DEPARTMENT.DEP_ID = DOCTOR.DEP_ID
JOIN APPOINTMENT
    ON DOCTOR.DR_ID = APPOINTMENT.DR_ID
GROUP BY DEPARTMENT.DEP_ID, DEPARTMENT.DEP_NAME
ORDER BY TOTAL_APPOINTMENTS DESC
FETCH FIRST 1 ROW ONLY;
