/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.gestionProfile;

import framework.database.annotation.Champs;
import framework.database.utilitaire.GConnection;
import java.sql.Connection;
import java.util.List;
import model.Model;
import model.requis.Service;

/**
 *
 * @author Chalman
 */
public class WantedProfile extends Model {
    @Champs
    private String poste;
    @Champs(mapcol="id", name="idService")
    private Service service;;
    private List<DiplomeNote> diplomeNote;
    private List<ExperienceNote> experienceNote;
    private List<SalaireNote> salaireNote;
    private List<SexeNote> sexeNote;
    private List<AdresseNote> adresseNote;
    
///Getters and setters
    public String getPoste() {
        return poste;
    }

    public void setPoste(String poste) {
        this.poste = poste;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public List<DiplomeNote> getDiplomeNote() {
        return diplomeNote;
    }

    public void setDiplomeNote(List<DiplomeNote> diplomeNote) {
        this.diplomeNote = diplomeNote;
    }

    public List<ExperienceNote> getExperienceNote() {
        return experienceNote;
    }

    public void setExperienceNote(List<ExperienceNote> experienceNote) {
        this.experienceNote = experienceNote;
    }

    public List<SalaireNote> getSalaireNote() {
        return salaireNote;
    }

    public void setSalaireNote(List<SalaireNote> salaireNote) {
        this.salaireNote = salaireNote;
    }

    public List<SexeNote> getSexeNote() {
        return sexeNote;
    }

    public void setSexeNote(List<SexeNote> sexeNote) {
        this.sexeNote = sexeNote;
    }

    public List<AdresseNote> getAdresseNote() {
        return adresseNote;
    }

    public void setAdresseNote(List<AdresseNote> adresseNote) {
        this.adresseNote = adresseNote;
    }
   
    

///Constructors
    public WantedProfile() {    
    }

    public WantedProfile(String poste, Service service) {
        this.poste = poste;
        this.service = service;
    }

///Fonctions
    //Creer un profil voulu dans la base
    public void create(Connection con) throws Exception {
        boolean b = true ;
        try{
            if (con==null){
                con = GConnection.getSimpleConnection();
                b = false ;
            }
            con.setAutoCommit(false);
            int zoneId = this.sequence("idWantedProfileSeq",con);
            this.setId(zoneId);
            super.create(con);
            con.commit();
        }catch (Exception exe) {
            //System.out.println(exe.getMessage());
            con.rollback();
            throw exe;
        }finally {
            if (con!=null && !b){
                con.close();
            }
        }
    }
}
