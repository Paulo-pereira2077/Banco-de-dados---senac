create database exercicio7_06_10_2025;

use exercicio7_06_10_2025;

    -- outro exercício 1 - Calculadora
    
    delimiter $$
    create procedure sp_calculadora (num1 decimal, operacao char(1), num2 decimal)
    begin 
		declare resultadoOperacao decimal;
        
        if operacao = '+' then set resultadoOperacao = num1 + num2;
            select concat(resultadoOperacao) as Resultado;
        elseif operacao = '-' then set resultadoOperacao = num1 - num2;
            select concat(resultadoOperacao) as Resultado;    
        elseif operacao = '*' then set resultadoOperacao = num1 * num2;
            select concat(resultadoOperacao) as Resultado;
        elseif operacao = '/' then
        if num2 != 0 then set resultadoOperacao = num1 / num2;
            select concat(resultadoOperacao) as Resultado;
            
        else
				select 'Erro';
		end if;
    
    else 
		select 'Operação inválida! Use +, -, * ou /' as Resultado;
	end if;    
    end$$
    
    delimiter ;

call sp_calculadora(10, '-', 5);

-- exercrício 2 - Calcular média das notas
delimiter $$
create procedure sp_calcularMedia (nota1 decimal(5.2), nota2 decimal(5.2), nota3 decimal(5.2), nota4 decimal(5.2))
begin 
	declare media decimal(5.2);
    
	if (nota1 between 0 and 10)
    and (nota2 between 0 and 10)
    and (nota3 between 0 and 10)
    and (nota4 between 0 and 10) then
    
    set media = (nota1 + nota2 + nota3 + nota4) / 4;
    
    select concat('A média final é: ', media) as Resultado;
    
    else
		select 'Erro: As notas devem estar entre 0 e 10!' as Resultado;
	end if;
    
    end$$    
    delimiter ;
    
    call sp_calcularMedia (12.0, 4.3, 5.4, 10.0);
    
