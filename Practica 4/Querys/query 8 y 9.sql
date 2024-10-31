DELIMITER //
CREATE PROCEDURE add_appointment (IN patient_id INT,IN doctor_id INT,IN appointment_duration INT, IN contact_phone varchar(45), IN appointment_adress varchar(255), IN medication_name varchar(30))
BEGIN
	DECLARE fecha_hoy DATETIME; 
    SET fecha_hoy = now();
    START TRANSACTION;
		INSERT INTO appointment (patient_id,appointment_date,appointment_duration,contact_phone,observations,payment_card) VALUES (patient_id,fecha_hoy,appointment_duration,contact_phone,appointment_adress,null);
		INSERT INTO medical_review (patient_id,appointment_date,doctor_id) VALUES (patient_id,fecha_hoy,doctor_id);
        INSERT INTO prescribed_medication (patient_id,appointment_date,medication_name) VALUES (patient_id,fecha_hoy,medication_name);
	COMMIT;
END;
