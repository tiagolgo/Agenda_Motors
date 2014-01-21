/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.br.agenda.ServicoMail;

import br.com.caelum.vraptor.ioc.ApplicationScoped;
import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.simplemail.Mailer;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;

/**
 *
 * @author Tiago
 */
@Component
@ApplicationScoped
public class EnviaEmailSimpleMail {

    Mailer mailer;

    public EnviaEmailSimpleMail(Mailer mailer) {
        this.mailer = mailer;
    }

    public void envio(String destino) {
        Email email = new SimpleEmail();

        try {
            email.setSubject("Teste de Envio com Simple Mail");
            email.addTo(destino);
            email.setMsg("Está na hora de realizar a manutenção do seu carro. Verifique os itens!");
            mailer.send(email);
        } catch (EmailException ex) {
            System.out.println("Erro ao enviar com Simple Mail.");
            Logger.getLogger(EnviaEmailSimpleMail.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
