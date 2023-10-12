/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.candidature;

import jakarta.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

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

    public String getFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    public String upload(String sourcePath, String destinationDirectory) throws IOException {
        Path source = Paths.get(sourcePath);
        String fileName = source.getFileName().toString();
        Path destination = Paths.get(destinationDirectory, fileName);

        Files.copy(source, destination, StandardCopyOption.REPLACE_EXISTING);

        return fileName;
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
