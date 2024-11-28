package model.dao;

import model.Funcionario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.DataSource;

public class FuncionarioDAO {

    // Método para autenticar o funcionário
    public Funcionario auth(String nome, String senha) throws SQLException, ClassNotFoundException {
        String sql = "SELECT id, nome, nomeCompleto FROM funcionario WHERE nome = ? AND senha = ?";
        Funcionario funcionario = null;

        try (Connection connection = DataSource.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
             
            // Configurando os parâmetros da consulta
            stmt.setString(1, nome);
            stmt.setString(2, senha);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    // Preenchendo os dados do funcionário
                    funcionario = new Funcionario();
                    funcionario.setId(rs.getInt("id"));
                    funcionario.setNome(rs.getString("nome"));
                    funcionario.setNomeCompleto(rs.getString("nomeCompleto"));
                }
            }
        }
        return funcionario; // Retorna null se não encontrar o funcionário
    }
}