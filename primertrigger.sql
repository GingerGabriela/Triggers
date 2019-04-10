--primer trigger
set serveroutput on;											
create or replace trigger Borrar_emp after delete on empleado for each row
	begin														--si se pone old debe haber un for each row
		dbms_output.put_line('Se ha borrado un empleado ' || :old.nombre);
	end;
	/