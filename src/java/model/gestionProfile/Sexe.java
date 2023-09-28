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
public class Sexe extends Model {
    @Champs
    private String sexe;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getSexe() {
        return sexe;
    }
    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }

///Constructors
    public Sexe() {
    }
    
    public Sexe(String sexe, Integer status) {
        this.sexe = sexe;
        this.status = status;
    }
    
///Fonctions

}
