/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.gestionBesoin;

import framework.database.annotation.Champs;
import framework.database.utilitaire.GConnection;
import java.sql.Connection;
import java.util.ArrayList;
import model.Model;

/**
 *
 * @author Chalman
 */
public class Task extends Model {
    @Champs(mapcol="id", name="idBesoin")
    private Besoin besoin;
    @Champs
    private String task;
    @Champs
    private Integer status;
    
///Getters and setters
    public Besoin getBesoin() {    
        return besoin;
    }
    public void setBesoin(Besoin besoin) {
        this.besoin = besoin;
    }

    public String getTask() {
        return task;
    }
    public void setTask(String task) {
        this.task = task;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {   
        this.status = status;
    }

///Constructors
    public Task() {
    }
    
    public Task(String task, Integer status) {
        this.task = task;
        this.status = status;
    }
    public Task(Besoin besoin, String task, Integer status) {
        this.besoin = besoin;
        this.task = task;
        this.status = status;
    }
    
///Fonctions
    //Creer un bateau dans la base
    public void create (Connection con) throws Exception{
        boolean b = true ;
        try{
                if (con==null){
                    con = GConnection.getSimpleConnection();
                    b = false ;
                }
                con.setAutoCommit(false);
                int zoneId = this.sequence("idTaskSeq",con);
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
    
    //Recuperer toutes les taches
    public ArrayList<Task> getAll(Connection conn)  throws Exception { 
        return this.findAll(conn);
    }
    
    //Recuperer une tache par son id
    public Task findById(Connection conn, Integer idTache) throws Exception {
        return this.findOneWhere(conn, "id ="+idTache);
    }
}
