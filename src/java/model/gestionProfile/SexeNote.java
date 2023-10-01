/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.gestionProfile;

import framework.database.annotation.Champs;
import model.Model;
import framework.database.utilitaire.GConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

/**
 *
 * @author Chalman
 */
public class SexeNote extends Model {

    @Champs(mapcol = "id", name = "idSexe")
    private Sexe sexe;
    @Champs
    private Double note;

///Getters and setters
    public Sexe getSexe() {
        return sexe;
    }

    public void setSexe(Sexe sexe) {
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

    public SexeNote(Sexe sexe, Double note) {
        this.sexe = sexe;
        this.note = note;
    }

///Fonctions
    public List<SexeNote> findBestSexe(List<Integer> lsindice, Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            List<SexeNote> bestSexe = null;
            Statement s = con.createStatement();
            for (int i = 0; i < lsindice.size(); i++) {
                ResultSet rs = s.executeQuery("SELECT idwantedprofile, idSexe, note, Sexe, status FROM v_Sexenote where status = 1 and idwantedprofile = " + lsindice.get(i) + " order by note desc\n"
                        + "limit 1; ");
                while (rs.next()) {
                    Sexe a = new Sexe(rs.getString(2), rs.getInt(3));
                    SexeNote dn = new SexeNote(a, rs.getDouble(4));
                    bestSexe.add(dn);
                }
            }
            return bestSexe;
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
