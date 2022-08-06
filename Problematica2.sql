


2) Insertar 5 nuevos clientes en la base de datos y verificar que se haya realizado con éxito la inserción
    INSERT INTO cliente (customer_name,customer_surname,customer_DNI,branch_id,dob)
    VALUES
	('Agustin','Lorca',40596443,80,'1997-08-01'),
	('Florencia','Galindez',4055464,45,'1997-03-21'),
	('Tomas','Allami',43220413,77,'1999-03-28'),
	('German','Garbarini',42207908,96,'1998-02-10'),
	('Candela','Vidal',41050725,27,'1998-10-08');

3) Actualizar 5 clientes recientemente agregados en la base de datos dado que hubo un error en el JSON que traía la información, la sucursal de todos es la 10
    
    UPDATE cliente SET branch_id = 10 WHERE customer_id IN (SELECT customer_id FROM cliente ORDER BY customer_id DESC LIMIT 5)

4) Eliminar el registro correspondiente a “Noel David” realizando la selección por el nombre y apellido

    DELETE FROM cliente WHERE customer_name = 'Noel' and customer_surname = 'David'

5) Consultar sobre cuál es el tipo de préstamo de mayor importe
    SELECT loan_type,loan_total FROM prestamo ORDER BY loan_total DESC LIMIT 1