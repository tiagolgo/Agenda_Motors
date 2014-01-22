/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.br.agenda.Filtro;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.resource.ResourceMethod;
import br.com.utfpr.edu.agenda.Controller.IndexController;
import br.com.utfpr.edu.agenda.Controller.LoginController;
import br.com.utfpr.edu.br.agenda.Sessao.Sessao;
import java.lang.reflect.Method;

/**
 *
 * @author Tiago
 */
@Intercepts
public class Filtro implements Interceptor {

    private final Result results;
    private final Sessao sessao;

    public Filtro(Result results, Sessao sessao) {
        this.results = results;
        this.sessao = sessao;
    }

    @Override
    public void intercept(InterceptorStack is, ResourceMethod rm, Object o) throws InterceptionException {
        if (this.sessao.isLogado()) {
            is.next(rm, o);
        } else {
            this.results.redirectTo(IndexController.class).index();
        }
    }

    @Override
    public boolean accepts(ResourceMethod rm) {
        Class<?> type = rm.getResource().getType();
        String method = rm.getMethod().getName();
        System.out.println("metodo");
        if (type.equals(IndexController.class) || type.equals(LoginController.class)) {
            return false;
        }
        return true;
    }

}
