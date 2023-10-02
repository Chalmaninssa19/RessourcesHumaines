package servlet.profil;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.gestionProfile.Diplome;
import model.gestionProfile.DiplomeNote;
import model.gestionProfile.WantedProfile;

/**
 *
 * @author Fy Botas
 */
public class WantedProfileServlet extends HttpServlet {

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
        List<DiplomeNote> listeDiplomeNote = new ArrayList<>();
        HttpSession session = request.getSession();

        String diplome = request.getParameter("diplome");
        double note = Double.valueOf(request.getParameter("diplomenote"));

        Diplome d = new Diplome(diplome, 1);
        DiplomeNote dn = new DiplomeNote(d, note);

        listeDiplomeNote.add(dn);
        wp.setDiplomeNote(listeDiplomeNote);
        session.setAttribute("wantedprofile", wp);

        response.setContentType("application/json");
        Gson gson = new Gson();
        String jsonData = gson.toJson(listeDiplomeNote);
        response.getWriter().write(jsonData);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
