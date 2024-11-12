CREATE TRIGGER agregar_auditoria
AFTER INSERT ON RECIBE_SANCION
For each row begin
    if (NEW.gravedad = 'Alta') then
        Insert into AUDITORIA (#empleado,#sancion,prioridad) Values (NEW.#empleado,NEW.#sancion,'Inmediata')
    end if;
End;