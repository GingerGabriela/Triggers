create or replace trigger noCambioNombre before update of nombre,num_sup, salario on empleado for each row
begin
		if updating ('nombre') then
			RAISE_APPLICATION_ERROR(-20374,' No se permite modificar el nombre en la tabla Empleado' );
		end if;
		if updating('num_sup') then
			RAISE_APPLICATION_ERROR(-20374,' No se permite modificar el num_sup en la tabla Empleado');
		end if;
		--if updating('salario' :new.salario  >:old.salario *1.1) then 	no es necesario poner salario
		if :new.salario  >:old.salario *1.1 then
			RAISE_APPLICATION_ERROR(-20374,' No se permite modificar el salario con un sueldo superior al 10% en la tabla Empleado');
		end if;
end;
/
	