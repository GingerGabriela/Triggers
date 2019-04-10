--segundo trigger
set serveroutput on;											
create or replace trigger mor_cli after insert or update on tcliente
	begin		
		if inserting then
			dbms_output.put_line('se ha insertado en tcliente');
		end if;
		if updating then
			dbms_output.put_line('se ha modificado en tcliente');
		end if;
	end;
	/