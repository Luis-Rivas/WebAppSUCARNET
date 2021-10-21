
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function actualizar(id)
            {
                //var nlast = prompt("Ingrese el apellido que reemplaza el actual apellido(" + last + ")");
                location.href = "frmupdate.jsp?id=" + id;
            }
            function eliminar(id)
            {
                alert("A continuación se eliminará el registro #"+id);
                location.href = "delete.jsp?id=" + id;
            }
        </script>
    </head>
    <body>
        <h1>Página Princial (INDEX)</h1>
        <%@ include file="header.jsp" %>
        <hr>
        <br>
        <c:if test="${sessionScope.nivel eq 1}">
        <form action="insert.jsp">
            <label for="GET-name">ISBN:</label>
            <input id="GET-isbn" type="text" name="isbn"><br>
            <label for="GET-name">TITULO:</label>
            <input id="GET-name" type="text" name="titulo"><br>
            <label for="GET-name">AUTOR:</label>
            <input id="GET-name" type="text" name="autor"><br>
            <label for="GET-name">EDITORIAL:</label>
            <input id="GET-name" type="text" name="editorial"><br>
            <input type="submit" value="Save">
        </form>
        </c:if>
        <h2>TABLA DE DATOS</h2><br>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>

        <table border = "1" width = "100%">
            <tr>
                <th>ID Libro</th>
                <th>ISBN</th>
                <th>TITULO</th>
                <th>AUTOR</th>
                <th>EDITORIAL</th>
                <c:if test="${sessionScope.nivel eq 2}"><th>Acción</th></c:if>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td onclick="eliminar('${row.id}');" 
                        onmouseover="this.style.backgroundColor='pink';"
                        onmouseout="this.style.backgroundColor='white';">
                        <c:out value = "${row.id}"/>
                    </td>
                    <td><c:out value = "${row.isbn}"/></td>
                    <td onclick="actualizar('${row.id}');"  
                        onmouseover="this.style.backgroundColor='green';"
                        onmouseout="this.style.backgroundColor='white';">
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
        <!--<a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>-->
        
        <br>
        <h2>Cambio directo de usuario</h2>
        <a href="nivel.jsp?n=1">Digitador</a><br>
        <a href="nivel.jsp?n=2">Mantenimiento</a><br>
        <a href="nivel.jsp?n=0">Anonimo</a><br>
    </body>
</html>
