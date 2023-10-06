/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet.besoin;

import framework.database.utilitaire.GConnection;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.gestionBesoin.Besoin;
import model.gestionBesoin.Task;
import model.gestionBesoin.Unity;
import model.requis.Service;

/**
 *
 * @author To Mamiarilaza
 */
@WebServlet(name = "BesoinServlet", urlPatterns = {"/besoin-insertion"})
public class BesoinServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        // Add attribute to request
          try {
              Connection connex = GConnection.getSimpleConnection();
              HttpSession session = request.getSession();
              Besoin besoin = new Besoin();
              session.setAttribute("besoin", besoin);
              Service service = Service.getById(connex, 1);
                             
              ArrayList<Unity> unitys = Unity.getAll(connex);
              request.setAttribute("service", service);
              request.setAttribute("unitys", unitys);
              
              connex.close();
          } catch (Exception exe) {
               request.setAttribute("erreur", exe.getMessage());
          }
        // dispatch to target servlet
        RequestDispatcher dispatch = request.getRequestDispatcher("./pages/besoin/besoin_insertion.jsp");
        dispatch.forward(request, response);
        
    }  

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
