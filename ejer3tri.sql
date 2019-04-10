create or replace trigger noCambioNombre before update of nombre on empleado for each row
begin
		RAISE_APPLICATION_ERROR(-20374,' No se permite modificar el nombre en la tabla Empleado');
end;
/
	