/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Conexao;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.ComponentFactory;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Tiago
 */
@Component
public class Fabrica_Sessao implements ComponentFactory<Session> {

    private final SessionFactory factory;
    private Session session;

    public Fabrica_Sessao(SessionFactory factory) {
        this.factory = factory;
    }

    @PostConstruct
    public void abre() {
        this.session = factory.openSession();
    }

    @Override
    public Session getInstance() {
        return this.session;
    }

    @PreDestroy
    public void fecha() {
        this.session.close();
    }
}
