<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Delete" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>

<!DOCTYPE html>
<html>
    <%@include file="head.jsp" %>
    
    <body>
        <%@include file="header.jsp"%>
        <br>
        <div style="width: 60%;margin-left: 20%;background-color: #B2FF89;text-align: center;">
            <h3 style="color:green;">Libro eliminado correctamente</h3><br>
        <a href="index.jsp">Volver al Inicio</a>
        </div>
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro where id=?;
            <sql:param value="${param.id}"/>
        </sql:query>
        <c:if test="${empty param.id}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="parametro"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        <c:if test="${empty result.rows}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="parametro"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        <c:forEach var = "row" items = "${result.rows}">
        <c:set var = "libroId" value = "${param.id}"/>
        <div style="width: 50%;margin-left: 25%;">
        <table class="table table-bordered">
            <thead ><h4>Libro eliminado:</h4></thead>
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
        <sql:update dataSource = "${fuenteDatos}" var = "count">
            DELETE from libro WHERE  id=?
            <sql:param value = "${libroId}" />
        </sql:update>
            
    </body>
</html>
