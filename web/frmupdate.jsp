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
    <%@ include file="head.jsp" %>
    <body>
        <%@ include file="header.jsp" %>
        <br>
        <sql:query dataSource="${fuenteDatos}" var="result">
            SELECT * FROM LIBRO WHERE id=?
            <sql:param value="${param.id}"/>
        </sql:query>
            <c:forEach var = "row" items = "${result.rows}">
            <div style="width:40%; border:solid; margin-left:30%; background-color:wheat; ">
            <h2 style="text-align: center;">Actualizando el Libro: </h2>
            <form class="px-4 py-3" action="./update.jsp" style="margin:5%;">
                <div class="form-group">
                <label for="text">ID:</label>
                <input type="text" class="form-control" id="isbn" placeholder="" name="id" value=" <c:out value = "${row.id}"/>" readonly>
              </div>
              <div class="form-group">
                <label for="text">ISBN:</label>
                <input type="text" class="form-control" id="isbn" placeholder="" name="isbn" value=" <c:out value = "${row.isbn}"/>">
              </div>
              <div class="form-group">
                <label for="text">TITULO:</label>
                <input type="text" class="form-control" id="titulo" placeholder="Ingrese el titulo del libro" name="titulo" value=" <c:out value = "${row.titulo}"/>">
              </div>
              <div class="form-group">
                <label for="pwd">AUTOR:</label>
                <input type="text" class="form-control" id="autor" placeholder="Ingrese el autor del libro" name="autor" value=" <c:out value = "${row.autor}"/>">
              </div>
                <div class="form-group">
                <label for="pwd">EDITORIAL:</label>
                <input type="text" class="form-control" id="editorial" placeholder="Ingrese la editorial del libro" name="editorial" value=" <c:out value = "${row.editorial}"/>">
                </div>
              <a href="index.jsp" class="btn" style="background-color:#814747; color:wheat;">cancelar</a>
              <button type="submit" class="btn" style="background-color:#814747; color:wheat;">Actualizar</button>
            </form>
        </div>
            </c:forEach>
    </body>
</html>
