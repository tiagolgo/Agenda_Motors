/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Controller;

import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.utfpr.edu.agenda.Dao.Entidades.Dao_Usuario;
import br.com.utfpr.edu.br.agenda.Sessao.Sessao;
import br.com.utfpr.edu.agenda.Entidades.Usuario;

/**
 *
 * @author Tiago
 */
@Resource
public class LoginController {

    private final Result result;
    private final Dao_Usuario du;
    private final Validator validador;
    private final Sessao sessao;

    public LoginController(Validator validador, Result result, Dao_Usuario du, Sessao sessao) {
        this.result = result;
        this.du = du;
        this.validador = validador;
        this.sessao = sessao;
    }

    
    public void login(String email, String senha) {
        Usuario usuario = null;
        if (email == null) {
            this.validador.add(new ValidationMessage("Informe o Email.", "login"));
        }
        if (senha == null) {
            this.validador.add(new ValidationMessage("Informe a Senha.", "login"));
        }
        if (!this.validador.hasErrors()) {
            usuario = this.du.login(email, senha);
            if (usuario == null) {
                this.validador.add(new ValidationMessage("Usuário não encontrado.", "login"));
            } 
        }
        
        this.validador.onErrorRedirectTo(IndexController.class).index();
        this.sessao.setUsuario(usuario);
        result.redirectTo(UsuarioController.class).index();
    }

    @Post("/logout")
    public void logout() {
        this.sessao.setUsuario(null);
        this.result.redirectTo(IndexController.class).index();
    }
}
