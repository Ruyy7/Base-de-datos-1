DELIMITER //
CREATE PROCEDURE cant_appointments_patient ()
BEGIN
	DECLARE fin INT default 0;
    DECLARE patient_id INT(11);
	DECLARE cant_appointments INT(11);
	DECLARE repeticiones_cursor CURSOR FOR
		SELECT appointment.patient_id, count(*)
		FROM appointment
		group by appointment.patient_id;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
    
    START transaction;
		OPEN repeticiones_cursor;
        loop_cursor : LOOP
			FETCH repeticiones_cursor INTO patient_id, cant_appointments;
            IF fin THEN 
				LEAVE loop_cursor;
			END IF;
            
            INSERT INTO appointments.APPOINTMENTS_PER_PATIENT(id_patient,count_appointments,last_update,user) VALUES (patient_id, cant_appointments, NOW(), CURRENT_USER());
			
		END LOOP;
        CLOSE repeticiones_cursor;
    commit;
END ;