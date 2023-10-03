package servlet.profil;

import com.google.gson.Gson;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.gestionProfile.Adresse;
import model.gestionProfile.AdresseNote;
import model.gestionProfile.Diplome;
import model.gestionProfile.DiplomeNote;
import model.gestionProfile.Experience;
import model.gestionProfile.ExperienceNote;
import model.gestionProfile.Salaire;
import model.gestionProfile.SalaireNote;
import model.gestionProfile.Sexe;
import model.gestionProfile.SexeNote;
import model.gestionProfile.WantedProfile;

/**
 *
 * @author Fy Botas
 */
public class AjaxProfileServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        WantedProfile wp = new WantedProfile();
        HttpSession session = request.getSession();
        if (request.getParameter("diplome") != null || request.getParameter("diplomenote") != null) {
            List<DiplomeNote> listeDiplomeNote = new ArrayList<>();

            String diplome = request.getParameter("diplome");
            double note = Double.valueOf(request.getParameter("diplomenote"));

            Diplome d = new Diplome(diplome, 1);
            DiplomeNote dn = new DiplomeNote(d, note);

            listeDiplomeNote.add(dn);
            wp.setDiplomeNote(listeDiplomeNote);
            session.setAttribute("wantedprofile", wp);

            String dip = diplome + " : " + String.valueOf(note);

            List<String> diplomeString = new ArrayList<>();
            diplomeString.add(dip);

            response.setContentType("application/json");
            Gson gson = new Gson();
            String jsonData = gson.toJson(diplomeString);
            response.getWriter().write(jsonData);
        } else if (request.getParameter("adresse") != null || request.getParameter("adressenote") != null) {
            List<AdresseNote> listeAdresseNote = new ArrayList<>();

            String adresse = request.getParameter("adresse");
            double note = Double.valueOf(request.getParameter("adressenote"));

            Adresse a = new Adresse(adresse, 1);
            AdresseNote an = new AdresseNote(a, note);

            listeAdresseNote.add(an);
            WantedProfile wap = (WantedProfile) session.getAttribute("wantedprofile");
            wap.setAdresseNote(listeAdresseNote);

            String dip = adresse + " : " + String.valueOf(note);

            List<String> adresseString = new ArrayList<>();
            adresseString.add(dip);

            response.setContentType("application/json");
            Gson gson = new Gson();
            String jsonData = gson.toJson(adresseString);
            response.getWriter().write(jsonData);
        } else if (request.getParameter("experience") != null || request.getParameter("experiencenote") != null) {
            List<ExperienceNote> listeExperienceNote = new ArrayList<>();

            String experience = request.getParameter("experience");
            double note = Double.valueOf(request.getParameter("experiencenote"));

            Experience e = new Experience(experience, 1);
            ExperienceNote en = new ExperienceNote(e, note);

            listeExperienceNote.add(en);
            WantedProfile wap = (WantedProfile) session.getAttribute("wantedprofile");
            wap.setExperienceNote(listeExperienceNote);

            String dip = experience + " : " + String.valueOf(note);

            List<String> experienceString = new ArrayList<>();
            experienceString.add(dip);

            response.setContentType("application/json");
            Gson gson = new Gson();
            String jsonData = gson.toJson(experienceString);
            response.getWriter().write(jsonData);
        } else if (request.getParameter("salaire") != null || request.getParameter("salairenote") != null) {
            List<SalaireNote> listeSalaireNote = new ArrayList<>();

            String salaire = request.getParameter("salaire");
            double note = Double.valueOf(request.getParameter("salairenote"));

            Salaire s = new Salaire(salaire, 1);
            SalaireNote sn = new SalaireNote(s, note);

            listeSalaireNote.add(sn);
            WantedProfile wap = (WantedProfile) session.getAttribute("wantedprofile");
            wap.setSalaireNote(listeSalaireNote);

            String dip = salaire + " : " + String.valueOf(note);

            List<String> salaireString = new ArrayList<>();
            salaireString.add(dip);

            response.setContentType("application/json");
            Gson gson = new Gson();
            String jsonData = gson.toJson(salaireString);
            response.getWriter().write(jsonData);
        } else if (request.getParameter("sexe") != null || request.getParameter("sexenote") != null) {
            List<SexeNote> listeSexeNote = new ArrayList<>();

            String sexe = request.getParameter("sexe");
            double note = Double.valueOf(request.getParameter("sexenote"));

            Sexe s = new Sexe(sexe, 1);
            SexeNote sn = new SexeNote(s, note);

            listeSexeNote.add(sn);
            WantedProfile wap = (WantedProfile) session.getAttribute("wantedprofile");
            wap.setSexeNote(listeSexeNote);

            String dip = sexe + " : " + String.valueOf(note);

            List<String> sexeString = new ArrayList<>();
            sexeString.add(dip);

            response.setContentType("application/json");
            Gson gson = new Gson();
            String jsonData = gson.toJson(sexeString);
            response.getWriter().write(jsonData);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
