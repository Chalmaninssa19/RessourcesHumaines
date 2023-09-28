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
public class Diplome extends Model {
    @Champs
    private String diplome;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getDiplome() {
        return diplome;
    }
    public void setDiplome(String diplome) {
        this.diplome = diplome;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }

///Constructors
    public Diplome() {
    }
    public Diplome(String diplome, Integer status) {
        this.diplome = diplome;
        this.status = status;
    }   

///Fonctions

}
