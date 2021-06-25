
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de usuários</title>
</head>
<body>
	<%@ page import="dao.UsuarioDAO, bean.Usuario, java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	
	<h1>Listagem de usuários</h1>
	<% 
	List<Usuario> list = UsuarioDAO.getAllUsuarios();
	request.setAttribute("list", list);
	%>
	
	<table border="1">
		<tr><th>Id</th><th>Nome completo</th><th>Endereço</th>
		<th>Cidade</th><th>Unidade Federativa</th><th>CPF</th>
		<th>Telefone</th><th>Editar</th><th>Excluir</th></tr>
		<c:forEach items="${list}" var="usuario">
			<tr>
				<td>${usuario.getId()}</td>
				<td>${usuario.getNomeCompleto()}</td>
				<td>${usuario.getEndereco()}</td>
				<td>${usuario.getCidade()}</td>
				<td>${usuario.getUnidadeFederativa()}</td>
				<td>${usuario.getCPF()}</td>
				<td>${usuario.getTelefone()}</td>
				<td><a href="editarform.jsp?id=${usuario.getId()}">Editar</a></td>
				<td><a href="excluirform.jsp?id=${usuario.getId()}">Excluir</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="adicionarform.jsp">Adicionar novo usuário</a>
	
	
</body>
</html>