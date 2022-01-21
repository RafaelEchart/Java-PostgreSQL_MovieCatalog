/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.usuarioModel;
import DAO.LoginDAO;
/**
 *
 * @author jose_
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

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
            Object[] arreglo;
            /* TODO output your page here. You may use following sample code. */
            LoginDAO ldao = new LoginDAO();
            usuarioModel um = new usuarioModel();
            int rpta = 0;
            if(request.getParameter("btn-login")!=null){
                String usuario=request.getParameter("txtusuario");
                String clave=request.getParameter("txtcontrasena");
                um.setUsuario(usuario);
                um.setCont(clave);
                rpta = ldao.validLogin(um);
                arreglo = ldao.llamarDatos(um);

                if (rpta!=0){
                    request.getSession().setAttribute("nombre",arreglo[0]);
                    request.getSession().setAttribute("apellido",arreglo[1]);
                    request.getSession().setAttribute("favoritos",arreglo[2]);
                    request.getSession().setAttribute("usuario",arreglo[3]);
                    request.getSession().setAttribute("correo",arreglo[4]);
                    response.sendRedirect("./index.jsp");
                }
                else{
                    response.sendRedirect("./login.jsp?rpta="+rpta);
                }
            }
        } catch(Exception e){
            System.out.println(e);
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
