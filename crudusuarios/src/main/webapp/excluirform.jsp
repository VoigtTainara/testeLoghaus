<%@page import="dao.UsuarioDAO, bean.Usuario" %>
<jsp:useBean id="u" class="bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>
<%
	UsuarioDAO.deleteUsuario(u);
	response.sendRedirect("verusuarios.jsp");
%>
