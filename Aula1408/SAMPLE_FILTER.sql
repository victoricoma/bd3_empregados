select
	depto.nome as departamento,
    count(emp.cod_emp) as n_empregados,
    sum(emp.salario) as orcamento_rh,
    concat("R$ ",((sum(emp.salario)/count(emp.cod_emp)),2)) as media_salario
from
	departamento depto,
    empregado emp
where
	depto.cod_depto=emp.cod_depto
group by 
	depto.nome;