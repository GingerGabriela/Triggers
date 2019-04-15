create or replace trigger borrarAlumnos before delete on alum for each row
declare
	contnue	number(1);
	contanti	number(1);
begin
	select count(*) into contnue from nuevos where nombre=:old.nombre;
	select count(*) into contanti from antiguos where nombre=:old.nombre;
	if contnue >0 then
		delete from nuevos where nombre=:old.nombre;
	end if;
	if contanti>0 then
		delete from antiguos where nombre=:old.nombre;
	end if;
end;
/