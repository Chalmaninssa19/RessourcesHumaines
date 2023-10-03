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
public class Salaire extends Model {
    @Champs
    private String salaire;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getSalaire() {
        return salaire;
    }
    public void setSalaire(String salaire) {
        this.salaire = salaire;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }

///Constructors
    public Salaire() {
    }
    
    public Salaire(String salaire, Integer status) {
        this.salaire = salaire;
        this.status = status;
    }
///Fonctions
    public List<Salaire> getAllSalaire(Connection con) throws Exception {
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
            }
            String request = " select * from salaire where status = 1 ";
            List<Salaire> listeSalaire = new ArrayList<>();
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(request);
            while (rs.next()) {
                Salaire sa = new Salaire(rs.getString(2), rs.getInt(3));
                listeSalaire.add(sa);
            }
            return listeSalaire;
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
}
