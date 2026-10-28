USE Clinic_Management_System;
GO

-- 1. FIX EMAIL COLUMN SIZE
ALTER TABLE DOCTOR
ALTER COLUMN EMAIL NVARCHAR(100);

ALTER TABLE PATIENT
ALTER COLUMN EMAIL NVARCHAR(100);
GO






-- 3. RESET IDENTITY VALUES
DBCC CHECKIDENT ('SPECIALIZATION', RESEED, 0);
DBCC CHECKIDENT ('DOCTOR', RESEED, 0);
DBCC CHECKIDENT ('PATIENT', RESEED, 0);
DBCC CHECKIDENT ('STAFF', RESEED, 0);
DBCC CHECKIDENT ('APPOINTMENT', RESEED, 0);
DBCC CHECKIDENT ('MEDICALVISIT', RESEED, 0);
DBCC CHECKIDENT ('PRESCRIPTION', RESEED, 0);
GO


-- 4. SPECIALIZATION
INSERT INTO SPECIALIZATION
    (SPECIALLIZATION_NAME, DESCRIPTION)
VALUES
    (N'Cardiology', N'Heart diseases'),
    (N'Dermatology', N'Skin diseases'),
    (N'Pediatrics', N'Child healthcare');


-- 5. DOCTOR
INSERT INTO DOCTOR
    (FIRST_NAME, LAST_NAME, PHONE, EMAIL,
     CONSULTATIONFEE, SPECIALLIZATION_ID)
VALUES
    (N'Ahmed', N'Mohamed', N'01012345678',
     N'ahmed@gmail.com', 300, 1),

    (N'Mona', N'Ali', N'01023456789',
     N'mona@gmail.com', 250, 2),

    (N'Omar', N'Hassan', N'01034567890',
     N'omar@gmail.com', 200, 3);


-- 6. PATIENT
INSERT INTO PATIENT
    (FIRST_NAME, LAST_NAME, PHONE, EMAIL,
     ADDRESS, DATE_OF_BIRTH, GENDER)
VALUES
    (N'Mahmoud', N'Ahmed', N'01112345678',
     N'mahmoud@gmail.com', N'Damanhour',
     '1995-05-10', N'M'),

    (N'Sara', N'Mohamed', N'01123456789',
     N'sara@gmail.com', N'Alexandria',
     '2000-08-15', N'F'),

    (N'Youssef', N'Ali', N'01134567890',
     N'youssef@gmail.com', N'Damanhour',
     '2015-02-20', N'M'),

    (N'Nour', N'Hassan', N'01145678901',
     N'nour@gmail.com', N'Beheira',
     '1998-11-25', N'F'),

    (N'Adam', N'Samir', N'01156789012',
     N'adam@gmail.com', N'Alexandria',
     '2012-07-12', N'M');


-- 7. STAFF
INSERT INTO STAFF
    (FirstName, LastName, Phone, Email, JobTitle)
VALUES
    (N'Khaled', N'Said', N'01212345678',
     N'khaled@gmail.com', N'Reception'),

    (N'Mariam', N'Adel', N'01223456789',
     N'mariam@gmail.com', N'Assistant');


-- 8. APPOINTMENT
INSERT INTO APPOINTMENT
    (PatientID, DoctorID, AppointmentDate,
     AppointmentTime, Status, Notes, StaffID)
VALUES
    (1, 1, '2026-10-20', '10:00:00',
     N'Completed', N'First visit', 1),

    (2, 2, '2026-10-21', '11:30:00',
     N'Completed', N'Skin problem', 1),

    (3, 3, '2026-10-22', '12:00:00',
     N'Completed', N'Child checkup', 2),

    (4, 1, '2026-10-28', '13:00:00',
     N'Confirmed', N'Follow-up visit', 2),

    (5, 3, '2026-10-29', '14:00:00',
     N'Pending', N'General checkup', 1);


-- 9. MEDICALVISIT
INSERT INTO MEDICALVISIT
    (AppointmentID, VisitDate, Symptoms,
     Diagnosis, MedicalNotes, Recommendations)
VALUES
    (1, '2026-10-20 10:15:00',
     N'Chest pain', N'Heart problem',
     N'Follow-up needed', N'Rest and follow-up'),

    (2, '2026-10-21 11:45:00',
     N'Skin itching', N'Dermatitis',
     N'Mild inflammation', N'Avoid skin irritants'),

    (3, '2026-10-22 12:10:00',
     N'Fever and cough', N'Common cold',
     N'Mild symptoms', N'Rest and drink fluids');


-- 10. PRESCRIPTION
INSERT INTO PRESCRIPTION
    (VisitID, PrescriptionDate, Instructions)
VALUES
    (1, '2026-10-20', N'Follow dosage instructions'),
    (2, '2026-10-21', N'Use prescribed treatment'),
    (3, '2026-10-22', N'Take medicine after meals');


-- 11. MEDICINE
INSERT INTO MEDICINE
    (MedicineID, MedicineName, Manufacturer,
     Price, StockQuantity, ExpiryDate)
VALUES
    (1, N'Paracetamol', N'Pharma A',
     50.00, 100, '2027-12-31'),

    (2, N'Amoxicillin', N'Pharma B',
     75.50, 80, '2027-06-30'),

    (3, N'Ibuprofen', N'Pharma C',
     60.00, 50, '2028-01-31'),

    (4, N'Cetirizine', N'Pharma D',
     40.00, 120, '2027-09-30'),

    (5, N'Vitamin C', N'Pharma E',
     35.00, 150, '2028-05-31');


-- 12. PRESCRIPTIONMEDICINE
INSERT INTO PRESCRIPTIONMEDICINE
    (PrescriptionID, MedicineID, Dosage,
     Frequency, Duration, Instructions)
VALUES
    (1, 1, N'500 mg', N'Twice daily',
     N'5 days', N'After meals'),

    (1, 3, N'200 mg', N'Once daily',
     N'3 days', N'After meals'),

    (2, 4, N'10 mg', N'Once daily',
     N'7 days', N'Before sleep'),

    (3, 1, N'500 mg', N'Twice daily',
     N'5 days', N'After meals'),

    (3, 5, N'500 mg', N'Once daily',
     N'10 days', N'After breakfast');


-- 13. PAYMENT
INSERT INTO PAYMENT
    (PaymentID, AppointmentID, Amount,
     PaymentDate, PaymentMethod, PaymentStatus,
     ReferenceNumber)
VALUES
    (1, 1, 300.00, '2026-10-20',
     N'Cash', N'Paid', N'REF1001'),

    (2, 2, 250.00, '2026-10-21',
     N'Card', N'Paid', N'REF1002'),

    (3, 3, 200.00, '2026-10-22',
     N'Cash', N'Paid', N'REF1003'),

    (4, 4, 300.00, '2026-10-28',
     N'Card', N'Pending', N'REF1004'),

    (5, 5, 200.00, '2026-10-29',
     N'Cash', N'Pending', N'REF1005');


-- 14. APPOINTMENTHISTORY
INSERT INTO APPOINTMENTHISTORY
    (HistoryID, AppointmentID, OldStatus,
     NewStatus, ChangedAt, StaffID, ChangeReason)
VALUES
    (1, 1, N'Pending', N'Completed',
     '2026-10-20 10:30:00', 1,
     N'Appointment completed'),

    (2, 2, N'Pending', N'Completed',
     '2026-10-21 12:00:00', 1,
     N'Appointment completed'),

    (3, 3, N'Confirmed', N'Completed',
     '2026-10-22 12:30:00', 2,
     N'Appointment completed'),

    (4, 4, N'Pending', N'Confirmed',
     '2026-10-25 09:00:00', 2,
     N'Patient confirmed appointment'),

    (5, 5, N'Pending', N'Pending',
     '2026-10-26 10:00:00', 1,
     N'Appointment created');
GO