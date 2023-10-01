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
public class DiplomeNote extends Model {

    @Champs(mapcol = "id", name = "idDiplome")
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
    //Avoir toutes les notes des diplomes qui sont actifs 
    public List<DiplomeNote> selectDiplomeNote(Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            con.setAutoCommit(false);
            List<DiplomeNote> listeDiplomeNote = super.findWhere(con, "status = 1");
            con.commit();
            return listeDiplomeNote;
        } catch (Exception exe) {
            con.rollback();
            throw exe;
        } finally {
            if (con != null && !b) {
                con.close();
            }
        }
    }

    //avoir le maximum des notes pour chaque profil recherché
    public List<Double> getMaxNote(Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            List<Double> ld = null;
            String request = "select idwantedprofile, iddiplome, max(note) from v_diplomenote group by idwantedprofile";
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(request);
            while (rs.next()) {
                ld.add(rs.getDouble(1));
            }
            return ld;
        } catch (Exception exe) {
            con.rollback();
            throw exe;
        } finally {
            if (con != null && !b) {
                con.close();
            }
        }
    }

    //avoir le meilleur diplome c'est à dire qui a un note élevé
    public List<DiplomeNote> findBestDiplome(List<Integer> lsindice, Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            List<DiplomeNote> bestDiplome = null;
            Statement s = con.createStatement();
            for (int i = 0; i < lsindice.size(); i++) {
                ResultSet rs = s.executeQuery("SELECT idwantedprofile, iddiplome, note, diplome, status FROM v_diplomenote where status = 1 and idwantedprofile = " + lsindice.get(i) + " order by note desc\n"
                        + "limit 1; ");
                while (rs.next()) {
                    Diplome d = new Diplome(rs.getString(2), rs.getInt(3));
                    DiplomeNote dn = new DiplomeNote(d, rs.getDouble(4));
                    bestDiplome.add(dn);
                }
            }
            return bestDiplome;
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
