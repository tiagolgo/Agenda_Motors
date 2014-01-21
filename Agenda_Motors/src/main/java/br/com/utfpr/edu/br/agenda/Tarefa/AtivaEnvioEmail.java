/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.br.agenda.Tarefa;

import br.com.caelum.vraptor.ioc.ApplicationScoped;
import br.com.caelum.vraptor.tasks.Task;
import br.com.caelum.vraptor.tasks.scheduler.Scheduled;
import br.com.utfpr.edu.br.agenda.ServicoMail.EnviaEmailJavaMail;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Tiago
 */
@ApplicationScoped
@Scheduled(cron = "0 40 20 * * ?")
public class AtivaEnvioEmail implements Task {

    EnviaEmailJavaMail servico;
    private final SessionFactory factory;

    public AtivaEnvioEmail(EnviaEmailJavaMail sendMail, SessionFactory factory) {
        this.servico = sendMail;
        this.factory = factory;
    }

    @Override
    public void execute() {
        Session sessao = this.factory.openSession();
        List<Object> qr = null;
        try {
            qr = sessao.createSQLQuery("SELECT DISTINCT u.email FROM usuario u WHERE id in (SELECT v.dono FROM item i JOIN veiculo v WHERE v.id=i.carro AND ((v.km=i.proxmanut AND i.undmedida='Km')OR(v.ano=i.proxmanut AND i.undmedida='Ano')))").list();
            sessao.beginTransaction().commit();
        } catch (HibernateException e) {
            System.out.println("Erro ao buscar usuários:");
            System.out.println(e.getCause());
        } finally {
            System.out.println("Fechando sessão de envio de email!");
            sessao.close();
        }
        if (qr != null) {
            this.servico.enviar("Agenda Motors - Aviso de Manutenção", "Constatamos que você possui veículos com itens a serem mantidos. Verifique sua Agenda no Agenda Motors.", qr);
        }
    }
}
