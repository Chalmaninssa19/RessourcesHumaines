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
public class Sexe extends Model {
    @Champs
    private String sexe;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getSexe() {
        return sexe;
    }
    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }

///Constructors
    public Sexe() {
    }
    
    public Sexe(String sexe, Integer status) {
        this.sexe = sexe;
        this.status = status;
    }
    
///Fonctions
    public List<Sexe> getAllSexe(Connection con) throws Exception {
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
            }
            String request = " select * from sexe where status = 1";
            List<Sexe> listeSexe = new ArrayList<>();
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(request);
            while (rs.next()) {
                Sexe se = new Sexe(rs.getString(2), rs.getInt(3));
                listeSexe.add(se);
            }
            return listeSexe;
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
}
