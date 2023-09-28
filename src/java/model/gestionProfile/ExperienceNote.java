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
public class ExperienceNote extends Model {
    @Champs(mapcol="id",name="idExperience")
    private Experience experience;
    @Champs
    private Double note;
    
///Getters and setters
    public Experience getExperience() {
        return experience;
    }
    public void setExperience(Experience experience) {
        this.experience = experience;
    }

    public Double getNote() {
        return note;
    }
    public void setNote(Double note) {
        this.note = note;
    }
///Constructors
    public ExperienceNote() {
    }

    public ExperienceNote(Experience experience, Double note) {
        this.experience = experience;
        this.note = note;
    }

///Fonctions
    
}
