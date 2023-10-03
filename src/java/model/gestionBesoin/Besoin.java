/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.gestionBesoin;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Model;
import model.requis.Service;

/**
 *
 * @author Chalman
 */
public class Besoin extends Model {
    private Integer idBesoin;
    private Service service;
    private Date creationDate;
    private String description;
    private List<Task> tasks;
    private List<WorkLoad> workLoad;
    private Integer status;
    
///Getters and setters
    public Integer getIdBesoin() {
        return idBesoin;
    }
    public void setIdBesoin(Integer idBesoin) {
        this.idBesoin = idBesoin;
    }
    
    public Service getService() {
        return service;
    }
    public void setService(Service service) {
        this.service = service;
    }

    public Date getCreationDate() {
        return creationDate;
    }
    public void setCreationDate(Date creationDate) {
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

    public Besoin(Integer idBesoin, Service service, Date creationDate, String description, Integer status) {
        this.idBesoin = idBesoin;
        this.service = service;
        this.creationDate = creationDate;
        this.description = description;
        this.status = status;
    }
    
    public Besoin(Service service, Date creationDate, String description, Integer status) {
        this.service = service;
        this.creationDate = creationDate;
        this.description = description;
        this.status = status;
    }

///Fonctions de la classe
    //Creer un besoin
    public void create(Connection conn)  throws Exception { 
        Statement work = conn.createStatement();
        String req = "INSERT INTO besoin (id_besoin, id_service, creation_date, description, status) VALUES (DEFAULT,"+this.getService().getIdService()+","+this.getCreationDate()+","+this.getDescription()+","+this.getStatus()+")";
        work.execute(req);
        conn.setAutoCommit(true);
    }
    
    //Avoir tous les besoins
    public static ArrayList<Besoin> getAll(Connection conn)  throws Exception { 
        Statement work = conn.createStatement();
        String req = "select * from besoin";
        ResultSet result = work.executeQuery(req);
        ArrayList<Besoin> besoins = new ArrayList<>();
        int i = 1;
        while(result.next()) {
            Besoin besoin = new Besoin(result.getInt(1), Service.getById(conn,result.getInt(2)), result.getDate(3), result.getString(4), result.getInt(5));
            besoins.add(besoin);
        }
        
        return besoins;
    }
    
    //Recuperer une service par son id
    public static Besoin getById(Connection conn, Integer idBesoin) throws Exception {
        Statement work = conn.createStatement();
        String req = "select * from besoin where id_besoin = "+idBesoin;
        ResultSet result = work.executeQuery(req);
        Besoin besoin = new Besoin();
        int i = 1;
        while(result.next()) {
            besoin.setIdBesoin(result.getInt(1));
            besoin.setService(Service.getById(conn, result.getInt(2)));
            besoin.setCreationDate(result.getDate(3));
            besoin.setDescription(result.getString(4));
            besoin.setStatus(result.getInt(5));
        }
        
        return besoin;
    }
    
    //Modifier un besoin
    public void update(Connection conn)  throws Exception { 
        Statement work = conn.createStatement();
        String req = "UPDATE besoin SET id_service="+this.getService().getIdService()+", creation_date="+this.getCreationDate()+", description='"+this.getDescription()+"', status="+this.getStatus()+" WHERE id_besoin="+this.getIdBesoin();
        work.execute(req);
        conn.setAutoCommit(true);
    }
    
    //Supprimer un besoin
    public void delete(Connection conn)  throws Exception { 
        Statement work = conn.createStatement();
        String req = "DELETE from besoin WHERE id_besoin="+this.getIdBesoin();
        work.execute(req);
        conn.setAutoCommit(true);
    }
}
