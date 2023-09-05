select 
	* 
from 
	vw_emp_idade_dep
where
	(idade_dependente between 13 and 19)
    and
    (renda>3960);
    
select 
	*
from
 vw_emp_idade_dep
 where
	(idade_dependente <6)
    and
    (sexo_empregado = "F")
    and
    (renda > 3960);
    
