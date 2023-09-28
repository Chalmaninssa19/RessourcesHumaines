/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.requis;

import framework.database.annotation.Champs;
import model.*;
import java.sql.*;
import java.util.ArrayList;


/**
 *
 * @author Chalman
 */
public class Service extends Model {
    @Champs
    private String service;
    @Champs  
    private String  fonction;
    @Champs
    private Timestamp creation_date;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getService() {
        return service;
    }
    public void setService(String service) {
        this.service = service;
    }

    public String getFonction() {
        return fonction;
    }
    public void setFonction(String fonction) {
        this.fonction = fonction;
    }

    public Timestamp getCreation_date() {
        return creation_date;
    }
    public void setCreation_date(Timestamp creation_date) {
        this.creation_date = creation_date;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }

///Constructors
    public Service() {
    }

    public Service(String service, String fonction, Timestamp creation_date, Integer status) {
        this.service = service;
        this.fonction = fonction;
        this.creation_date = creation_date;
        this.status = status;
    }

///Fonctions de la classe
    //Avoir tous les services
    public ArrayList<Service> getAll(Connection conn)  throws Exception { 
        return this.findAll(conn);
    }
    
    //Recuperer une service par son id
    public Service getById(Connection conn, Integer idService) throws Exception {
        return this.findOneWhere(conn, "id ="+idService);
    }
}
