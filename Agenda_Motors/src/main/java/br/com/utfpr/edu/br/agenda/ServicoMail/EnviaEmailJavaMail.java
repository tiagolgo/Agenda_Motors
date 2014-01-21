/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.br.agenda.ServicoMail;

import br.com.caelum.vraptor.ioc.ApplicationScoped;
import br.com.caelum.vraptor.ioc.Component;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import javax.mail.*;
//import javax.mail.MessagingException;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
import javax.mail.internet.*;

/**
 *
 * @author Tiago
 */
@Component
@ApplicationScoped
public class EnviaEmailJavaMail {

    public void enviar(String titulo, String mensagem, List<Object> destinatarios) {
        // Get system properties
        Properties props = System.getProperties();

        props.put("mail.transport.protocol", "smtp"); //define protocolo de envio como SMTP  
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com"); //server SMTP do GMAIL  
        props.put("mail.smtp.auth", "true"); //ativa autenticacao  
        props.put("mail.smtp.user", "cemariacandida@gmail.com"); //usuario ou seja, a conta que esta enviando o email (tem que ser do GMAIL)  
        props.put("mail.debug", "true");
        props.put("mail.smtp.port", "465"); //porta  
        props.put("mail.smtp.socketFactory.port", "465"); //mesma porta para o socket  
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");

        Autenticar auth = new Autenticar("cemariacandida@gmail.com", "colegioestadual");
        Session session = Session.getDefaultInstance(props, auth);
        MimeMessage message = new MimeMessage(session);

        Transport tr;
        try {
            tr = session.getTransport("smtp");
            tr.connect("smtp.gmail.com", "cemariacandida@gmail.com", "colegioestadual");

            message.setFrom(new InternetAddress("cemariacandida@gmail.com"));//remetente
            message.setSentDate(new Date());//data de envio
            message.setSubject(titulo);//titulo da mensagem
            message.setText(mensagem);

            InternetAddress[] toUser = new InternetAddress[destinatarios.size()];
            for (int i = 0; i < destinatarios.size(); i++) {
                toUser[i] = new InternetAddress(destinatarios.get(i).toString());
            }

            message.addRecipients(Message.RecipientType.TO, toUser);
            message.saveChanges();
            tr.sendMessage(message, message.getAllRecipients());
            tr.close();
        } catch (MessagingException e) {
            System.out.println("Erro ao enviar: ");
            e.printStackTrace();
        }
    }
}
