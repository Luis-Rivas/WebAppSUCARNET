<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="nav" style="background-color:#814747; justify-content: center;">
    <h1 style="color:wheat;font-family: cursive;">BIBLIOTECA GRUPO 04</h1>
<table  width="100%" style="text-align: center; background-color:#814747; ">
    <tr>
        <td width="33%">
            <span style="color:white;font-size:5mm;">
                <a href="index.jsp" style="text-decoration: default;color:wheat;">INICIO</a>
            </span>
        </td>
        <td width="33%" style="color:wheat;">
            SISTEMA DE REGISTRO DE LIBROS<br>
            <h6 style="color:white;">${sessionScope.nombre}</h6>
            <b style="color:red;">${sessionScope.name}</b>
        </td>
        <td width="33%">
    
          <c:if test="${not empty sessionScope.user}">
              <c:if test="${sessionScope.user != 'Anonimo'}">
              <span style="color:white;font-size:5mm;">
                  Usuario: ${sessionScope.user}</span><br>
                  <a href="logout.jsp" style="text-decoration: default;color:wheat; ">Logout</a>
              </c:if>
          </c:if>
        
   
    <c:if test="${empty sessionScope.user or sessionScope.user eq 'Anonimo'}">
          <span style="color:brown;font-size:5mm;">
              <a href="frmlogin.jsp" style="text-decoration: default;color:wheat; ">Login</a>
        </span>
    </c:if>
</td>
</tr>    
</table>
</nav>
