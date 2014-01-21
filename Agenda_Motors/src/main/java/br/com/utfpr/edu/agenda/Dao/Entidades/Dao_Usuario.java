/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Dao.Entidades;

import br.com.caelum.vraptor.ioc.Component;
import br.com.utfpr.edu.agenda.Dao.Dao_Basic;
import br.com.utfpr.edu.agenda.Entidades.ClassMail;
import br.com.utfpr.edu.agenda.Entidades.Usuario;
import br.com.utfpr.edu.agenda.Entidades.Veiculo;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.hibernate.transform.Transformers;

/**
 *
 * @author Tiago
 */
@Component
public class Dao_Usuario extends Dao_Basic<Usuario> {

    public Dao_Usuario(Session session) {
        super(session);
        classe = Usuario.class;
    }

    public boolean verificaEmail(String email) {
        List ver = sessao.createQuery("SELECT email FROM Usuario WHERE email=:e").setParameter("e", email).list();
        return !ver.isEmpty();
    }

    public Usuario getUsuario(String email) {
        return (Usuario) sessao.createCriteria(classe).add(Restrictions.eq("email", email)).uniqueResult();
    }

    public Usuario login(String email, String senha) {
        Usuario user = (Usuario) sessao.createQuery("FROM Usuario WHERE email=:e and senha=:s").setParameter("e", email).setParameter("s", senha).uniqueResult();
        return user;
    }

    public List<Veiculo> veiculosUser(Long idUser) {
        try {
            List<Veiculo> list = sessao.createQuery("FROM Veiculo where dono=:i").setParameter("i", idUser).list();
            sessao.beginTransaction().commit();
            return list;
        } catch (HibernateException e) {
            return null;
        }
    }

    public List<ClassMail> usuariosEmail() {
        try {
            List<ClassMail> qr = sessao.createSQLQuery("SELECT DISTINCT u.nome,u.email FROM usuario u WHERE id in (SELECT v.dono FROM item i,veiculo v WHERE v.id=i.carro AND ((v.km=i.proxmanut AND i.undmedida='Km')OR(v.ano=i.proxmanut AND i.undmedida='Ano')))").setResultTransformer(Transformers.aliasToBean(ClassMail.class)).list();
            return qr;
        } catch (HibernateException e) {
            return null;
        }
    }

    public boolean removeUsuario(Long id) {
        try {
            sessao.createSQLQuery("DELETE FROM Item WHERE carro=(SELECT id FROM Veiculo WHERE dono=:d)").setParameter("d", id).executeUpdate();
            sessao.createSQLQuery("DELETE FROM Veiculo WHERE dono=:i").setParameter("i", id).executeUpdate();
            sessao.createSQLQuery("DELETE FROM Usuario WHERE id=:z").setParameter("z", id).executeUpdate();
            sessao.beginTransaction().commit();
            return true;
        } catch (Exception e) {
            sessao.beginTransaction().rollback();
            System.err.println("Erro ao tentar excluir usuario");
            e.printStackTrace();
            return false;
        }
    }
}
