-- Customer --
SELECT *
FROM customer

CREATE OR REPLACE FUNCTION add_customer(
	_first_name VARCHAR(50),
	_last_name VARCHAR(50),
	_address VARCHAR(150),
	_email VARCHAR(100),
	_phone VARCHAR(14),
	_billing_info VARCHAR(100))
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO customer(first_name, last_name, address, email, phone, billing_info)
	VALUES(_first_name, _last_name, _address, _email, _phone, _billing_info);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_customer('Paul', 'Walker',
					'980 Carrera St, Los Angeles, CA 90210, USA',
					'pwalker@PorschesAreFastAF.com',
					'123-456-7890',
					'0987 6543 3210 1234 01/30 123')
					
SELECT add_customer('Dominic', 'Toretto',
					'143 Familia St, Los Angeles, CA 90210, USA',
					'pwalker@PorschesAreFastAF.com',
					'123-654-7890',
					'1987 6543 3210 1234 01/30 123')
					
SELECT add_customer('Ferris', 'Bueller',
					'4160 Country Club Drive, Long Beach, CA 90807, USA',
					'bowbowOhYeah@ChickChickaChicka.com',
					'321-456-7890',
					'1237 6543 3210 1234 01/30 123')
					
UPDATE customer
SET email = 'ParaMiFamilia@family.com'
WHERE last_name = 'Toretto'


-- Sales Service Staff --
SELECT *
FROM sales_service_staff

CREATE OR REPLACE FUNCTION add_staff(
	_first_name VARCHAR(50),
	_last_name VARCHAR(50),
	_department VARCHAR(50))
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO sales_service_staff(first_name, last_name, department)
	VALUES(_first_name, _last_name, _department);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_staff('Harry', 'Wormwood',
				'Sales')
				
SELECT add_staff('Jerry', 'Lundegaard',
				'Sales')

SELECT add_staff('Bobby', 'Bee',
				'Service')
				
SELECT add_staff('Charlie', 'Cee',
				'Service')


-- Vehicle Inventory --
SELECT *
FROM vehicle_inventory

CREATE OR REPLACE FUNCTION add_vehicle_inventory(
	_vin VARCHAR(17),
	_make VARCHAR(50),
	_model VARCHAR(50),
	_year INTEGER,
	_vintage VARCHAR(10),
	_mileage INTEGER,
	_price NUMERIC(9,2)
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO vehicle_inventory(vin, make, model, year, vintage, mileage, price)
	VALUES(_vin, _make, _model, _year, _vintage, _mileage, _price);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_vehicle_inventory('1G1PG5SC3C7258239',
							 'Ferrari',
							 'Modena Spyder',
							 1985,
							 'Used',
							 301,
							 396000.00)

SELECT add_vehicle_inventory('SCEDT26T8BD005261',
							 'DeLorean',
							 'DMC-12',
							 1982,
							 'Used',
							 981,
							 40219.22)


-- Vehicles Serviced --
SELECT *
FROM vehicle_serviced

CREATE OR REPLACE FUNCTION add_vehicle_serviced(
	_vin VARCHAR(17),
	_make VARCHAR(50),
	_model VARCHAR(50),
	_year INTEGER,
	_mileage INTEGER
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO vehicle_serviced(vin, make, model, year, mileage)
	VALUES(_vin, _make, _model, _year, _mileage);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_vehicle_serviced(
	'JT2JA82J1R0022083',
	'Toyota',
	'Supra',
	1994,
	75000
)

SELECT add_vehicle_serviced(
	'JM1FD3313P0209974',
	'Mazda',
	'RX-7',
	1993,
	98234
)


-- Parts --
SELECT *
FROM parts

CREATE OR REPLACE FUNCTION add_parts(
	_name VARCHAR(50),
	_price NUMERIC(7,2)
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO parts(name, price)
	VALUES (_name, _price);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_parts('oil', 20.00)
SELECT add_parts('brakes', 400.00)


-- Services --
SELECT *
FROM services

CREATE OR REPLACE FUNCTION add_services(
	_name VARCHAR(50),
	_price NUMERIC(7,2)
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO services(name, price)
	VALUES (_name, _price);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_services('Oil Change', 20.00)
SELECT add_services('Brake Change', 200.00)
SELECT add_services('Rotate Tires', 20.00)


-- Invoice --
SELECT *
FROM invoice

INSERT INTO invoice(
	total_cost,
	date,
	staff_id,
	customer_id,
	vin
)VALUES (
	400000,
	'2022-11-12',
	1,
	3,
	'1G1PG5SC3C7258239'
)


-- Service Ticket --
SELECT *
FROM service_ticket

INSERT INTO service_ticket(
	"date",
	total_cost,
	staff_id,
	customer_id,
	vin
)VALUES (
	'2022-11-11',
	240.00,
	3,
	1,
	'JT2JA82J1R0022083'
)

-- SERVICE & Parts --
SELECT *
FROM service_parts

INSERT INTO service_parts(
	service_id,
	parts_id,
	parts_quantity,
	service_ticket_id
)VALUES (
	1,
	1,
	1,
	1
)

INSERT INTO service_parts(
	service_id,
	parts_id,
	parts_quantity,
	service_ticket_id
)VALUES (
	2,
	2,
	4,
	1
)

INSERT INTO service_parts(
	service_id,
	parts_id,
	parts_quantity,
	service_ticket_id
)VALUES (
	8,
	NULL,
	NULL,
	1
)

-- Mechanic --
SELECT *
FROM mechanic

CREATE OR REPLACE FUNCTION add_mechanic(
	_first_name VARCHAR(50),
	_last_name VARCHAR(50))
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO mechanic(first_name, last_name)
	VALUES(_first_name, _last_name);
END;
$MAIN$
LANGUAGE plpgsql;
	
SELECT add_mechanic('David', 'Puddy')
SELECT add_mechanic('Arthur', 'Fonzarelli')


-- Services Mechanic --
SELECT *
FROM service_mechanics

INSERT INTO service_mechanics(
	mechanic_id,
	service_ticket_id
)VALUES (
	1,
	1
)

INSERT INTO service_mechanics(
	mechanic_id,
	service_ticket_id
)VALUES (
	2,
	1
)

-- Service History --
SELECT *
FROM service_history

INSERT INTO service_history(
	service_ticket_id
)VALUES (
	1
)