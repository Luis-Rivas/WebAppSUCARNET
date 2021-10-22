<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="head.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INICIAR SESIÓN</title>
    </head>
    <body style="background-color:#814747">
        
        <div id="container" style="margin-top: 5%;width: 25%;margin-left: 37.5%;">
            <h1 style="text-align: center;">INICIAR SESIÓN</h1>
            <c:if test="${not empty param.msg}">
                <p style="color:red;">Error: ${param.msg}</p>
            </c:if>
                <form class="form group" name="login" action="validar.jsp" method="post" style="color:wheat;">
                <!-- Username -->
                <label for="usuario">Usuario:</label>
                <input class="form-control" name="usuario" id="usuario" type="input">
                <!-- Password -->
                <label for="clave">Clave:</label>
     
                    <input class="form-control" name="clave" id="clave" type="password">
                <div id="lower">
                    <br><input type="submit"  class="btn" style="background-color:wheat;" value="Ingresar">
                </div>
                    <br><a href="index.jsp" style="text-align: none; color:wheat;">Cancelar</a>
            </form>       
        </div>
    </body>
</html>
