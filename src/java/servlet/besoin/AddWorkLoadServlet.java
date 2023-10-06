/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet.besoin;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "AddWorkLoadServlet", urlPatterns = {"/addWorkLoadServlet"})
public class AddWorkLoadServlet extends HttpServlet {

     protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
          res.setContentType("text/plain");
          PrintWriter out = res.getWriter();
          
          try {
            
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
                String volumeHorraire = req.getParameter("volumeHorraire");
                String unitySelect = req.getParameter("unitySelect");
                HttpSession session = req.getSession();
                
                System.out.println("Tonga : "+volumeHorraire);
                System.out.println("Tonga : "+unitySelect);
                /*HttpSession session = req.getSession();
                session.setAttribute("idProfileValided", idValue);*/
                //out.print(volumeHorraire+" "+unitySelect);
          } catch (Exception exe) {
               req.setAttribute("erreur", exe.getMessage());
          }
          //RequestDispatcher dispat = req.getRequestDispatcher("pages/besoin/besoin_insertion2.jsp");
          //dispat.forward(req, res);
    }
}