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
import java.util.List;
import model.Model;

/**
 *
 * @author Chalman
 */
public class AdresseNote extends Model {

    @Champs(mapcol = "id", name = "idAdresse")
    private Adresse adresse;
    @Champs
    private Double note;

///Getters and setters
    public Adresse getAdresse() {
        return adresse;
    }

    public void setAdresse(Adresse adresse) {
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

    public AdresseNote(Adresse adresse, Double note) {
        this.adresse = adresse;
        this.note = note;
    }

///Fonctions
    public List<AdresseNote> findBestAdresse(List<Integer> lsindice, Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            List<AdresseNote> bestAdresse = null;
            Statement s = con.createStatement();
            for (int i = 0; i < lsindice.size(); i++) {
                ResultSet rs = s.executeQuery("SELECT idwantedprofile, idadresse, note, adresse, status FROM v_adressenote where status = 1 and idwantedprofile = " + lsindice.get(i) + " order by note desc\n"
                        + "limit 1; ");
                while (rs.next()) {
                    Adresse a = new Adresse(rs.getString(2), rs.getInt(3));
                    AdresseNote dn = new AdresseNote(a, rs.getDouble(4));
                    bestAdresse.add(dn);
                }
            }
            return bestAdresse;
        } catch (Exception exe) {
            con.rollback();
            throw exe;
        } finally {
            if (con != null && !b) {
                con.close();
            }
        }
    }
}
