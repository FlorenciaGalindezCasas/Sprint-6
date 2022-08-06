1) Crear una vista con las columnas id, numero sucursal, nombre, apellido, DNI y edad de la tabla cliente calculada a partir de la fecha de nacimiento

CREATE VIEW IF NOT EXISTS view_cliente AS SELECT customer_id, branch_id, customer_name, customer_surname, customer_DNI, cast(strftime('%Y.%m%d', 'now') - strftime('%Y.%m%d', dob) AS int )AS customer_edad
FROM cliente

- Mostrar las columnas de los clientes, ordenadas por el DNI de menor a mayor y cuya edad sea superior a 40 años

SELECT * FROM view_cliente WHERE customer_edad > 40 ORDER BY customer_DNI DESC

- Mostrar todos los clientes que se llaman “Anne” o “Tyler” ordenados por edad de menor a mayor

SELECT * FROM view_cliente WHERE customer_name = 'Anne' OR customer_name = 'Tyler' ORDER BY customer_edad

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