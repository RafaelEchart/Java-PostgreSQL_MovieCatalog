<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import ="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>AJAX REQUEST</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	</head>
	<body>
		<div class="container-fluid">
			<%
				String username =request.getParameter("username");
                                
                                String rating = request.getParameter("rating");
                                
				String comment =request.getParameter("comment");
			%>
			<div class="panel-primary">
				<div class="panel-heading">
					<h4 class="panel-title">COMMENTS</h4>
				</div>
                                                            <div class="panel-coments">
                                    <table>
					<%
					 Object[] usuarios = new Object[4];
                                         Integer aidi = 0;
					try {			
                                            Class.forName("org.postgresql.Driver");
                                            Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/login","postgres","123");		
                                            Statement ps = con.createStatement();
                                            ResultSet rs= ps.executeQuery("select * from comentario order by id asc");
                                            while (rs.next()){
                                               usuarios[0]=rs.getString("usuario");
                                               usuarios[1]=rs.getString("comentario");
                                               usuarios[2]=rs.getString("tiempo");
                                               usuarios[3]=rs.getString("rate");
                                               aidi=rs.getInt("id");
                                               // table.addRow(usuarios);
           %>
               <tr>
               <td style="border:1px rosybrown solid"><%=usuarios[0]%></td>
               <td style="border:1px rosybrown solid"><%=usuarios[1]%></td>
               <td style="border:1px rosybrown solid"><%=usuarios[2]%></td>
               <td style="border:1px rosybrown solid"><%=usuarios[3]%></td>
               </tr>
         </table>
        <%
       }
            }catch(Exception e){
            
        }
        %>
				<div class="panel-body">
					<%
 Calendar c = new GregorianCalendar();
String dia = Integer.toString(c.get(Calendar.DATE));
String mes = Integer.toString(c.get(Calendar.MONTH)+1);
String anio = Integer.toString(c.get(Calendar.YEAR));
String hora = Integer.toString(c.get(Calendar.HOUR));
String minuto = Integer.toString(c.get(Calendar.MINUTE));
String fecha = anio + "/" + mes + "/" + dia + "--"+ hora + ":"+minuto;

					try {			
						Class.forName("org.postgresql.Driver");
						Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5433/login","postgres","123");	
						PreparedStatement ps = con.prepareStatement("INSERT INTO comentario VALUES(?,?,?,?,?,?);");
						ps.setInt(1,aidi+1);
                                                ps.setString(2, "tt0086250");
						ps.setString(3, username);
                                                ps.setString(4, comment);
                                                ps.setString(5, fecha);
                                                ps.setString(6, rating);
						ps.executeUpdate();
						%>
						<%con.close();
					}catch (Exception e) {
						System.out.println(e);		
					}
					%>
				</div>


				</div>
			</div>
		</div>
		
	</body>
</html>
