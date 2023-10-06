/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.gestionProfile;

import framework.database.annotation.Champs;
import framework.database.utilitaire.GConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
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
    private int idService;
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

    public int getService() {
        return idService;
    }

    public void setService(int service) {
        this.idService = service;
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

    public WantedProfile(String poste, int idService) {
        this.poste = poste;
        this.idService = idService;
    }

///Fonctions
    //find poste par l'id
    public List<String> getPostById(Connection con) throws Exception {
        boolean b = true;
        try {
            List<Integer> lsIndice = this.getIdWantedProfile(null);
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            List<String> listePoste = new ArrayList<>();
            Statement s = con.createStatement();
            for (int i = 0; i < lsIndice.size(); i++) {
                ResultSet rs = s.executeQuery("SELECT poste from wanted_profile where id_wanted_profile = " +lsIndice.get(i));
                while (rs.next()) {
                    listePoste.add(rs.getString(1));
                }
            }
            return listePoste;
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null && !b) {
                con.close();
            }
        }
    }

    //avoir l'id du dernier wantedprofile 
    public int getLastId(Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            int lastId = 0;
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery("SELECT max(id_wanted_profile) as max from wanted_profile where status = 1");
            while (rs.next()) {
                lastId = rs.getInt(1);
            }
            return lastId;
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null && !b) {
                con.close();
            }
        }
    }

    //avoir toutes les indices des profiles recherchés
    public List<Integer> getIdWantedProfile(Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            List<Integer> lsIndice = new ArrayList<>();
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery("SELECT id_Wanted_Profile from wanted_profile where status = 1");
            while (rs.next()) {
                lsIndice.add(rs.getInt(1));
            }
            return lsIndice;
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null && !b) {
                con.close();
            }
        }
    }

    //Creer un profil voulu dans la base
    public void createWantedProfile(Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            String requete = "insert into wanted_profile values (DEFAULT,' " + this.getPoste() + " '," + this.getService() + ", 1)";
            System.out.println(requete);
            Statement s = con.createStatement();
            s.executeUpdate(requete);
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null && !b) {
                con.close();
            }
        }
    }
}
