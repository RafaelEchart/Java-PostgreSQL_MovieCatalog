<%@page import="java.sql.Array"%>
<%@page import="java.sql.*" %>




<%
    Connection cn;
    int rpta = 0;
    String sql;
    ResultSet rs = null;
    Statement st = null;
    int aidi=0;
    String comment = (String) request.getParameter("param1");
    String username = (String) request.getParameter("param2");
    String rating = (String) request.getParameter("param3");
    String codigo = (String) request.getParameter("param4");
    cn=DriverManager.getConnection("jdbc:postgresql://localhost:5432/login","postgres","123");
    st = cn.createStatement();
    rs= st.executeQuery("select * from comentario order by id asc");
    while (rs.next()){
        aidi = rs.getInt("id");
    }
    
    Class.forName("org.postgresql.Driver");
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/login","postgres","123");	
PreparedStatement ps = cn.prepareStatement("INSERT INTO comentario VALUES(?,?,?,?,?,?);");
ps.setInt(1,aidi+1);
ps.setString(2, codigo);
ps.setString(3, username);
ps.setString(4, comment);
ps.setString(5, "2021-30-09");
ps.setString(6, rating);
ps.executeUpdate();
%>
