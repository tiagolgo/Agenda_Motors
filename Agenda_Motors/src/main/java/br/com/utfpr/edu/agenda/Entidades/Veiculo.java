/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Entidades;

import br.com.caelum.vraptor.ioc.Component;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author Tiago
 */
@Entity
@Component
public class Veiculo implements Serializable {

    @Id
    @GeneratedValue
    private Long id;
    private String marca, modelo, placa, ano, alerta;
    private String dataCadastro;
    private String km, kmdia;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "carro")
    private List<Item> itens = new ArrayList();
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "dono")
    private Usuario usuario;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        if (marca == null) {
            this.marca = marca;
        } else {
            this.marca = marca.toUpperCase();
        }
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        if (modelo == null) {
            this.modelo = modelo;
        } else {
            this.modelo = modelo.toUpperCase();
        }
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getAno() {
        return ano;
    }

    public void setAno(String ano) {
        this.ano = ano;
    }

    public String getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(String dataCadastro) {
        if (dataCadastro == null) {
            Calendar cal = Calendar.getInstance();
            this.dataCadastro = cal.get(Calendar.DAY_OF_MONTH) + "/" + (cal.get(Calendar.MONTH) + 1) + "/" + cal.get(Calendar.YEAR);
        } else {
            this.dataCadastro = dataCadastro;
        }
    }

    public String getKm() {
        return km;
    }

    public void setKm(String km) {
        if (km == null) {
            this.km = km;
        } else {
            this.km = km.replace(".", "");
        }
    }

    public String getKmdia() {
        return kmdia;
    }

    public void setKmdia(String kmdia) {
        this.kmdia = kmdia;
    }

    public List<Item> getItens() {
        return itens;
    }

    public void setItens(List<Item> itens) {
        this.itens = itens;
    }

    public void setItem(Item item) {
        this.itens.add(item);
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getAlerta() {
        return alerta;
    }

    public void setAlerta(String alerta) {
        this.alerta = alerta;
    }

}
