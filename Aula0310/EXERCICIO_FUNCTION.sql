/*Vamos construir um função que conta o volume de dependentes do funcionario
multiplica pelo valor de desconto e retorna o valor já abatido.*/

delimiter //
create function calc_abatimento(nd int, renda int)
returns decimal(10,2)
begin
	declare abatimento decimal(10,2);
	set abatimento = (renda * 13.3)-(nd * 2275.08);
	return abatimento;
end //
delimiter ;

select
emp.nome as empregado,
calc_abatimento(count(dep.cod_dep), emp.salario) as abatimento
from empregado emp
left join dependente dep
on emp.cod_emp = dep.cod_emp
group by emp.nome, emp.salario;