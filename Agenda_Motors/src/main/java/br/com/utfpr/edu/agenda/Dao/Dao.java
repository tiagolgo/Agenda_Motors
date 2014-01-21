/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.utfpr.edu.agenda.Dao;

import java.util.List;

/**
 *
 * @author Tiago
 * @param <T>
 */
public interface Dao <T> {
    public T persiste(T o) throws Exception;
    public T getPorId(Long id) throws Exception;
    public boolean delete(T o) ;
    public boolean deletePorId(Long id);
    public List<T> listar() ; 
}
