/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.candidature;

/**
 *
 * @author To Mamiarilaza
 */
public class Formation {
/// field
    int year;
    String diplome;
    String school;
    
/// getter and setter

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getDiplome() {
        return diplome;
    }

    public void setDiplome(String diplome) {
        this.diplome = diplome;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }
    
/// constructor

    public Formation(int year, String diplome, String school) {
        this.year = year;
        this.diplome = diplome;
        this.school = school;
    }
    
    
}
