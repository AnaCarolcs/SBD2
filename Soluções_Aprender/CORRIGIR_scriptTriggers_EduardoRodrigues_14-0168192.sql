-- --------     << scriptTriggers >>     ------------
-- 
--                    SCRIPT DE DEFINICAO (DDL)
-- 
-- date Criacao ...........: 06/11/2019
-- Autor(es) ..............: Eduardo Júnio Veloso Rodrigues
-- Banco de Dados .........: MySql
-- Base de Dados(nome) ....: scriptTriggers
-- 
-- date Ultima Alteracao ..: 06/11/2019
--   => Criação de triggers
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--         => 03 triggers	 
-- -----------------------------------------------------------------

create database if not exists scriptTriggers;

use scriptTriggers;

/*
 Tabelas usadas nos exemplos
*/
create table tbl_cliente(
	cliente_id int unsigned auto_increment,
    cliente_nome varchar(80) not null,
    cliente_email varchar(80) not null,
    dt_cadastro datetime default current_timestamp,
    constraint tbl_cliente_pk primary key(cliente_id)
)engine=innodb auto_increment=1;

create table tbl_produto(
	produto_id int not null auto_increment,
    produto_nome varchar(80) not null,
    constraint tbl_produto_pk primary key (produto_id)
)engine=innoDb auto_increment=1;

create table tbl_compra(
	dt_cadastro datetime not null,
    cliente_id int not null,
    produto_id int not null
)engine=innodb;

create table tbl_newletter(
	news_id int auto_increment,
    news_email varchar(80) not null,
    constraint tbm_newletter_pk primary key (news_id)
)engine=innodb auto_increment=1;

/*
EXEMPLO 1
*/
delimiter //
create trigger trg_1
	before insert on tbl_cliente	
		for each row
        Begin
			set @nome = new.cliente_nome;
				if ((length(@nome) <= 4) or (@nome = '')) Then
					set new.cliente_nome = null;
				end if;
		end //
delimiter ;

-- insert into tbl_cliente values (default, 'tina', '@', current_timestamp());
insert into tbl_cliente values (default, 'wagner', '@', current_timestamp());

/*
EXEMPLO 2 - Restrição de integridade referencial com triggers
*/

delimiter //
create trigger trg_2
	before insert on tbl_compra
		for each row
        begin
			-- integridade de cliente
			select count(cliente_id) into @cliente_id from tbl_cliente
			where cliente_id = @cliente_id;
            -- integridade de produto
			select count(produto_id) into @produto_id from tbl_produto
			where produto_id = @produto_id;
            
            if((@cliente_id) = 0 or (@produto_id = 0)) then
				set new.cliente_id = null;
                set new.produto_id = null;
			end if;
		end //
delimiter ;

-- insert into tbl_compra values (current_timestamp(), 1, 1);

/*
EXEMPLO 3
*/
delimiter //
	create trigger trg_03
		after insert on tbl_cliente
        for each row
        begin
			if(new.cliente_email is not null) then
				insert into tbl_newletter set news_email = new.cliente_email;
			end if;
		end //
delimiter ;

insert into tbl_cliente values (default, 'Wagner Birosca', 'wagner@gmail.com', current_timestamp());
select * from tbl_newletter;

/*
Apaga triggers
*/
-- drop trigger trg_1;
-- drop trigger trg_2;
-- drop trigger trg_03;

/*
Apaga tabelas
*/
-- drop table tbl_cliente;
-- drop table tbl_produto;
-- drop table tbl_compra;
-- drop table tbl_newletter;