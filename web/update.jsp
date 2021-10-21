<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Update" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>ACTUALIZANDO REGISTRO</h1>
        <c:if test="${empty param.id or empty param.autor or empty param.titulo or empty param.editorial}">
            <c:redirect url="error.jsp">
                <c:param name="tipo" value="parametro"/>
                <c:param name="destino" value="index.jsp"/>
            </c:redirect>
        </c:if>
        <c:set var = "libroId" value = "${param.id}"/>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE libro SET titulo=?, autor=?, editorial=?  WHERE  id=?
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>
            <sql:param value = "${libroId}" />
        </sql:update>
        <a href="index.jsp">Volver al Inicio</a>
    </body>
</html>
