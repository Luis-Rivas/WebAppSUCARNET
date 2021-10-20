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
        <h1>Se ha Eliminando  el REGISTRO: </h1><br>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro where id=?;
            <sql:param value="${param.id}"/>
        </sql:query>
        <c:forEach var = "row" items = "${result.rows}">
        <c:set var = "libroId" value = "${param.id}"/>
            <h4>id: <c:out value = "${row.id}"/></h4><br>
            <h4>isbn: <c:out value = "${row.isbn}"/></h4><br>
            <h4>Titulo: <c:out value = "${row.titulo}"/></h4><br>
            <h4>Autor: <c:out value = "${row.autor}"/></h4><br>
            <h4>Editorial: <c:out value = "${row.editorial}"/></h4><br>
            </c:forEach>
        <sql:update dataSource = "${fuenteDatos}" var = "count">
            DELETE from libro WHERE  id=?
            <sql:param value = "${libroId}" />
        </sql:update>
            
        <a href="index.jsp">Volver al Inicio</a>
    </body>
</html>
