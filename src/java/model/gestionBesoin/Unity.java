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
public class Unity extends Model {
    @Champs
    private String unity;
    @Champs
    private Integer status;
    
///Getters and setters
    public String getUnity() {
        return unity;
    }
    public void setUnity(String unity) {
        this.unity = unity;
    }

    public Integer getStatus() {
        return status;
    }
    public void setStatus(Integer status) {
        this.status = status;
    }

///Constructors
    public Unity() {
    }
    public Unity(String unity, Integer status) {
        this.unity = unity;
        this.status = status;
    }

///Fonctions
    //Creer un unity dans la base
    public void create(Connection con) throws Exception {
        boolean b = true ;
        try{
            if (con==null){
                con = GConnection.getSimpleConnection();
                b = false ;
            }
            con.setAutoCommit(false);
            int zoneId = this.sequence("idUnitySeq",con);
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
    
    //Recuperer toutes les unitys
    public ArrayList<Unity> getAll(Connection conn)  throws Exception { 
        return this.findAll(conn);
    }
    
    //Recuperer un unity par son id
    public Unity findById(Connection conn, Integer idUnity) throws Exception {
        return this.findOneWhere(conn, "id ="+idUnity);
    }
}
