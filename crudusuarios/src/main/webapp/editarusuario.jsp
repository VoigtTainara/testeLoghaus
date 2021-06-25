<%@page import="dao.UsuarioDAO"%>
<jsp:useBean id="u" class="bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
int i= UsuarioDAO.updateUsuario(u);
response.sendRedirect("verusuarios.jsp");
%>