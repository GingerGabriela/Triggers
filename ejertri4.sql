--crear un trigger que impida el borrado de un empleado en fin de semana
--y que lo haga explicito al usuario que lo intenta con un mensaje adecuado
create or replace trigger finSemana before delete on empleado
begin
	--if deleting then
	if to_number(to_char(sysdate,'d')=6) or to_number(to_char(sysdate,'d')=7) then
		RAISE_APPLICATION_ERROR(-20345, 'User no se puede borrar al empleado los sabados o Domingos');
	end if;
end;
/