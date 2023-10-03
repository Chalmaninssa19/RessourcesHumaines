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
public class SalaireNote extends Model {

    @Champs(mapcol = "id", name = "idSalaire")
    private Salaire salaire;
    @Champs
    private Double note;

///Getters and setters
    public Salaire getSalaire() {
        return salaire;
    }

    public void setSalaire(Salaire salaire) {
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

    public SalaireNote(Salaire salaire, Double note) {
        this.salaire = salaire;
        this.note = note;
    }

///Fonctions
    public List<SalaireNote> findBestSalaire(List<Integer> lsindice, Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            List<SalaireNote> bestSalaire = null;
            Statement s = con.createStatement();
            for (int i = 0; i < lsindice.size(); i++) {
                ResultSet rs = s.executeQuery("SELECT idwantedprofile, idSalaire, note, Salaire, status FROM v_Salairenote where status = 1 and idwantedprofile = " + lsindice.get(i) + " order by note desc\n"
                        + "limit 1; ");
                while (rs.next()) {
                    Salaire a = new Salaire(rs.getString(2), rs.getInt(3));
                    SalaireNote dn = new SalaireNote(a, rs.getDouble(4));
                    bestSalaire.add(dn);
                }
            }
            return bestSalaire;
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
