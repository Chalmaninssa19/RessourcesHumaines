/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.gestionProfile;

import framework.database.annotation.Champs;
import model.Model;

/**
 *
 * @author Chalman
 */
public class Salaire extends Model {
    @Champs
    private String salaire;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getSalaire() {
        return salaire;
    }
    public void setSalaire(String salaire) {
        this.salaire = salaire;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }

///Constructors
    public Salaire() {
    }
    
    public Salaire(String salaire, Integer status) {
        this.salaire = salaire;
        this.status = status;
    }
///Fonctions

}
