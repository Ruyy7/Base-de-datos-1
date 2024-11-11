CREATE TRIGGER incrementar_cant_comentarios 
AFTER INSERT ON COMENTARIO
FOR EACH ROW
BEGIN
	UPDATE ACTIVIDAD 
	SET cantidad_comentarios = cantidad_comentarios + 1
    WHERE #actividad = NEW.#actividad
END
