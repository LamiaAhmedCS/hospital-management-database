
-- ============================================
-- Hospital Management Database System
-- File: insert_data.sql
-- Description: Insert sample data
-- ============================================

-- 1. Insert Departments
INSERT INTO DEPARTMENT (DEP_ID, DEP_NAME, NUM_FLOOR)
VALUES (2, 'SURGERY', 3);

INSERT INTO DEPARTMENT (DEP_ID, DEP_NAME, NUM_FLOOR)
VALUES (1, 'CARDIOLIGY', 2);

INSERT INTO DEPARTMENT (DEP_ID, DEP_NAME, NUM_FLOOR)
VALUES (0, 'Emergency', 1);


-- 2. Insert Doctors
INSERT INTO DOCTOR
    (DR_ID, DEP_ID, DR_NAME, HIRE_DATE, SPECIALTY)
VALUES
    (0, 1, 'Dr. Deema mohammed',
     DATE '2024-01-01', 'Cardiology');

INSERT INTO DOCTOR
    (DR_ID, DEP_ID, DR_NAME, HIRE_DATE, SPECIALTY)
VALUES
    (1, 2, 'Dr. Sara hamed',
     DATE '2020-05-01', 'SURGERY');

INSERT INTO DOCTOR
    (DR_ID, DEP_ID, DR_NAME, HIRE_DATE, SPECIALTY)
VALUES
    (2, 0, 'Dr. Mohammed Alghamdi',
     DATE '2015-06-15', 'Emergency');

INSERT INTO DOCTOR
    (DR_ID, DEP_ID, DR_NAME, HIRE_DATE, SPECIALTY)
VALUES
    (3, 1, 'Dr.aisha algarni',
     DATE '2025-01-20', 'Cardiology');


-- 3. Insert Patients
INSERT INTO PATIENT
    (P_ID, P_NAME, GENDER, BIRTH_DATE, ADDRESS, PHONE)
VALUES
    (1, 'Reem Saad', 'F',
     DATE '2006-09-15', 'Al Baha', '0506643898');

INSERT INTO PATIENT
    (P_ID, P_NAME, GENDER, BIRTH_DATE, ADDRESS, PHONE)
VALUES
    (2, 'Dana Alghamdi', 'F',
     DATE '2004-06-20', 'Al Baha', '0508543290');

INSERT INTO PATIENT
    (P_ID, P_NAME, GENDER, BIRTH_DATE, ADDRESS, PHONE)
VALUES
    (3, 'Lama Omar', 'F',
     DATE '2010-03-10', 'jeedah', '0508765328');

INSERT INTO PATIENT
    (P_ID, P_NAME, GENDER, BIRTH_DATE, ADDRESS, PHONE)
VALUES
    (4, 'Ali Ahmed', 'M',
     DATE '1999-11-05', 'Albaha', '0502359023');

INSERT INTO PATIENT
    (P_ID, P_NAME, GENDER, BIRTH_DATE, ADDRESS, PHONE)
VALUES
    (5, 'Fahad Khalid', 'M',
     DATE '1992-09-09', 'Abha', '0508504536');

INSERT INTO PATIENT
    (P_ID, P_NAME, GENDER, BIRTH_DATE, ADDRESS, PHONE)
VALUES
    (6, 'Yousuf Ali', 'M',
     DATE '2002-12-25', 'Makkah', '0508985370');


-- 4. Insert Treatments
INSERT INTO TREATMENT (T_ID, NAME_T, T_TYPE, T_COST)
VALUES (1, 'Cardiac Catheterization', 'Procedure', 150);

INSERT INTO TREATMENT (T_ID, NAME_T, T_TYPE, T_COST)
VALUES (2, 'Blood Test', 'Lab', 200);

INSERT INTO TREATMENT (T_ID, NAME_T, T_TYPE, T_COST)
VALUES (3, 'X-Ray', 'Imaging', 500);

INSERT INTO TREATMENT (T_ID, NAME_T, T_TYPE, T_COST)
VALUES (4, 'Paracetamol', 'Medication', 60);

INSERT INTO TREATMENT (T_ID, NAME_T, T_TYPE, T_COST)
VALUES (5, 'Amoxicillin', 'Medication', 40);


-- 5. Insert Appointments
INSERT INTO APPOINTMENT
    (APP_ID, DR_ID, P_ID, APP_COST, DIAGNOSIS, APP_DATE)
VALUES
    (1, 0, 1, 450, 'Chest pain', DATE '2025-01-10');

INSERT INTO APPOINTMENT
    (APP_ID, DR_ID, P_ID, APP_COST, DIAGNOSIS, APP_DATE)
VALUES
    (2, 3, 2, 300, 'Follow up', DATE '2025-01-11');

INSERT INTO APPOINTMENT
    (APP_ID, DR_ID, P_ID, APP_COST, DIAGNOSIS, APP_DATE)
VALUES
    (3, 1, 4, 800, 'Pre-surgery check', DATE '2025-01-12');

INSERT INTO APPOINTMENT
    (APP_ID, DR_ID, P_ID, APP_COST, DIAGNOSIS, APP_DATE)
VALUES
    (4, 2, 3, 180, 'Emergency case', DATE '2025-01-13');

INSERT INTO APPOINTMENT
    (APP_ID, DR_ID, P_ID, APP_COST, DIAGNOSIS, APP_DATE)
VALUES
    (5, 0, 5, 700, 'High blood pressure', DATE '2025-01-14');

INSERT INTO APPOINTMENT
    (APP_ID, DR_ID, P_ID, APP_COST, DIAGNOSIS, APP_DATE)
VALUES
    (6, 1, 1, 250, 'follow up', DATE '2025-01-15');

INSERT INTO APPOINTMENT
    (APP_ID, DR_ID, P_ID, APP_COST, DIAGNOSIS, APP_DATE)
VALUES
    (7, 2, 6, 220, 'Check up', DATE '2025-01-16');

INSERT INTO APPOINTMENT
    (APP_ID, DR_ID, P_ID, APP_COST, DIAGNOSIS, APP_DATE)
VALUES
    (8, 3, 4, 550, 'ECG check', DATE '2025-01-17');


-- 6. Insert Received Treatments
INSERT INTO RECEIVE
VALUES (1, 2, DATE '2025-01-10', DATE '2025-01-10');

INSERT INTO RECEIVE
VALUES (1, 4, DATE '2025-01-10', DATE '2025-01-12');

INSERT INTO RECEIVE
VALUES (2, 4, DATE '2025-01-11', DATE '2025-01-13');

INSERT INTO RECEIVE
VALUES (3, 3, DATE '2025-01-13', DATE '2025-01-13');

INSERT INTO RECEIVE
VALUES (4, 1, DATE '2025-01-12', DATE '2025-01-12');

INSERT INTO RECEIVE
VALUES (5, 4, DATE '2025-01-14', DATE '2025-01-16');

INSERT INTO RECEIVE
VALUES (6, 2, DATE '2025-01-16', DATE '2025-01-16');

INSERT INTO RECEIVE
VALUES (5, 5, DATE '2025-01-14', DATE '2025-01-21');


-- Save changes
COMMIT;
