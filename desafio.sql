-- CRIANDO INDICES 
use company;
CREATE INDEX idx_full_name ON employee(Fname,Lname);
CREATE INDEX idx_name_project ON project(Pname);

-- Qual departamento com o maior número de pessoas?
SELECT COUNT(e.Ssn) qntd_pessoas, d.Dnumber
FROM departament d
INNER JOIN employee e 
ON d.Dnumber = e.Dno
GROUP BY d.Dnumber;

-- Quais são os departamentos por cidade?
SELECT * FROM dept_locations;

-- Relação de empregados por departamento
SELECT CONCAT(e.Fname,' ', e.Minit, ' ', e.Lname) nome_empregado, d.Dname nome_departamento
	FROM employee e 
    INNER JOIN departament d
    ON e.Dno = d.Dnumber;
    
    -- Parte 02 Desafio
    DROP PROCEDURE manage_emplpoyee;
    DELIMITER //
    CREATE PROCEDURE manage_emplpoyee(IN options INT)
		BEGIN
		CASE 
		WHEN options = 1 THEN SELECT CONCAT(Fname, ' ', Minit, ' ', LName) nome_completo FROM employee;
		WHEN options = 2 THEN UPDATE employee SET Fname = 'Neymar' WHERE Ssn = '33000.00';
		WHEN options = 3 THEN DELETE FROM employee WHERE Ssn = '33000.00';
		ELSE
			SELECT 'Escolha uma opção válida! (1,2 ou 3)' erro;
		END CASE;
	END
    //
    DELIMITER ;


