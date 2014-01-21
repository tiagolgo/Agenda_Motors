/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Dao.Entidades;

import br.com.caelum.vraptor.ioc.Component;
import br.com.utfpr.edu.agenda.Dao.Dao_Basic;
import br.com.utfpr.edu.agenda.Entidades.Item;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Tiago
 */
@Component
public class Dao_Item extends Dao_Basic<Item> {

    public Dao_Item(Session sessa) {
        super(sessa);
        classe = Item.class;
    }

    public List<Item> buscaJSon(String trecho) {
        try {
            return sessao.createCriteria(Item.class).add(Restrictions.ilike("nome", trecho, MatchMode.ANYWHERE)).list();
        } catch (HibernateException e) {
            return null;
        }
    }
    
    public boolean deleta(Long item, Long veiculo){
        try{
            sessao.createQuery("DELETE FROM Item where id=:i and carro=:c").setParameter("i", item).setParameter("c", veiculo).executeUpdate();
            sessao.beginTransaction().commit();
            return true;
        }catch(HibernateException e){
            System.out.println("errooooo "+e);
            return false;
        }
    }
}
