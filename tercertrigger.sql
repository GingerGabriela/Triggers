--trigger que se cambie el nombre o la provincia
set serveroutput on;											
create or replace trigger modi_cli after insert or update of nombre, provincia on tcliente
	begin		
		if inserting then
			dbms_output.put_line('se ha insertado en tcliente');
		end if;
		if updating('nombre') then
			dbms_output.put_line('se ha modificado el nombre en tcliente');
		end if;
		if updating('provincia') then
			dbms_output.put_line('se ha modificado la provincia en tcliente');
		end if;
	end;
	/