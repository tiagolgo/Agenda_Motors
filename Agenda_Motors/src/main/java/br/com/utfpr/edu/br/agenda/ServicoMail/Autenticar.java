/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package br.com.utfpr.edu.br.agenda.ServicoMail;

import javax.mail.PasswordAuthentication;

/**
 *
 * @author Tiago
 */
//classe de autenticação
   public class Autenticar extends javax.mail.Authenticator {

        public String username = null;
        public String password = null;

        public Autenticar(String user, String pwd) {
            username = user;
            password = pwd;
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
    }
