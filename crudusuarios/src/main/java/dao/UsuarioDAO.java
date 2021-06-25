package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import bean.Usuario;

public class UsuarioDAO {
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/crudusuarios","root","root");
		} catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
	
	public static Usuario getUsuario(int id){
		Usuario u = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from usuario where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
		
			
			while(rs.next()) {
				u = new Usuario();
				u.setId(rs.getInt("id"));
				u.setNomeCompleto(rs.getString("nomeCompleto"));
				u.setEndereco(rs.getString("endereco"));
				u.setCidade(rs.getString("cidade"));
				u.setUnidadeFederativa(rs.getString("unidadeFederativa"));
				u.setCPF(rs.getString("CPF"));
				u.setTelefone(rs.getString("telefone"));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return u;
	}
	
	public static List<Usuario> getAllUsuarios(){
		List<Usuario> list = new ArrayList<Usuario>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from usuario");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Usuario u = new Usuario();
				u.setId(rs.getInt("id"));
				u.setNomeCompleto(rs.getString("nomeCompleto"));
				u.setEndereco(rs.getString("endereco"));
				u.setCidade(rs.getString("cidade"));
				u.setUnidadeFederativa(rs.getString("unidadeFederativa"));
				u.setCPF(rs.getString("CPF"));
				u.setTelefone(rs.getString("telefone"));
				list.add(u);
			}
		} catch(Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
	public static int updateUsuario(Usuario usuario) {
		int statusDaAlteracao = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("update usuario set nomeCompleto=?,"
					+ "endereco=?, cidade=?, unidadeFederativa=?, CPF=?, telefone=? where id=?");
			ps.setString(1, usuario.getNomeCompleto());
			ps.setString(2, usuario.getEndereco());
			ps.setString(3, usuario.getCidade());
			ps.setString(4, usuario.getUnidadeFederativa());
			ps.setString(5, usuario.getCPF());
			ps.setString(6, usuario.getTelefone());
			ps.setInt(7, usuario.getId());
			statusDaAlteracao = ps.executeUpdate();	
		}catch(Exception e) {
			System.out.println(e);
		}
		return statusDaAlteracao;
	}
	
	public static int saveUsuario(Usuario usuario) {
		int statusDaInclusao = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps= (PreparedStatement) con.prepareStatement("insert into usuario"
					+ "(nomeCompleto, endereco, cidade, unidadeFederativa, CPF, telefone)"
					+ "values (?,?,?,?,?,?)");
			ps.setString(1, usuario.getNomeCompleto());
			ps.setString(2, usuario.getEndereco());
			ps.setString(3, usuario.getCidade());
			ps.setString(4, usuario.getUnidadeFederativa());
			ps.setString(5, usuario.getCPF());
			ps.setString(6, usuario.getTelefone());
			statusDaInclusao = ps.executeUpdate();
		}catch(Exception e) {
			System.out.println(e);
		}
		return statusDaInclusao;
	}
	
}
