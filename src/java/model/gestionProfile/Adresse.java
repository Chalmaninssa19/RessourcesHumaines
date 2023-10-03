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
public class Adresse extends Model {
    @Champs
    private String adresse;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getAdresse() {
        return adresse;
    }
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }

///Constructors
    public Adresse() {
    }

    public Adresse(String adresse, Integer status) {
        this.adresse = adresse;
        this.status = status;
    }
    
///Fonctions
    public List<Adresse> getAllAdresse(Connection con) throws Exception {
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
            }
            String request = " select * from adresse where status = 1 ";
            List<Adresse> listeAdresse = new ArrayList<>();
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(request);
            while (rs.next()) {
                Adresse a = new Adresse(rs.getString(2), rs.getInt(3));
                listeAdresse.add(a);
            }
            return listeAdresse;
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
}
