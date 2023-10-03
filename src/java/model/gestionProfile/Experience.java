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

/**
 *
 * @author Chalman
 */
public class Experience extends Model {
    @Champs
    private String experience;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getExperience() {
        return experience;
    }
    public void setExperience(String experience) {
        this.experience = experience;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
   

///Constructors
    public Experience() {   
    }

    public Experience(String experience, Integer status) {
        this.experience = experience;
        this.status = status;
    }

///Fonctions
      public List<Experience> getAllExperience(Connection con) throws Exception {
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
            }
            String request = " select * from experience where status = 1 ";
            List<Experience> listeExperience = new ArrayList<>();
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(request);
            while (rs.next()) {
                Experience e = new Experience(rs.getString(2), rs.getInt(3));
                listeExperience.add(e);
            }
            return listeExperience;
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
}
