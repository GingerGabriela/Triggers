set serveroutput on
create or replace trigger audiModif after insert or delete or update on empleado for each row
	--cambio varchar2(100);
begin
	if inserting then
		insert into auditarEmpl values (sysdate,:new.num_emp, :new.nombre,' Insertado', null);
	end if;
	if deleting then
		insert into auditarEmpl values (sysdate, :old.num_emp, :old.nombre, ' Borrado', null);
	end if;
	if updating ('fecha_alta') then 
		insert into auditarEmpl values (sysdate,:new.num_emp, :new.nombre, ' Modificacion',:old.fecha_alta || ' fecha vieja ' || :new.fecha_alta || ' fecha nueva' ); 
	end if;
	if updating ('nombre') then
		insert into auditarEmpl values (sysdate,:new.num_emp, :new.nombre, ' Modificacion',:old.nombre || ' nombre nuevo ' || :new.nombre || ' nombre nuevo' ); 
	end if;	
end;
/