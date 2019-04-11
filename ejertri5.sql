create or replace trigger insercion after insert on tcliente  for each row
declare
	filaven tvendedor%rowtype;
	pro	 tprovincia%rowtype;
BEGIN
	BEGIN
		select * into filaven from tvendedor where cod_ven=:new.vendedor;
	Exception 
		when no_data_found then
			dbms_output.put_line('No existe el vendedor');
	END;
	BEGIN
		select * into pro from tprovincia where codigo=:new.provincia;	
	Exception 
		when no_data_found then
			dbms_output.put_line('No existe la provincia');
	END;
END;	
/
		