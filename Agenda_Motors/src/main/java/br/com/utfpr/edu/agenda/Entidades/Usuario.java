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
public class Usuario implements Serializable {

    @Id
    @GeneratedValue
    private Long id;
//    @NotNull(message = "Nome não pode ser vazio.")
//    @Length(min = 3, message = "Nome deve conter pelo menos 3 caracteres.")
    private String nome;
//    @NotNull(message = "Email não pode ser vazio")
    private String email;
//    @NotNull(message = "Senha não pode ser vazia.")
//    @Length(min = 6, message = "Senha deve conter no mínimo 6 caracteres")
    private String senha;

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    
}
