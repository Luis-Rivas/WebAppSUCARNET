
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Index" />
<c:set var="standalone" value="not" />
<%@ include file="seguridad.jsp" %>
<!DOCTYPE html>
<html>
    <%@ include file="head.jsp" %>
    <body>
        
        <%@ include file="header.jsp" %>
      
        <div style="background-color: whitesmoke; padding-bottom: 10%;">  <br>
        <c:if test="${sessionScope.nivel eq 1}">
        <div style="width:40%; border:solid; margin-left:30%; background-color:wheat; ">
            <h2 style="text-align: center;">Agregar un Libro</h2>
            <form class="px-4 py-3" action="./insert.jsp" style="margin:5%;">
              <div class="form-group">
                <label for="text">ISBN:</label>
                <input type="text" class="form-control" id="isbn" placeholder="" name="isbn">
              </div>
              <div class="form-group">
                <label for="text">TITULO:</label>
                <input type="text" class="form-control" id="titulo" placeholder="Ingrese el titulo del libro" name="titulo">
              </div>
              <div class="form-group">
                <label for="pwd">AUTOR:</label>
                <input type="text" class="form-control" id="autor" placeholder="Ingrese el autor del libro" name="autor">
              </div>
                <div class="form-group">
                <label for="pwd">EDITORIAL:</label>
                <input type="text" class="form-control" id="editorial" placeholder="Ingrese la editorial del libro" name="editorial">
                </div>
              <button type="submit" class="btn" style="background-color:#814747; color:wheat;">Submit</button>
            </form>
        </div><br><hr>
        </c:if>
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>
            <div class="container">
                <h2  style="text-align: center;">TABLA DE LIBROS</h2><br>
        <table class="table table-bordered">
            <tr class="table-warning">
                <th>ID Libro</th>
                <th>ISBN</th>
                <th>TITULO</th>
                <th>AUTOR</th>
                <th>EDITORIAL</th>
                <c:if test="${sessionScope.nivel eq 2}"><th>Acción</th></c:if>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td>
                        <c:out value = "${row.id}"/>
                    </td>
                    <td><c:out value = "${row.isbn}"/></td>
                    <td>
                        <c:out value = "${row.titulo}"/>
                    </td>
                    <td><c:out value = "${row.autor}"/></td>
                    <td><c:out value = "${row.editorial}"/></td>
                    <c:if test="${sessionScope.nivel eq 2}">
                    <td><a href = "delete.jsp?id=${row.id}">Eliminar</a><br>
                        <a href="frmupdate.jsp?id=${row.id}">Actualizar</a></td>
                    </c:if>
                </tr>
            </c:forEach>
        </table>
      </div>
        <!--<a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>-->
       </div> 
        <br>
        <h2>Cambio directo de usuario</h2>
        <a href="nivel.jsp?n=1">Digitador</a><br>
        <a href="nivel.jsp?n=2">Mantenimiento</a><br>
        <a href="nivel.jsp?n=0">Anonimo</a><br>
    </body>
</html>
