<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@page import="java.sql.*" %>
<link href="estilos.css" rel="stylesheet" type="text/css"/>
<title>Proceso Login</title>
</head>
<body>

  <%

Class.forName("com.mysql.jdbc.Driver");
Connection dbconect = DriverManager.getConnection("jdbc:mysql://localhost:3306/ProyectoSemestral","root","");
Statement dbstatement = dbconect.createStatement();

String username = request.getParameter("username");
String password = request.getParameter("password");


try{
	PreparedStatement ConsultaBD = dbconect.prepareStatement("SELECT * FROM Usuarios WHERE USERNAME = ? AND PASSWORD = ?");
	ConsultaBD.setString(1,username);
	ConsultaBD.setString(2,password);
	
	ResultSet Resultado = ConsultaBD.executeQuery();
	
	if (Resultado.next())
		response.sendRedirect("HOME.html");
} catch (Exception e){
	out.println("--Error--<br>");
	out.println("Consulta Invalida");
}
 %>
 
 <h1> Vaya! Parece que hubo un error, quizas tu usuario no existe.</h1>
 
 <a href="REGISTRO_USUARIO.html" style="margin-left: 50px">Registro de Usuarios</a>
 <a href="LOGIN_USUARIO.html" style="margin-left: 50px">Volver al Login</a>

</body>
</html>