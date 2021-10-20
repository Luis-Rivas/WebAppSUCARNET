<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Se agregó el Libro: </h1>
        <p>Título:<c:out value="${param.titulo}"/>, Autor:<c:out value="${param.autor}"/>
        </p>
        <sql:update dataSource = "${fuenteDatos}" var = "count">
            INSERT INTO libro (isbn,titulo,autor,editorial) VALUES(?,?,?,?)
            <sql:param value="${param.isbn}"/>
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>
        </sql:update>
        <a href="index.jsp">Volver al Inicio</a>
    </body>
</html>
