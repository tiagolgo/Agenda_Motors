/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Controller;

import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.caelum.vraptor.view.Results;
import br.com.utfpr.edu.agenda.Dao.Entidades.Dao_Veiculo;
import br.com.utfpr.edu.agenda.Entidades.Item;
import br.com.utfpr.edu.br.agenda.Sessao.Sessao;
import br.com.utfpr.edu.agenda.Entidades.Veiculo;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Tiago
 */
@Resource
public class VeiculoController {

    private final Result result;
    private final Validator validador;
    private final Dao_Veiculo dv;
    private final Sessao sessao;

    public VeiculoController(Result result, Validator validador, Dao_Veiculo dv, Sessao sessao) {
        this.result = result;
        this.dv = dv;
        this.validador = validador;
        this.sessao = sessao;
    }

    @Get("/veiculo/novo")
    public void formulario() {
    }

    @Get("/veiculo/edita/{id}")
    public void edita(Long id) {
        try {
            Veiculo veiculo = this.dv.getPorId(id);

            String km = veiculo.getKm();
            String ano = veiculo.getAno();
            for (Item item : veiculo.getItens()) {
                if (item.getUndmedida().equals("Km")) {
                    if (item.getProxmanut().equals(km)) {
                        item.setAlerta("danger");
                    }
                } else {
                    if (item.getProxmanut().equals(ano)) {
                        item.setAlerta("danger");
                    }
                }
            }
            this.result.include(veiculo);
        } catch (Exception ex) {
            Logger.getLogger(VeiculoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.result.of(this).formulario();
    }

    @Post("/veiculo")
    public void adiciona(Veiculo veiculo) {

        if (veiculo.getMarca() == null || veiculo.getMarca().equals(" ")) {
            this.validador.add(new ValidationMessage("Informe a marca!", "veiculo"));
        }
        if (veiculo.getModelo() == null || veiculo.getModelo().equals(" ")) {
            this.validador.add(new ValidationMessage("Informe o modelo!", "veiculo"));
        }
        if (veiculo.getPlaca() == null || veiculo.getPlaca().equals(" ")) {
            this.validador.add(new ValidationMessage("Informe a Placa!", "veiculo"));
        }
        if (veiculo.getAno() == null || veiculo.getAno().equals(" ")) {
            this.validador.add(new ValidationMessage("Informe o Ano do Veículo!", "veiculo"));
        }
        if (veiculo.getKm() == null || veiculo.getKm().equals(" ")) {
            this.validador.add(new ValidationMessage("Informe a Kilometragem Atual do Veículo!", "veiculo"));
        }
       
        this.validador.onErrorRedirectTo(this).formulario();

        try {
            //inserir dono no veículo
            veiculo.setUsuario(sessao.getUsuario());
            //persistir veículo
            dv.persist(veiculo);
        } catch (Exception ex) {
            Logger.getLogger(VeiculoController.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.result.redirectTo(UsuarioController.class).index();
    }

    @Delete("/veiculo/remove/{veiculo.id}")
    public void remove(Veiculo veiculo) {
        try {
            this.dv.remover(veiculo);
            this.result.nothing();
        } catch (Exception ex) {
            Logger.getLogger(VeiculoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Get("/veiculo/marca.json")
    public void marcaJSon(String trecho) {
        List<Veiculo> marcas = dv.marcaJSon(trecho);
        this.result.use(Results.json()).
                from(marcas)
                .exclude("id", "modelo", "placa", "ano", "dataCadastro", "km", "kmdia")
                .serialize();
    }

    @Get("/veiculo/modelo.json")
    public void modeloJSon(String trecho) {
        this.result.use(Results.json()).
                from(dv.modeloJSon(trecho))
                .exclude("id", "marca", "placa", "ano", "dataCadastro", "km", "kmdia")
                .serialize();
    }
}
