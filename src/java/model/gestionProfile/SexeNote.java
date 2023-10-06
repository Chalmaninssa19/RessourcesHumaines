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
import java.util.ArrayList;
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
    //inserer sexeNote
    public void createSexeNote(int id_wanted_profile, int id_sexe, Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            String requete = "insert into sexe_note values (" + id_wanted_profile + ", " + id_sexe + ", " + this.getNote() + ")";
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

    public List<SexeNote> findBestSexe(List<Integer> lsindice, Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            List<SexeNote> bestSexe = new ArrayList<>();
            Statement s = con.createStatement();
            for (int i = 0; i < lsindice.size(); i++) {
                ResultSet rs = s.executeQuery("SELECT id_wanted_profile, id_Sexe, note, Sexe, status FROM v_Sexe_note where status = 1 and id_wanted_profile = " + lsindice.get(i) + " order by note desc\n"
                        + "limit 1; ");
                while (rs.next()) {
                    Sexe a = new Sexe(rs.getString(4), rs.getInt(5));
                    SexeNote dn = new SexeNote(a, rs.getDouble(3));
                    bestSexe.add(dn);
                }
            }
            return bestSexe;
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null && !b) {
                con.close();
            }
        }
    }

}
