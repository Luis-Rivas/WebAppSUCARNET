<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>
<c:set var="pageId" value="FormUpdate" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <h1>Página Princial (INDEX)</h1><hr>
        <br>
        <sql:query dataSource="${fuenteDatos}" var="result">
            SELECT * FROM LIBRO WHERE id=?
            <sql:param value="${param.id}"/>
        </sql:query>
            <c:forEach var = "row" items = "${result.rows}">
        <form action="update.jsp">
            <label>id:</label>
            <input id="GET-isbn" type="text" name="id" value=" <c:out value = "${row.id}"/>" readonly><br>
            <label for="GET-name">ISBN:</label>
            <input id="GET-isbn" type="text" name="isbn" value=" <c:out value = "${row.isbn}"/>"><br>
            <label for="GET-name">TITULO:</label>
            <input id="GET-name" type="text" name="titulo" value=" <c:out value = "${row.titulo}"/>"><br>
            <label for="GET-name">AUTOR:</label>
            <input id="GET-name" type="text" name="autor" value=" <c:out value = "${row.autor}"/>"><br>
            <label for="GET-name">EDITORIAL:</label>
            <input id="GET-name" type="text" name="editorial" value=" <c:out value = "${row.editorial}"/>"><br>
            <input type="submit" value="Actualizar">
        </form>
            </c:forEach>
    </body>
</html>
