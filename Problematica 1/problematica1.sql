CREATE TABLE tipo_cliente (

id_tipo_cliente INTEGER NOT NULL ,
tipo_de_cliente TEXT NOT NULL,
PRIMARY KEY ("id_tipo_cliente" AUTOINCREMENT)

);

INSERT INTO tipo_cliente (tipo_de_cliente)

VALUES

	("CLASSIC"),
	("GOLD"),
	("BLACK");

CREATE TABLE marca_tarjetas (

id_marca_tarjetas INTEGER NOT NULL,
nombre_marca_tarjeta TEXT NOT NULL,
PRIMARY KEY ("id_marca_tarjetas" AUTOINCREMENT)

);

INSERT INTO marca_tarjetas (nombre_marca_tarjeta)

VALUES

	("Mastercard"),
	("Visa"),
	("American Express");
	
CREATE TABLE tipo_cuenta (

id_tipo_cuenta INTEGER PRIMARY KEY,
tipo_de_cuenta TEXT NOT NULL

);

INSERT INTO tipo_cuenta (tipo_de_cuenta)

VALUES

	("Caja de ahorro en Pesos"),
	("Caja de ahorro en dolares"),
	("Cuenta corriente en Pesos"),
	("Cuenta corriente en dolares"),
	("Cuenta inversion");

CREATE TABLE tarjetas (
	
	numero INTEGER NOT NULL UNIQUE,
	CVV INTEGER NOT NULL,
	fecha_de_otorgamiento INTEGER NOT NULL,
	fecha_de_expiracion INTEGER NOT NULL,
	tipo_de_tarjeta TEXT NOT NULL,
	id_marca_tarjetas INTEGER NOT NULL ,
	id_tipo_cliente INTEGER NOT NULL,
	FOREIGN KEY (id_marca_tarjetas) REFERENCES marca_tarjetas(id_marca_tarjetas) ON DELETE CASCADE,
	FOREIGN KEY (id_tipo_cliente) REFERENCES tipo_cliente(id_tipo_cliente) ON DELETE CASCADE
);

CREATE TABLE direcciones (

	calle TEXT NOT NULL,
	numero INTEGER NOT NULL,
	ciudad TEXT NOT NULL,
	provincia TEXT NOT NULL,
	pais TEXT NOT NULL,
	customer_id INTEGER NOT NULL,
	employee_id INTEGER NOT NULL,
	branch_id INTEGER NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES cliente(customer_id) ON DELETE CASCADE,
	FOREIGN KEY (employee_id) REFERENCES empleado(employee_id) ON DELETE CASCADE,
	FOREIGN KEY (branch_id) REFERENCES sucursal(branch_id) ON DELETE CASCADE

)


