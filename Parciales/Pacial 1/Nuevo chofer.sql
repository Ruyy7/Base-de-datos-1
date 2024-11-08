-- Nuevo chofer
CREATE PROCEDURE nuevo_chofer (IN dni int, IN licencia_desde datetime, in licencia_hasta datetime)
    DECLARE nombre varchar(20);
    DECLARE telefono varchar(20);
    DECLARE direccion varchar(20);

    SELECT nombre,telefono,direccion INTO nombre,telefono,direccion
    FROM dueño
    WHERE dueño.dni = dni;

    STAR TRANSACTION
        INSERT INTO CHOFER (dni,licencia_desde,licencia_hasta,nombre,telefono,direccion) VALUES (dni,licencia_desde,licencia_hasta,nombre,telefono,direccion);
    COMMIT;
END;