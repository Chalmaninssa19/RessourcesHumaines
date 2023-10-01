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
public class ExperienceNote extends Model {
    @Champs(mapcol="id",name="idExperience")
    private Experience experience;
    @Champs
    private Double note;
    
///Getters and setters
    public Experience getExperience() {
        return experience;
    }
    public void setExperience(Experience experience) {
        this.experience = experience;
    }

    public Double getNote() {
        return note;
    }
    public void setNote(Double note) {
        this.note = note;
    }
///Constructors
    public ExperienceNote() {
    }

    public ExperienceNote(Experience experience, Double note) {
        this.experience = experience;
        this.note = note;
    }

///Fonctions
    public List<ExperienceNote> findBestExperience(List<Integer> lsindice, Connection con) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            List<ExperienceNote> bestExperience = null;
            Statement s = con.createStatement();
            for (int i = 0; i < lsindice.size(); i++) {
                ResultSet rs = s.executeQuery("SELECT idwantedprofile, idExperience, note, Experience, status FROM v_Experiencenote where status = 1 and idwantedprofile = " + lsindice.get(i) + " order by note desc\n"
                        + "limit 1; ");
                while (rs.next()) {
                    Experience a = new Experience(rs.getString(2), rs.getInt(3));
                    ExperienceNote dn = new ExperienceNote(a, rs.getDouble(4));
                    bestExperience.add(dn);
                }
            }
            return bestExperience;
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
