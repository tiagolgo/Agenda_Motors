/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.caelum.vraptor.view.Results;
import br.com.utfpr.edu.agenda.Dao.Entidades.Dao_Usuario;
import br.com.utfpr.edu.agenda.Entidades.Item;
import br.com.utfpr.edu.br.agenda.Sessao.Sessao;
import br.com.utfpr.edu.agenda.Entidades.Usuario;
import br.com.utfpr.edu.agenda.Entidades.Veiculo;
import br.com.utfpr.edu.br.agenda.ServicoMail.EnviaEmailJavaMail;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tiago
 */
@Resource
public class UsuarioController {

    private final Result result;
    private final Dao_Usuario du;
    private final Validator validador;
    private final Sessao sessao;
    private final EnviaEmailJavaMail sendMail;

    public UsuarioController(Result result, Dao_Usuario du, Validator valida, Sessao sessao, EnviaEmailJavaMail send) {
        this.result = result;
        this.du = du;
        this.validador = valida;
        this.sessao = sessao;
        this.sendMail = send;
    }

    @Get
    public void index() {
        if (!(sessao.getUsuario() == null)) {
            List<Veiculo> veiculos = this.du.veiculosUser(sessao.getUsuario().getId());
            for (Veiculo veiculo : veiculos) {
                String km = veiculo.getKm();
                String ano = veiculo.getAno();
                for (Item item : veiculo.getItens()) {
                    if (item.getProxmanut().equals(km) || item.getProxmanut().equals(ano)) {
                        veiculo.setAlerta("danger");
                        break;
                    }
                }
            }
            this.result.include("veiculos", veiculos);
        }
    }

    @Get("/usuario/dados")
    public void dados() {
    }

    @Post("/usuario/dados")
    public void dados(String nome) {
        StringBuilder msn=new StringBuilder();
        if (nome == null || nome.equals(" ")) {
            msn.append("Informe o novo nome!\n");
        } else {
            try {
                this.sessao.getUsuario().setNome(nome);
                this.du.persist(sessao.getUsuario());
                msn.append("Dados alterados com sucesso!");
            } catch (Exception ex) {
                msn.append("Erro ao alterar nome!\n");
                Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        this.result.use(Results.json()).from(msn,"retorno").serialize();
    }

    @Get("/usuario/email")
    public void email() {

    }

    @Post("/usuario/email")
    public void email(String novoemail, String confmail) {
        StringBuilder msn = new StringBuilder();
        boolean erro=false;
        if (novoemail == null || novoemail.equals(" ")) {
            msn.append("Informe o Email.\n");
            erro=true;
        }
        if (confmail == null || confmail.equals(" ")) {
            msn.append("Confirme o Email.\n");
            erro=true;
        }
        if (!erro) {
            if (!novoemail.equals(confmail)) {
                msn.append("Os Emails não conferem.");
            } else {
                try {
                    this.sessao.getUsuario().setEmail(novoemail);
                    this.du.persist(sessao.getUsuario());
                    msn.append("Email alterado com sucesso!");
                } catch (Exception ex) {
                    Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        this.result.use(Results.json()).from(msn,"retorno").serialize();
    }

    @Get("/usuario/senha")
    public void senha() {
    }

    @Post("/usuario/senha")
    public void senha(String novasenha, String confsenha) {
        StringBuilder msn = new StringBuilder();
        boolean erro = false;
        if (novasenha == null || novasenha.equals(" ")) {
            msn.append("Informe a nova senha!\n");
            erro = true;
        }
        if (confsenha == null || confsenha.equals(" ")) {
            msn.append("Confirme a nova senha!\n");
            erro = true;
        }
        if (!erro) {
            if (!novasenha.equals(confsenha)) {
                msn.append("As senhas não conferem!\n");
            } else {
                try {
                    this.sessao.getUsuario().setSenha(novasenha);
                    this.du.persist(sessao.getUsuario());
                    msn.append("Senha alterada com sucesso!");
                } catch (Exception ex) {
                    Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        this.result.use(Results.json()).from(msn,"retorno").serialize();
    }

    @Post("/usuario")
    public void adiciona(Usuario usuario, String confEmail, String confSenha) {
        if (usuario.getNome() == null || usuario.getNome().length() < 3) {
            this.validador.add(new ValidationMessage("Nome não pode ser vazio e deve ter no mínimo 3 caracteres", "msg"));
        }
        if (usuario.getEmail() == null) {
            this.validador.add(new ValidationMessage("Informe o Email.", "msg"));
        } else if (confEmail == null) {
            this.validador.add(new ValidationMessage("Repita o Email", "msg"));
        } else {
            if (du.verificaEmail(confEmail)) {
                this.validador.add(new ValidationMessage("Email já cadastrado.", "msg"));
            }
        }
        if (usuario.getSenha() == null) {
            this.validador.add(new ValidationMessage("Informe a Senha.", "msg"));
        } else if (!(usuario.getSenha().equals(confSenha))) {
            this.validador.add(new ValidationMessage("Senhas não conferem", "msg"));
        }
        this.validador.onErrorRedirectTo(IndexController.class).index();
        try {
            du.persist(usuario);
            //adicionar o usuário na sessao
            Usuario user = this.du.getUsuario(usuario.getEmail());
            this.sessao.setUsuario(user);
            //enviar confirmação de cadastro
//            confirmaCadastro(usuario);
            //redirecionar à pagina inicial
            result.redirectTo(this).index();
        } catch (Exception ex) {
            result.include("mensagem", "Erro ao tentar cadastrar!");
            result.redirectTo(IndexController.class).index();
            Logger.getLogger(UsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Path("/usuario/remove/{id}")
    public void remove(Long id) {
        if (this.du.removeUsuario(id)) {
            this.result.redirectTo(IndexController.class).index();
        } else {
            this.result.redirectTo(this).index();
        }
    }

//    private void confirmaCadastro(Usuario usuario) {
//        //enviar email de confirmação de cadastro
//        String msn = usuario.getNome() + ". Seu cadastro no Agenda Motors foi realizado com sucesso.";
//        List<Object> email = new ArrayList();
//        email.add(usuario.getEmail());
//        this.sendMail.enviar("Agenda Motors - Confirmação de Cadastro", msn, email);
//    }
}
