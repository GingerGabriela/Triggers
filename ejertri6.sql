create or replace trigger borraPRO before delete on tprovincia for each row
declare 
cont	number(4); --para contar se debe declarar una variable numerica nada de tcliente%rowtype
BEGIN --para sabar si hay clientes hay que contarlas
	select count(*) into cont from tcliente where provincia=:old.codigo;
	if cont >0 then
		RAISE_APPLICATION_ERROR(-20199,'No se puede borrar la provincia');
	end if;
end;
/
	
	
