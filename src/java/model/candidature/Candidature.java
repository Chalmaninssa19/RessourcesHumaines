/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.candidature;

import framework.database.utilitaire.GConnection;
import java.sql.Connection;
import java.sql.Statement;

/**
 *
 * @author Fy Botas
 */
public class Candidature {

    int idCandidature;
    PersonnalInformation PersonnalInformation;
    ProfessionalCareer ProfessionalCareer;
    FormationPath FormationPath;
    String interestCenter;
    double SalaryExpectation;
    String selfProfile;
    String photo;
    String dossier;
    double note;
    int status;

    public Candidature(int idCandidature, PersonnalInformation PersonnalInformation, ProfessionalCareer ProfessionalCareer, FormationPath FormationPath, String interestCareer, double SalaryExpectation, String selfProfile, String photo, String dossier, double note, int status) {
        this.idCandidature = idCandidature;
        this.PersonnalInformation = PersonnalInformation;
        this.ProfessionalCareer = ProfessionalCareer;
        this.FormationPath = FormationPath;
        this.interestCenter = interestCareer;
        this.SalaryExpectation = SalaryExpectation;
        this.selfProfile = selfProfile;
        this.photo = photo;
        this.dossier = dossier;
        this.note = note;
        this.status = status;
    }

    public void create(Connection con, int idWantedProfile, String adresse, int sexe, String experience, String diplome) throws Exception {
        boolean b = true;
        try {
            if (con == null) {
                con = GConnection.getSimpleConnection();
                b = false;
            }
            String requete = "insert into candidature values (DEFAULT, "+ idWantedProfile +", CURRENT_DATE, '"+ this.getPersonnalInformation().getName() 
                    +"', '"+ this.getPersonnalInformation().getFirstName()+"', '"+ this.getPersonnalInformation().getBirthDate() +"', "
                    + this.getPersonnalInformation().getAdresse().getIdByName(adresse, null) +", '"+ this.getPersonnalInformation().getEmail() +"', "+
                    this.getPersonnalInformation().getSexe().getSexe() +", "+ this.getProfessionalCareer().getExperience().getIdByName(experience, null) +", "
                    + this.getFormationPath().getDiplome().getIdByName(diplome, null)+", '"+ this.getInterestCareer() +"', "+ this.getSalaryExpectation() +", '"+ this.getSelfProfile() +"', '"
                    + this.getPhoto()+"', '"+ this.getDossier() +"', "+ this.getNote() +", 1)";
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

    public Candidature() {
    }

    public int getIdCandidature() {
        return idCandidature;
    }

    public void setIdCandidature(int idCandidature) {
        this.idCandidature = idCandidature;
    }

    public PersonnalInformation getPersonnalInformation() {
        return PersonnalInformation;
    }

    public void setPersonnalInformation(PersonnalInformation PersonnalInformation) {
        this.PersonnalInformation = PersonnalInformation;
    }

    public ProfessionalCareer getProfessionalCareer() {
        return ProfessionalCareer;
    }

    public void setProfessionalCareer(ProfessionalCareer ProfessionalCareer) {
        this.ProfessionalCareer = ProfessionalCareer;
    }

    public FormationPath getFormationPath() {
        return FormationPath;
    }

    public void setFormationPath(FormationPath FormationPath) {
        this.FormationPath = FormationPath;
    }

    public String getInterestCareer() {
        return interestCenter;
    }

    public void setInterestCareer(String interestCareer) {
        this.interestCenter = interestCareer;
    }

    public double getSalaryExpectation() {
        return SalaryExpectation;
    }

    public void setSalaryExpectation(double SalaryExpectation) {
        this.SalaryExpectation = SalaryExpectation;
    }

    public String getSelfProfile() {
        return selfProfile;
    }

    public void setSelfProfile(String selfProfile) {
        this.selfProfile = selfProfile;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getDossier() {
        return dossier;
    }

    public void setDossier(String dossier) {
        this.dossier = dossier;
    }

    public double getNote() {
        return note;
    }

    public void setNote(double note) {
        this.note = note;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
