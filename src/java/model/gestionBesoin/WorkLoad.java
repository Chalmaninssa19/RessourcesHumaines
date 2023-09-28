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
public class WorkLoad extends Model {
    @Champs
    private Integer wantedProfile;
    @Champs
    private Double quantity;
    @Champs(mapcol="id", name="idUnity")
    private Unity unity;
    
///Getters and setters
    public Integer getWantedProfile() {
        return wantedProfile;
    }
    public void setWantedProfile(Integer wantedProfile) {
        this.wantedProfile = wantedProfile;
    }

    public Double getQuantity() {
        return quantity;
    }
    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public Unity getUnity() {
        return unity;
    }
    public void setUnity(Unity unity) {
        this.unity = unity;
    }
   
    

///Constructors
    public WorkLoad() {   
    }

    public WorkLoad(Integer wantedProfile, Double quantity, Unity unity) {
        this.wantedProfile = wantedProfile;
        this.quantity = quantity;
        this.unity = unity;
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
            int zoneId = this.sequence("idWorkLoadSeq",con);
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
    
    //Recuperer toutes les workLoad
    public ArrayList<WorkLoad> getAll(Connection conn)  throws Exception { 
        return this.findAll(conn);
    }
    
    //Recuperer un workload par son id
    public WorkLoad findById(Connection conn, Integer idWorkLoad) throws Exception {
        return this.findOneWhere(conn, "id ="+idWorkLoad);
    }
}
