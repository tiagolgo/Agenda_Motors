/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Tiago
 * @param <T>
 */
public class Dao_Basic<T> implements Dao<T> {

    protected static Class classe;
    protected static Session sessao;

    public Dao_Basic(Session sessa) {
        sessao = sessa;
    }

    @Override
    public T persiste(T o) throws Exception {
        return null;
    }

    public void persist(T o) throws Exception {
        sessao.saveOrUpdate(o);
        sessao.beginTransaction().commit();
    }

    @Override
    public T getPorId(Long id) throws Exception {
        return (T) sessao.createCriteria(classe).add(Restrictions.eq("id", id)).uniqueResult();
    }

    @Override
    public boolean delete(T o) {
        System.out.println("No Dao Basic");
        try {
            sessao.delete(o);
            sessao.beginTransaction().commit();
            return true;
        } catch (HibernateException e) {
            return false;
        }
    }

    @Override
    public boolean deletePorId(Long id) {
        try {
            sessao.createSQLQuery("DELETE*FROM ? WHERE id=?").setString(1, classe.toString()).setLong(1, id).executeUpdate();
            sessao.beginTransaction().commit();
            return true;
        } catch (HibernateException e) {
            System.out.println("erro ao deletar ");
            return false;
        }
    }

    @Override
    public List<T> listar() {
        try {
            return sessao.createCriteria(classe).list();
        } catch (HibernateException e) {
            return null;
        }
    }
}
