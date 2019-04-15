create or replace trigger borraralum after delete on nuevos for each row
declare
antig	antiguos%rowtype;
begin
	select * into antig from antiguos where nombre=:old.nombre;
EXCEPTION
	when no_data_found then
		delete from alum where nombre=:old.nombre;
end;
/