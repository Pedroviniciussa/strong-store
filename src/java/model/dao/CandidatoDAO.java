package model.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.*;


import database.DataSource;

public class CandidatoDAO {

    // Criar uma nova pesquisa (candidato)
    public void criarPesq(Candidato candidato) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO candidato (nomeCompleto, idade, email, p1, p2, p3, p4, p5, obs) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DataSource.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, candidato.getNomeCompleto());
            stmt.setInt(2, candidato.getIdade());
            stmt.setString(3, candidato.getEmail());
            stmt.setInt(4, candidato.getP1());
            stmt.setInt(5, candidato.getP2());
            stmt.setInt(6, candidato.getP3());
            stmt.setBoolean(7, candidato.isP4());
            stmt.setInt(8, candidato.getP5());
            stmt.setString(9, candidato.getObs());
            stmt.executeUpdate();
        }
    }

    // Localizar uma pesquisa por ID
    public Candidato localizaPesq(int id) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM candidato WHERE id = ?";
        try (Connection connection = DataSource.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new Candidato(
                            rs.getInt("id"),
                            rs.getString("nomeCompleto"),
                            rs.getInt("idade"),
                            rs.getString("email"),
                            rs.getInt("p1"),
                            rs.getInt("p2"),
                            rs.getInt("p3"),
                            rs.getBoolean("p4"),
                            rs.getInt("p5"),
                            rs.getString("obs")
                    );
                }
            }
        }
        return null; // Retorna null se não encontrar
    }

    // Obter todas as pesquisas
    public List<Candidato> tdsPesq() throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM candidato";
        List<Candidato> candidatos = new ArrayList<>();
        try (Connection connection = DataSource.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                Candidato candidato = new Candidato(
                        rs.getInt("id"),
                        rs.getString("nomeCompleto"),
                        rs.getInt("idade"),
                        rs.getString("email"),
                        rs.getInt("p1"),
                        rs.getInt("p2"),
                        rs.getInt("p3"),
                        rs.getBoolean("p4"),
                        rs.getInt("p5"),
                        rs.getString("obs")
                );
                candidatos.add(candidato);
            }
        }
        return candidatos;
    }

    // Atualizar uma pesquisa existente
    public void atualizarPesq(int id, Candidato candidato) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE candidato SET nomeCompleto = ?, idade = ?, email = ?, p1 = ?, p2 = ?, p3 = ?, p4 = ?, p5 = ?, obs = ? WHERE id = ?";
        try (Connection connection = DataSource.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, candidato.getNomeCompleto());
            stmt.setInt(2, candidato.getIdade());
            stmt.setString(3, candidato.getEmail());
            stmt.setInt(4, candidato.getP1());
            stmt.setInt(5, candidato.getP2());
            stmt.setInt(6, candidato.getP3());
            stmt.setBoolean(7, candidato.isP4());
            stmt.setInt(8, candidato.getP5());
            stmt.setString(9, candidato.getObs());
            stmt.setInt(10, id);
            stmt.executeUpdate();
        }
    }

    // Deletar uma pesquisa por ID
    public void deletar(int id) throws SQLException, ClassNotFoundException {
        String sql = "DELETE FROM candidato WHERE id = ?";
        try (Connection connection = DataSource.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    // Gerar relatório
    public Relatorio gerarRelatorio() throws SQLException, ClassNotFoundException {
        String sql = """
        SELECT 
            COUNT(*) AS totalPesquisas,
            AVG((p1 + p2 + p3 + p5) / 4.0) AS nivelSatisfacao
        FROM candidato
    """;

        try (Connection connection = DataSource.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                int totalPesquisas = rs.getInt("totalPesquisas");
                double nivelSatisfacao = rs.getDouble("nivelSatisfacao");
                return new Relatorio(totalPesquisas, nivelSatisfacao);
            }
        }
        return new Relatorio(0, 0.0); // Retorno padrão caso não haja dados
    }

    public RelatorioPorIdade gerarRelatorioPorIdade() throws SQLException, ClassNotFoundException {
        String sql = """
        SELECT 
            AVG(CASE WHEN idade < 18 THEN (p1 + p2 + p3 + p5) / 4.0 END) AS satisfacaoMenor18,
            AVG(CASE WHEN idade BETWEEN 18 AND 30 THEN (p1 + p2 + p3 + p5) / 4.0 END) AS satisfacao18a23,
            AVG(CASE WHEN idade > 30 THEN (p1 + p2 + p3 + p5) / 4.0 END) AS satisfacaoAcima30
        FROM candidato
    """;

        try (Connection connection = DataSource.getConnection(); PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                double satisfacaoMenor18 = rs.getDouble("satisfacaoMenor18");
                double satisfacao18a30 = rs.getDouble("satisfacao18a23");
                double satisfacaoAcima30 = rs.getDouble("satisfacaoAcima30");
                return new RelatorioPorIdade(satisfacaoMenor18, satisfacao18a30, satisfacaoAcima30);
            }
        }
        return new RelatorioPorIdade(0.0, 0.0, 0.0); // Retorno padrão caso não haja dados
    }

}
