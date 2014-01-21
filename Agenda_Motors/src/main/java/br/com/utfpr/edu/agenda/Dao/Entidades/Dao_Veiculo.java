/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Dao.Entidades;

import br.com.caelum.vraptor.ioc.Component;
import br.com.utfpr.edu.agenda.Dao.Dao_Basic;
import br.com.utfpr.edu.agenda.Entidades.Item;
import br.com.utfpr.edu.agenda.Entidades.Veiculo;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Tiago
 */
@Component
public class Dao_Veiculo extends Dao_Basic<Veiculo> {

    public Dao_Veiculo(Session sessa) {
        super(sessa);
        classe = Veiculo.class;
    }

    public List<Veiculo> veiculosUser(Long idUser) {
        try {
            List<Veiculo> list = sessao.createQuery("FROM Veiculo where dono=:i").setParameter("i", idUser).list();
            return list;
        } catch (HibernateException e) {
            return null;
        }
    }

    public List<Veiculo> marcaJSon(String trecho) {
        try {
            return sessao.createCriteria(Veiculo.class).add(Restrictions.ilike("marca", trecho, MatchMode.ANYWHERE)).list();
        } catch (HibernateException e) {
            return null;
        }
    }

    public List<Veiculo> modeloJSon(String trecho) {
        try {
            return sessao.createCriteria(Veiculo.class).add(Restrictions.ilike("modelo", trecho, MatchMode.ANYWHERE)).list();
        } catch (HibernateException e) {
            return null;
        }
    }

    public void remover(Veiculo veiculo) {
        try {
            sessao.createSQLQuery("delete from Item where carro=:i").setParameter("i", veiculo.getId()).executeUpdate();
            sessao.createSQLQuery("delete from Veiculo where id=:z").setParameter("z", veiculo.getId()).executeUpdate();
            sessao.beginTransaction().commit();
        } catch (Exception e) {
            sessao.beginTransaction().rollback();
            System.err.println("Erro ao tentar excluir veiculo");
            e.printStackTrace();
        }
    }

}
