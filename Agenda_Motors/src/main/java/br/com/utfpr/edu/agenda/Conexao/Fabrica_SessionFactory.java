/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Conexao;

import br.com.caelum.vraptor.ioc.ApplicationScoped;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.ComponentFactory;
import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Tiago
 */
@Component
@ApplicationScoped
public class Fabrica_SessionFactory implements ComponentFactory<SessionFactory> {

    private SessionFactory factory;

    @PostConstruct
    public void abre() {
        System.out.println("ABRINDO CONEXÃO");
        Configuration configuracao = new Configuration().configure();
        StandardServiceRegistryBuilder srb=new StandardServiceRegistryBuilder().applySettings(configuracao.getProperties());
        this.factory = configuracao.buildSessionFactory(srb.build());        
    }

    @Override
    public SessionFactory getInstance() {
        return this.factory;
    }

    @PreDestroy
    public void fecha() {
        System.out.println("CONEXÃO FECHADA");
        this.factory.close();
    }
}
