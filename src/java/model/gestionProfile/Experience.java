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
public class Experience extends Model {
    @Champs
    private String experience;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getExperience() {
        return experience;
    }
    public void setExperience(String experience) {
        this.experience = experience;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
   

///Constructors
    public Experience() {   
    }

    public Experience(String experience, Integer status) {
        this.experience = experience;
        this.status = status;
    }

///Fonctions
  
}
