<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edição de usuário</title>
</head>
<body>
	<%@page import="dao.UsuarioDAO, bean.Usuario" %>
	<%
		String id = request.getParameter("id");
		Usuario usuario = UsuarioDAO.getUsuario(Integer.parseInt(id));
	%>
	
	<h1>Edição do usuário</h1>
	<form action="editarusuario.jsp" method="post">
		<input type="text" name="id" value="<%=usuario.getId()%>">
		<table>
			<tr>
				<td>Nome:</td>
				<td><input type="text" name="nome" value="<%=usuario.getNomeCompleto()%>"/></td>
			</tr>
			<tr>
				<td>Endereço:</td>
				<td><input type="text" name="endereco" value="<%=usuario.getEndereco()%>"/></td>
			</tr>
			<tr>
				<td>Cidade:</td>
				<td><input type="text" name="cidade" value="<%=usuario.getCidade()%>"/></td>
			</tr>
			<tr>
				<td>Unidade federativa:</td>
				<td><input type="text" name="unidadefederativa" value="<%=usuario.getUnidadeFederativa()%>"/></td>
			</tr>
			<tr>
				<td>CPF:</td>
				<td><input type="text" name="cpf" value="<%=usuario.getCPF()%>"/></td>
			</tr>
			<tr>
				<td>Telefone:</td>
				<td><input type="text" name="telefone" value="<%=usuario.getTelefone()%>"/></td>
			</tr>	
			<tr>
				<td colspan="2"><input type="submit" value="Editar usuário"/></td>
			</tr>		
		</table>
	</form>
	
</body>
</html>