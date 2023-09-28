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
public class SalaireNote extends Model {
    @Champs(mapcol="id",name="idSalaire")
    private Diplome salaire;
    @Champs
    private Double note;
    
///Getters and setters
    public Diplome getSalaire() {
        return salaire;
    }
    public void setSalaire(Diplome salaire) {
        this.salaire = salaire;
    }

    public Double getNote() {
        return note;
    }
    public void setNote(Double note) {
        this.note = note;
    }
    
///Constructors
    public SalaireNote() {
    }

    public SalaireNote(Diplome salaire, Double note) {
        this.salaire = salaire;
        this.note = note;
    }
    
///Fonctions
    
}
