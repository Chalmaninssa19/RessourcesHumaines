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
public class SexeNote extends Model {
    @Champs(mapcol="id",name="idSexe")
    private Diplome sexe;
    @Champs
    private Double note;
    
///Getters and setters
    public Diplome getSexe() {
        return sexe;
    }
    public void setSexe(Diplome sexe) {
        this.sexe = sexe;
    }

    public Double getNote() {
        return note;
    }
    public void setNote(Double note) {
        this.note = note;
    }
    
///Constructors
    public SexeNote() {
    }

    public SexeNote(Diplome sexe, Double note) {
        this.sexe = sexe;
        this.note = note;
    }
    
///Fonctions
    
}
