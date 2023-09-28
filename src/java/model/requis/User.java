/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.requis;

import framework.database.annotation.Champs;
import model.*;
import java.sql.*;
import framework.database.utilitaire.GConnection;
import java.util.ArrayList;


/**
 *
 * @author Chalman
 */
public class User extends Model {
    @Champs
    private String name;
    @Champs( mapcol="id", name="id_service")
    private Service service;
    @Champs
    private String username;
    @Champs
    private String password;
    @Champs
    private String mail;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getName() {    
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {   
        this.status = status;
    }

///Constructors
    public User() {
    }

    public User(String name, Service service, String username, String password, String mail, Integer status) {
        this.name = name;
        this.service = service;
        this.username = username;
        this.password = password;
        this.mail = mail;
        this.status = status;
    } 
    
///Fonctions de la classe
    //Creer un user
    public void create(Connection con) throws Exception {
        boolean valid = true ;
        try{
            if (con == null){
                con = GConnection.getSimpleConnection();
                valid = false ;
            }
            int id = this.sequence("idUserSeq",con);
            this.setId(id);
            this.create(con);
        }catch(Exception exe){
            con.rollback();
            throw exe ;
        }finally {
            if(!valid){
                con.close();
            }
        }
    }
    
    //Avoir tous les users
    public ArrayList<User> getAll(Connection conn)  throws Exception { 
        return this.findAll(conn);
    }
    
    //Recuperer un user par son id
    public User getById(Connection conn, Integer idUser) throws Exception {
        return this.findOneWhere(conn, "id ="+idUser);
    }
}