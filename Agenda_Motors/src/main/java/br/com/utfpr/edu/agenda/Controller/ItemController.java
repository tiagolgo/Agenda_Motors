/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Controller;

import br.com.caelum.vraptor.Delete;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.com.utfpr.edu.agenda.Dao.Entidades.Dao_Item;
import br.com.utfpr.edu.br.agenda.Sessao.Sessao;

/**
 *
 * @author Tiago
 */
@Resource
public class ItemController {

    private final Dao_Item di;
    private final Result result;

    public ItemController(Dao_Item di, Result result) {
        this.di = di;
        this.result = result;
    }

    @Delete("/item/{id}")
    public void remove(Long id, Long veiculo) {
        this.di.deleta(id, veiculo);
        this.result.nothing();
    }

    @Get("/item.json")
    public void itemJSon(String trecho) {
        this.result.use(Results.json()).
                from(di.buscaJSon(trecho))
                .exclude("id", "acao", "periodo", "undmedida", "ultmanut")
                .serialize();
    }
}
