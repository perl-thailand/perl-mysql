CREATE TABLE perl_thailand.tb_bill_sale (
	bill_sale_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
);

CREATE TABLE perl_thailand.tb_bill_sale_detail (
	bill_sale_detail_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	bill_id INT UNSIGNED,
	INDEX bill_id (bill_id)
);

DELIMITER ;;
CREATE PROCEDURE perl_thailand.insert_data(x INT, y INT) 
BEGIN 
	DECLARE i INT DEFAULT 0; 
	DECLARE billId INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
	WHILE i < x DO
		INSERT INTO perl_thailand.tb_bill_sale VALUES();
		SET billId = (SELECT LAST_INSERT_ID());
		SET j = 0;
		WHILE j < y DO
			INSERT INTO perl_thailand.tb_bill_sale_detail(bill_id) VALUES(billId);
			SET j = j + 1;
		END WHILE;
		SET i = i + 1;
	END WHILE;
END;;
DELIMITER ;