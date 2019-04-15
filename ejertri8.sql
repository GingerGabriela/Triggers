create or replace trigger borrarAlumnos before delete on alum for each row
declare
	nue		nuevos%rowtype;
	ant		antiguos%rowtype;
begin
	begin
		select * into nue from nuevos where nombre=:old.nombre;
		RAISE_APPLICATION_ERROR(-20199,'El alumno existe en la tabla nuevo');
	EXCEPTION
		when no_data_found then
			null;
	end;
	begin
		select * into ant from antiguos where nombre=:old.nombre;
		RAISE_APPLICATION_ERROR(-20100,'El alumno existe en la tabla Antiguo');
	EXCEPTION
		when no_data_found then
			null;
	end;
end;
/