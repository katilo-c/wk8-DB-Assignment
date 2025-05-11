--Create  Clinic Booking System the database
CREATE DATABASE IF NOT EXISTS clinic_system;
USE clinic_system;

--Create the patients table
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100),
    address TEXT
);

--Create the doctors table
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100)
);

-- Create the appointments table
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    reason TEXT,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

--Create the treatments table
CREATE TABLE treatments (
    treatment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    description TEXT,
    prescribed_medication TEXT,
    treatment_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- Insert patients data 
INSERT INTO patients (first_name, last_name, dob, gender, phone, email, address)
VALUES 
('John', 'Doe', '1985-06-15', 'Male', '0700123456', 'john.doe@example.com', '123 Main St, Nairobi'),
('Jane', 'Smith', '1992-09-25', 'Female', '0700987654', 'jane.smith@example.com', '456 Park Ave, Mombasa'),
('Emily', 'Clark', '1988-03-12', 'Female', '0711223344', 'emily.clark@example.com', '789 River Rd, Kisumu'),
('Michael', 'Owino', '1979-01-30', 'Male', '0712345678', 'm.owino@example.com', '12 Hilltop Dr, Nakuru'),
('Lucy', 'Njeri', '1995-07-08', 'Female', '0723456789', 'lucy.njeri@example.com', '34 Lakeview Rd, Eldoret');

-- Insert doctors
INSERT INTO doctors (first_name, last_name, specialization, phone, email)
VALUES 
('James', 'Omondi', 'Cardiologist', '0722334455', 'j.omondi@clinic.com'),
('Grace', 'Mwende', 'Dermatologist', '0733445566', 'g.mwende@clinic.com'),
('Kevin', 'Otieno', 'General Practitioner', '0744556677', 'k.otieno@clinic.com'),
('Sarah', 'Kariuki', 'Pediatrician', '0755667788', 's.kariuki@clinic.com'),
('David', 'Mutiso', 'Orthopedic', '0766778899', 'd.mutiso@clinic.com');

-- Insert appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, reason, status)
VALUES
(1, 1, '2025-05-12 09:30:00', 'Chest pain and shortness of breath', 'Scheduled'),
(2, 2, '2025-05-13 11:00:00', 'Skin rash and irritation', 'Completed'),
(3, 3, '2025-05-14 14:00:00', 'Routine checkup and blood test', 'Scheduled'),
(4, 4, '2025-05-15 10:00:00', 'Child vaccination', 'Scheduled'),
(5, 5, '2025-05-16 15:30:00', 'Back pain after a fall', 'Cancelled');

-- Insert treatments
INSERT INTO treatments (appointment_id, description, prescribed_medication, treatment_date)
VALUES
(1, 'ECG and blood pressure monitoring', 'Aspirin 75mg daily', '2025-05-12'),
(2, 'Topical cream application and allergy test', 'Hydrocortisone cream', '2025-05-13'),
(3, 'Physical exam and basic blood work', 'Multivitamins', '2025-05-14'),
(4, 'Administered vaccines and gave parenting advice', 'Vitamin D drops', '2025-05-15'),
(5, 'X-ray ordered, initial pain relief given', 'Ibuprofen 400mg', '2025-05-16');
