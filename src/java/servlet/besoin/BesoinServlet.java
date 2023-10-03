/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.besoin;

import framework.database.utilitaire.GConnection;
import java.io.IOException;
import java.io.PrintWriter;
<<<<<<< Updated upstream
=======
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
>>>>>>> Stashed changes
import java.sql.Connection;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import model.gestionBesoin.Besoin;
import model.gestionBesoin.Task;
import model.gestionBesoin.Unity;
import model.requis.Service;
import utilitaire.Util;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Person;

@WebServlet(name="BesoinServlet", urlPatterns = {"/besoin-insertion"})
public class BesoinServlet extends HttpServlet {

     protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
          res.setContentType("text/plain");
          PrintWriter out = res.getWriter();
          
          try {
                Connection connex = GConnection.getSimpleConnection();
                Service service = Service.getById(connex, 1);
                req.setAttribute("service", service);
                connex.close();
          } catch (Exception exe) {
               req.setAttribute("erreur", exe.getMessage());
          }
          RequestDispatcher dispat = req.getRequestDispatcher("pages/besoin/besoin_insertion.jsp");
          dispat.forward(req, res);
     }

     protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
          res.setContentType("text/plain");
          PrintWriter out = res.getWriter();
          try {
              Connection connex = GConnection.getSimpleConnection();
              Service service = Service.getById(connex, 1);
                      
              //Date dateNow = new Date("2023-10-01");
              List<Task> tasks = new ArrayList<>();
                
              Besoin besoin = new Besoin(service, null, req.getParameter("description"), 1);
              ArrayList<Unity> unitys = Unity.getAll(connex);
              HttpSession session = req.getSession();
              session.setAttribute("besoin", besoin); 
              req.setAttribute("unitys", unitys);
              
              connex.close();
          } catch (Exception exe) {
               req.setAttribute("erreur", exe.getMessage());
          }
          RequestDispatcher dispat = req.getRequestDispatcher("pages/besoin/besoin_insertion2.jsp");
          dispat.forward(req, res);
    }
}
