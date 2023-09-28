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
public class DiplomeNote extends Model {
    @Champs(mapcol="id",name="idDiplome")
    private Diplome diplome;
    @Champs
    private Double note;
    
///Getters and setters
    public Diplome getDiplome() {
        return diplome;
    }
    public void setDiplome(Diplome diplome) {
        this.diplome = diplome;
    }

    public Double getNote() {
        return note;
    }
    public void setNote(Double note) {
        this.note = note;
    }
///Constructors
    public DiplomeNote() {
    }

    public DiplomeNote(Diplome diplome, Double note) {
        this.diplome = diplome;
        this.note = note;
    }
    
///Fonctions
    
}
