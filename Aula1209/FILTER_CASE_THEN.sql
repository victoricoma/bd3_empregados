create view vw_empregados_irpf_prof
as
select
	emp.nome as empregado,
    emp.salario as renda,
    format(emp.salario * 13.35,2) as renda_total,
    case
		when emp.salario< 2112 then "Faixa 0"
        when emp.salario< 2826.65 then "Faixa 7,5"
        when emp.salario< 3751.05 then "Faixa 15,0"
        when emp.salario< 4664.68 then "Faixa 22,5"
        else "Faixa 27,5"
	end as IRPF,
        case
		when emp.salario< 2112 then 0
        when emp.salario< 2826.65 then format((emp.salario * 0.075),2)
        when emp.salario< 3751.05 then format((emp.salario * 0.15),2)
        when emp.salario< 4664.68 then format((emp.salario * 0.225),2)
        else format((emp.salario * 0.275),2)
	end as valor_imposto,
    count(dep.cod_dep) as dependentes
from 
	empregado emp,
	dependente dep
where
	emp.cod_emp = dep.cod_emp
group by 
	emp.nome,
    emp.salario;