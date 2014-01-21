/*criando o evento*/
create event atualiza
on schedule every 24 hour
do update agenda.veiculo set km=km+kmdia; 
/*habilitar os eventos*/
set global event_scheduler =on;
/*verificando eventos habilitados*/
select @@event_scheduler;
/*remover evento*/
drop event if exists atualiza;