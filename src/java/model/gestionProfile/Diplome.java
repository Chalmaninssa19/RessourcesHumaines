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
public class Diplome extends Model {

    @Champs
    private String diplome;
    @Champs
    private Integer status;

///Getters and setters
    public String getDiplome() {
        return diplome;
    }

    public void setDiplome(String diplome) {
        this.diplome = diplome;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

///Constructors
    public Diplome() {
    }

    public Diplome(String diplome, Integer status) {
        this.diplome = diplome;
        this.status = status;
    }

///Fonctions
    public List<Diplome> getAllDiplome(Connection con) throws Exception {
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
            }
            String request = " select * from diplome where status = 1 ";
            List<Diplome> listeDiplome = new ArrayList<>();
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(request);
            while (rs.next()) {
                Diplome d = new Diplome(rs.getString(2), rs.getInt(3));
                listeDiplome.add(d);
            }
            return listeDiplome;
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null) {
                con.close();
            }
        }
    }
}
