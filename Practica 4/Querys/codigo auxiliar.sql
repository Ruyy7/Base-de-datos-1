-- DELIMITER //
-- CREATE PROCEDURE cantidad_appointments_paciente (IN id_patient INTEGER))
-- BEGIN
-- DECLARE cant_appointments INTEGER;
-- DECLARE fecha DATETIME;
-- DECLARE usuario_realiza VARCHAR(20);
-- START TRANSACTION
-- SET cant_appointments = SELECT count(*)
-- 					FROM appointment a
--                     WHERE a.patient = id_patient
-- COMMIT;
-- END//
-- DELIMITER;



-- EXPLAIN select count(a.patient_id) 
-- from appointment a, patient p, doctor d, medical_review mr 
-- where a.patient_id= p.patient_id 
-- and a.patient_id= mr.patient_id 
-- and a.appointment_date=mr.appointment_date 
-- and mr.doctor_id = d.doctor_id 
-- and d.doctor_specialty = 'Cardiology' 
-- and p.patient_city = 'Rosario'

-- EXPLAIN select count(a.patient_id)
-- from appointment a inner join patient p ON (a.patient_id = p.patient_id)
-- inner join medical_review mr ON (p.patient_id = mr.patient_id) and ()
-- inner join doctor d ON (mr.doctor_id = d.doctor_id)
-- where a.appointment_date = mr.appointment_date 
-- and d.doctor_specialty = 'Cardiology'
-- and p.patient_city = 'Rosario';

-- CREATE INDEX idx_patient_city ON patient(patient_city);
-- CREATE INDEX idx_doctor_speciality ON doctor(doctor_specialty);
-- CREATE INDEX idx_patient_id ON appointment(patient_id);
-- CREATE INDEX idx_doctor_id ON medical_review(doctor_id);


-- EXPLAIN select count(a.patient_id)
-- from appointment a inner join patient p ON (a.patient_id = p.patient_id)
-- inner join medical_review mr ON (p.patient_id = mr.patient_id) and (a.appointment_date = mr.appointment_date)
-- inner join doctor d ON (mr.doctor_id = d.doctor_id)
-- where d.doctor_specialty = 'Cardiology'
-- and p.patient_city = 'Rosario';

CREATE PROCEDURE cant_appointments_patient (IN patient_id INT)
BEGIN
	DECLARE cant_appointments INT;
	DECLARE repeticiones CURSOR FOR
		SELECT count(*)
		FROM appointment
		WHERE appointment.patient_id = patient_id;
	DECLARE fin INT default 0;
    
    START transaction
		OPEN repeticiones;
        loop_cursor : LOOP
			
		END LOOP;
    commit;
END;