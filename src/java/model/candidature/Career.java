/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.candidature;

import framework.database.utilitaire.GConnection;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author To Mamiarilaza
 */
public class Career {
/// field

    Date startDate;
    Date endDate;
    String society;
    String poste;
    List<String> tasks;       // Les différentes taches sont séparés par des ";" dans la base et on va devoir les décomposer apres

/// getter and setter
    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getSociety() {
        return society;
    }

    public void setSociety(String society) {
        this.society = society;
    }

    public String getPoste() {
        return poste;
    }

    public void setPoste(String poste) {
        this.poste = poste;
    }

    public List<String> getTasks() {
        return tasks;
    }

    public void setTasks(List<String> tasks) {
        this.tasks = tasks;
    }

    public String formatTask() {
        String task = "";
        for (int i = 0; i < this.getTasks().size(); i++) {
            task += this.getTasks().get(i).concat(";");
        }
        return task;
    }

    public String formatDate(Date date) {
        LocalDate localDate = date.toLocalDate();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d MMMM yyyy");

        String formattedDate = localDate.format(formatter);
        return formattedDate;
    }

    public void create(Connection con, int idCandidature) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            String requete = "insert into professional_career values (DEFAULT, " + idCandidature + ", '" + this.getStartDate() + "', '" + this.getEndDate() + "', '" + this.getSociety() + "', '" + this.getPoste() + "', '" + this.formatTask() + "')";
            System.out.println(requete);
            Statement s = con.createStatement();
            s.executeUpdate(requete);
        } catch (Exception exe) {
            throw exe;
        } finally {
            if (con != null && !b) {
                con.close();
            }
        }
    }

/// contructor
    public Career(Date startDate, Date endDate, String society, String poste, List<String> tasks) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.society = society;
        this.poste = poste;
        this.tasks = tasks;
    }

/// methods
    public Career() {
    }

}
