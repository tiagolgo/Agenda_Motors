/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.br.agenda.Sessao;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;
import br.com.utfpr.edu.agenda.Entidades.Usuario;
import java.io.Serializable;

/**
 *
 * @author Tiago
 */
@Component
@SessionScoped
public class Sessao implements Serializable {

    private Usuario usuario;

    public Sessao() {
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public boolean isLogado() {
        return this.usuario != null;
    }
}
