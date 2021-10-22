<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>
<c:set var="pageId" value="Insert" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <title>Insertar Libro</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
         <br>
        <div style="width: 60%;margin-left: 20%;background-color: #B2FF89;text-align: center;">
            <h3 style="color:green;">Libro agregado correctamente</h3><br><a href="index.jsp">Volver al Inicio</a></div>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            INSERT INTO libro (isbn,titulo,autor,editorial) VALUES(?,?,?,?)
            <sql:param value="${param.isbn}"/>
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>
        </sql:update>
        <sql:query dataSource="${fuenteDatos}" var = "result">
            select * from libro where isbn=?
            <sql:param value="${param.isbn}"/>
        </sql:query>
            <c:forEach var = "row" items = "${result.rows}">
        <div style="width: 50%;margin-left: 25%;">
        <table class="table table-bordered">
            <thead ><h4 style="color:green;">Libro agregado:</h4></thead>
            <tr>
                <th>ID:</th>
                <th><c:out value = "${row.id}"/></th>
            </tr>
            <tr>
                <th>ISBN:</th>
                <th><c:out value = "${row.isbn}"/></th>
            </tr>
            <tr>
                <th>TITULO:</th>
                <th><c:out value = "${row.titulo}"/></th>
            </tr>
            <tr>
                <th>AUTOR:</th>
                <th><c:out value = "${row.autor}"/></th>
            </tr>
            <tr>
                <th>EDITORIAL:</th>
                <th><c:out value = "${row.editorial}"/></th>
            </tr>
        </table>
            </div>
            </c:forEach>
    </body>
</html>
