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
public class AdresseNote extends Model {
    @Champs(mapcol="id",name="idAdresse")
    private Diplome adresse;
    @Champs
    private Double note;
    
///Getters and setters
    public Diplome getAdresse() {
        return adresse;
    }
    public void setAdresse(Diplome adresse) {
        this.adresse = adresse;
    }

    public Double getNote() {
        return note;
    }
    public void setNote(Double note) {
        this.note = note;
    }
    
///Constructors
    public AdresseNote() {
    }

    public AdresseNote(Diplome adresse, Double note) {
        this.adresse = adresse;
        this.note = note;
    }
    
///Fonctions
    
}
