Problemática 3



1) Seleccionar las cuentas con saldo negativo

    SELECT customer_id, balance FROM cuenta WHERE balance<0 ORDER BY balance DESC;

2) Seleccionar el nombre, apellido y edad de los clientes que tengan en el apellido la letra Z

    SELECT customer_name,customer_surname,cast(strftime('%Y.%m%d', 'now') - strftime('%Y.%m%d', dob) AS int )AS Edad  from cliente WHERE customer_surname LIKE "%z%" ORDER BY customer_name

3) Seleccionar el nombre, apellido, edad y nombre de sucursal de las personas cuyo nombre sea “Brendan” y el resultado ordenarlo por nombre de sucursal

    SELECT customer_name,customer_surname,cast(strftime('%Y.%m%d', 'now') - strftime('%Y.%m%d', dob) AS int )AS Edad,branch_name FROM cliente,sucursal WHERE customer_name ="Brendan" AND cliente.branch_id = sucursal.branch_id ORDER BY branch_name

4) Seleccionar de la tabla de préstamos, los préstamos con un importe mayor a $80.000 y los préstamos prendarios utilizando la unión de tablas/consultas

    SELECT * FROM prestamo where loan_type = "PRENDARIO" INTERSECT SELECT * FROM prestamo where loan_total > 80000

5) Seleccionar los prestamos cuyo importe sea mayor que el importe medio de todos los prestamos

    SELECT loan_total FROM prestamo WHERE loan_total >(SELECT AVG(loan_total) from prestamo)

6) Contar la cantidad de clientes menores a 50 años

    SELECT COUNT(customer_name) FROM cliente WHERE (cast(strftime('%Y.%m%d', 'now') - strftime('%Y.%m%d', dob) AS int) < 50)

7) Seleccionar las primeras 5 cuentas con saldo mayor a 8.000$

    SELECT balance FROM cuenta WHERE(balance>8000) ORDER BY balance ASC LIMIT 5

8) Seleccionar los préstamos que tengan fecha en abril, junio y agosto, ordenándolos por importe

    SELECT loan_date,loan_total FROM prestamo WHERE loan_date LIKE "____-__-0%4%" OR loan_date LIKE "____-__-0%6%" OR loan_date LIKE "____-__-0%8%" ORDER BY loan_total

9) Obtener el importe total de los prestamos agrupados por tipo de préstamos. Por cada tipo de préstamo de la tabla préstamo, calcular la suma de sus importes. Renombrar la columna como loan_total_accu
