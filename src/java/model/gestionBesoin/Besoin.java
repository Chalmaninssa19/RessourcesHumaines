/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.gestionBesoin;

import framework.database.annotation.Champs;
import framework.database.utilitaire.GConnection;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Model;
import model.requis.Service;

/**
 *
 * @author Chalman
 */
public class Besoin extends Model {
    @Champs(mapcol="id", name="idService")
    private Service service;
    @Champs
    private Timestamp creationDate;
    @Champs
    private String description;
    private List<Task> tasks;
    private List<WorkLoad> workLoad;
    @Champs
    private Integer status;
    
///Getters and setters
    public Service getService() {
        return service;
    }
    public void setService(Service service) {
        this.service = service;
    }

    public Timestamp getCreationDate() {
        return creationDate;
    }
    public void setCreationDate(Timestamp creationDate) {
        this.creationDate = creationDate;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public List<Task> getTasks() {
        return tasks;
    }
    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public List<WorkLoad> getWorkLoad() {
        return workLoad;
    }
    public void setWorkLoad(List<WorkLoad> workLoad) {
        this.workLoad = workLoad;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }
   
    

///Constructors
    public Besoin (){
    }

    public Besoin(Service service, Timestamp creationDate, String description, List<Task> tasks, List<WorkLoad> workLoad, Integer status) {
        this.service = service;
        this.creationDate = creationDate;
        this.description = description;
        this.tasks = tasks;
        this.workLoad = workLoad;
        this.status = status;
    }

///Fonctions
    //Creer un besoin dans la base
    public void create(Connection con) throws Exception {
        boolean b = true ;
        try{
            if (con==null){
                con = GConnection.getSimpleConnection();
                b = false ;
            }
            con.setAutoCommit(false);
            int zoneId = this.sequence("idBesoinSeq",con);
            this.setId(zoneId);
            super.create(con);
            con.commit();
        }catch (Exception exe) {
            //System.out.println(exe.getMessage());
            con.rollback();
            throw exe;
        }finally {
            if (con!=null && !b){
                con.close();
            }
        }
    }
    
    //Recuperer toutes les besoins
    public ArrayList<Besoin> getAll(Connection conn)  throws Exception { 
        return this.findAll(conn);
    }
    
    //Recuperer un besoin par son id
    public Besoin findById(Connection conn, Integer idBesoin) throws Exception {
        return this.findOneWhere(conn, "id ="+idBesoin);
    }
}
