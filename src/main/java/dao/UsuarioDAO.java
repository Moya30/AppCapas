/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Freddy
 */
public class UsuarioDAO {

    public static Usuario buscar(String codigo) {

        String sql = "select * from usuario where codiUsua=?";
        Connection cn;
        try {
            cn = MySQL.getInstance().getConnection();
            PreparedStatement pstm = cn.prepareStatement(sql);

            pstm.setString(1, codigo);

            ResultSet rst = pstm.executeQuery();

            while (rst.next()) {
                Usuario u = new Usuario(rst.getString(1), rst.getString(2), rst.getString(3));

                return u;
            }

            //cn.close();
            return null;
        } catch (Exception ex) {
            return null;
        }

    }

    public static List<Usuario> consultar() throws Exception {
        List<Usuario> datos = new ArrayList<>();
        String sql = "select * from usuario";
        Connection cn;

        try {
            cn = MySQL.getInstance().getConnection();
            PreparedStatement pstm = cn.prepareStatement(sql);

            pstm = cn.prepareStatement(sql);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario(rs.getString(1), rs.getString(2), rs.getString(3));

                datos.add(u);
                System.out.println(datos);
            }
            //cn.close();
        } catch (ClassNotFoundException | SQLException e) {

        }
        return datos;

    }

    public static void main(String[] args) {
        Usuario u = UsuarioDAO.buscar("76197438");
        System.out.println(u.getLogiUsua());
    }

}
