<%@page import="dao.UsuarioDAO"%>
<jsp:useBean id="u" class="bean.Usuario"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	int i= UsuarioDAO.saveUsuario(u);
	if (i>0){
		response.sendRedirect("addUsuarioComSucesso.jsp");
	}else{
		response.sendRedirect("addUsuarioSemSucesso.jsp");
	}
%>