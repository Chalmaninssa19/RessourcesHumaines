/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilitaire;

import java.sql.Timestamp;

/**
 *
 * @author Chalman
 */
public class Util {
     public static Timestamp conversIntimestamp( String date, String time ) {   //Convertir un string en timestamp
        time = time + ":00";
        String datetime = date + " " + time;
        return Timestamp.valueOf(datetime);
    } 
}
