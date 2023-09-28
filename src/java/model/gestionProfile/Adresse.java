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
public class Adresse extends Model {
    @Champs
    private String adresse;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getAdresse() {
        return adresse;
    }
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }

///Constructors
    public Adresse() {
    }

    public Adresse(String adresse, Integer status) {
        this.adresse = adresse;
        this.status = status;
    }
    
///Fonctions

}
