use empregados_prof;

delimiter //
create function abatimentoSalario(taxa int, pr int)
returns varchar(20)
begin
	declare abatimento varchar(20);
    if pr < (2112*13.3) then set abatimento = "isento";
    else set abatimento = "imposto";
    end if;
    return abatimento;
end //
delimiter ;

select abatimentoSalario(0, (salario*13.3)) as abatimento from empregado;

drop function abatimentoSalario;