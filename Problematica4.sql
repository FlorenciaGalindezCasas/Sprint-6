1) Listar la cantidad de clientes por nombre de sucursal ordenando de mayor a menor

    SELECT branch_name, COUNT(cliente.customer_id) AS cantidad_clientes
    FROM sucursal
    INNER JOIN cliente ON cliente.branch_id = sucursal.branch_id
    GROUP BY branch_name
    ORDER BY COUNT(cliente.customer_id)DESC

2) Obtener la cantidad de empleados por cliente por sucursal en un número real
    

3) Obtener la cantidad de tarjetas de crédito por tipo por sucursal

    SELECT branch_id, tipo_de_tarjeta, COUNT(tarjetas.customer_id) AS cantidad_tarjetas
    FROM tarjetas
    INNER JOIN cliente ON cliente.customer_id = tarjetas.customer_id
    WHERE tipo_de_tarjeta = "credito"
    GROUP BY branch_id

4) Obtener el promedio de créditos otorgado por sucursal

    CREATE VIEW IF NOT EXISTS promedio_view AS
    SELECT branch_id, COUNT(branch_id) AS cantidad_prestamos_sucursal
    FROM prestamo
    INNER JOIN cliente ON cliente.customer_id = prestamo.customer_id
    GROUP BY branch_id

    SELECT *, avg(cantidad_prestamos_sucursal) FROM promedio_view
    GROUP BY branch_id

5) La información de las cuentas resulta critica para la compañía, por eso es necesario crear una tabla denominada “auditoria_cuenta” para guardar los datos movimientos, con los siguientes campos: old_id, new_id, old_balance, new_balance, old_iban, new_iban, old_type, new_type, user_action, created_at 
 - Crear un trigger que después de actualizar en la tabla cuentas los campos balance, IBAN o tipo de cuenta registre en la tabla auditoria
 - Restar $100 a las cuentas 10,11,12,13,14

 CREATE TABLE auditoria_cuenta(
    old_id INTEGER NOT NULL,
    new_id INTEGER NOT NULL,
    old_balance INTEGER NOT NULL,
    new_balance INTEGER NOT NULL,
    old_iban INTEGER NOT NULL,
    new_iban INTEGER NOT NULL,
    old_type TEXT NOT NULL,
    new_type TEXT NOT NULL,
    user_action TEXT NOT NULL,
    created_at TEXT NOT NULL,
    FOREIGN KEY (old_id) REFERENCES cuenta(account_id) ON DELETE CASCADE,
    FOREIGN KEY (old_balance) REFERENCES cuenta(balance) ON DELETE CASCADE,
    FOREIGN KEY (old_iban) REFERENCES cuenta(iban) ON DELETE CASCADE,
    FOREIGN KEY (old_type) REFERENCES cuenta(id_tipo_cuenta) ON DELETE CASCADE
 );

- CREATE TRIGGER IF NOT EXISTS actualizar_cuenta
  AFTER UPDATE ON cuenta 
  WHEN old_balance <> new_balance
    OR old_iban <> new_iban
    OR old_type <> new_type
  BEGIN
    INSERT INTO auditoria_cuenta(
	  old_id,
      new_id,
      old_balance,
      new_balance,
      old_iban,
      new_iban,
      old_type,
      new_type,
      user_action,
      created_at
	 )
  VALUES
     (
      old.id,
      new.id,
      old.balance,
      new.balance,
      old.iban,
      new.iban,
      old.type,
      new.type,
      'UPDATE',
	  DATETIME('NOW')      
	  );
  END;
