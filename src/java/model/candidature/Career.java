/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.candidature;

import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author To Mamiarilaza
 */
public class Career {
/// field
    LocalDate  startDate;
    LocalDate endDate;
    String society;
    String poste;
    List<String> tasks;       // Les différentes taches sont séparés par des ";" dans la base et on va devoir les décomposer apres
    
/// getter and setter

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
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
    
/// contructor

    public Career(LocalDate startDate, LocalDate endDate, String society, String poste, List<String> tasks) {
        this.startDate = startDate;
        this.endDate = endDate;
        this.society = society;
        this.poste = poste;
        this.tasks = tasks;
    }
    
/// methods

}
