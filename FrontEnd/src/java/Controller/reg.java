/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jose_
 */
@WebServlet(name = "reg", urlPatterns = {"/reg"})
public class reg extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
      Connection cnx=null;
      ResultSet rs=null;
      Statement sta=null;
      int usuariobd = 0;
      if(request.getParameter("txtValue")!=null){
      String usr= request.getParameter("txtUsr");       
      String nom= request.getParameter("txtNam");
      String apellido=request.getParameter("txtApellidos");
      String correo=request.getParameter("txtCorreo");
      String pass=request.getParameter("txtPass");
      String pass2=request.getParameter("txtPass2");
      String Activado="A";
      try{
      cnx=DriverManager.getConnection("jdbc:postgresql://localhost:5432/login","postgres","@rechart23");   
      sta=cnx.createStatement();
      rs=sta.executeQuery("select COUNT(usuario) as ct from usrcon where usuario='"+usr+"'");
      while (rs.next()){
           usuariobd = rs.getInt("ct");
      }
      }catch(Exception e){
          
      }
      if (!pass.equals(pass2)){
          int rep = 1;
          response.sendRedirect("/MovieTes_ProyectoFinal/Registro.jsp?rpta="+rep);
      }
      else if(usuariobd!=0){
          int rep = 2;
       response.sendRedirect("/MovieTes_ProyectoFinal/Registro.jsp?rpta="+rep);  
      }
      else if (pass.length()>=10){
          int rep = 3;
       response.sendRedirect("/MovieTes_ProyectoFinal/Registro.jsp?rpta="+rep);   
      }
      else{
      //Conexion

      try{
      cnx=DriverManager.getConnection("jdbc:postgresql://localhost:5432/login","postgres","@rechart23");   
      sta=cnx.createStatement();
      sta.executeUpdate("insert into usrcon values('"+usr+"',MD5('"+pass+"'),'"+Activado+"','"+nom+"','"+apellido+"','"+correo+"','"+"')");
      request.getRequestDispatcher("index.jsp").forward(request, response);
      
      }catch(Exception e){
          out.println(e);
           }
      }
          }
        }
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
