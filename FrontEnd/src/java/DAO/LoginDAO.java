/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Model.usuarioModel;
import java.sql.Array;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/**
 *
 * @author jose_
 */
public class LoginDAO {
        Connection cn;
    int rpta=0;
    String sql;
    ResultSet rs = null;
    Statement st=null;
    public int validLogin(usuarioModel um){
       try{
       cn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/login","postgres","123");
       sql = "select COUNT(usuario) as conteo from usrcon where usuario='"+um.getUsuario()+"' AND contrasena=MD5('"+um.getCont()+"')";
       st = cn.createStatement();
       rs = st.executeQuery(sql);
       while (rs.next()){
           rpta = rs.getInt("conteo");
       }
       } catch(SQLException e){
           System.out.println(e);
       }
         return rpta;
    }
    public Object[] llamarDatos(usuarioModel um) throws Exception{
        String nombre="";
        String apellido="";
        String fav="";
        String usuario="";
        String correo="";
        Object[] favo=new Object[20];
        try{
        cn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/login","postgres","123");
       sql = "select * from usrcon where usuario='"+um.getUsuario()+"' AND contrasena=MD5('"+um.getCont()+"')";
           System.out.println(sql);
       st = cn.createStatement();
       rs = st.executeQuery(sql);
       while (rs.next()){
           nombre = rs.getString("nombre");
           apellido = rs.getString("apellido");
           fav = rs.getString("favoritos");
           usuario = rs.getString("usuario");
           correo = rs.getString("correo");
           favo = fav.split(",");
           System.out.println("AARRAY FAV"+usuario);
           System.out.println(Arrays.toString(favo));
       }
        }
       catch(SQLException e){
            System.out.println(e);
               }
        Object[] arreglo = {nombre,apellido,fav,usuario,correo};
        return arreglo;
        }
}
