/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Entidades;

import br.com.caelum.vraptor.ioc.Component;
import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author Tiago
 */
@Entity
@Component
public class Item implements Serializable {

    @Id
    @GeneratedValue
    private Long id;
    private String nome, acao, undmedida, periodo, ultmanut, proxmanut, alerta;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getAcao() {
        return acao;
    }

    public void setAcao(String acao) {
        this.acao = acao;
    }

    public String getUndmedida() {
        return undmedida;
    }

    public void setUndmedida(String undmedida) {
        this.undmedida = undmedida;
    }

    public String getPeriodo() {
        return periodo;
    }

    public void setPeriodo(String periodo) {
        this.periodo = periodo;
    }

    public String getUltmanut() {
        return ultmanut;
    }

    public void setUltmanut(String ultmanut) {
        this.ultmanut = ultmanut;
    }

    public String getProxmanut() {
        return proxmanut;
    }

    public void setProxmanut(String proxmanut) {
        this.proxmanut = proxmanut;
    }

    public String getAlerta() {
        return alerta;
    }

    public void setAlerta(String alerta) {
        this.alerta = alerta;
    }

    @Override
    public String toString() {
        return "Item{" + "id=" + id + ", nome=" + nome + ", acao=" + acao + ", undmedida=" + undmedida + ", periodo=" + periodo + ", ultmanut=" + ultmanut + ", proxmanut=" + proxmanut + ", alerta=" + alerta + '}';
    }
    
}
