/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author jose_
 */
public class usuarioModel {
    String usuario,cont,est,nom,ape;

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }
    String[] fav;

    public usuarioModel() {
    }

    public usuarioModel(String usuario, String cont, String est, String[] fav) {
        this.usuario = usuario;
        this.cont = cont;
        this.est = est;
        this.fav = fav;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getCont() {
        return cont;
    }

    public void setCont(String cont) {
        this.cont = cont;
    }

    public String getEst() {
        return est;
    }

    public void setEst(String est) {
        this.est = est;
    }

    public String[] getFav() {
        return fav;
    }

    public void setFav(String[] fav) {
        this.fav = fav;
    }
    
    
}
