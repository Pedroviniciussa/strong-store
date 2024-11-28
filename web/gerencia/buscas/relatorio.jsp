<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="model.dao.CandidatoDAO"%>
<%@page import="model.Relatorio"%>
<%@page import="model.RelatorioPorIdade"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Relatórios</title>
    <link rel="stylesheet" href="../../styles.css">
</head>
<body>

    <!-- Conteúdo Principal -->
    <div class="main-content">
        <h1>Relatórios de Satisfação</h1>
        <div class="container">
            <%
                // Variáveis para armazenar os relatórios
                Relatorio relatorio = null;
                RelatorioPorIdade relatorioPorIdade = null;

                try {
                    // Instanciando o DAO e obtendo os relatórios
                    CandidatoDAO dao = new CandidatoDAO();
                    relatorio = dao.gerarRelatorio();
                    relatorioPorIdade = dao.gerarRelatorioPorIdade();
                } catch (SQLException | ClassNotFoundException e) {
                    // Exibindo mensagem de erro no HTML para feedback
                    out.println("<p class='error-message'>Erro ao gerar relatório: " + e.getMessage() + "</p>");
                    relatorio = new Relatorio(0, 0.0); // Retorna valores padrão
                    relatorioPorIdade = new RelatorioPorIdade(0.0, 0.0, 0.0); // Retorna valores padrão
                }
            %>

            <!-- Relatório Geral -->
            <div class="report">
                <h2>Total de Pesquisas</h2>
                <p class="report-value" id="total-pesquisas">
                    <%= relatorio.getTotalPesquisas() %>
                </p>
            </div>

            <div class="report">
                <h2>Nível de Satisfação Geral</h2>
                <p class="report-value" id="nivel-satisfacao">
                    <%= String.format("%.2f", relatorio.getNivelSatisfacao()) %> / 5
                </p>
            </div>

            <!-- Exibição de mensagem se não houver dados -->
            <% if (relatorio.getTotalPesquisas() == 0) { %>
                <p class="error-message">Nenhum dado disponível para o relatório geral.</p>
            <% } %>

            <!-- Relatório por Idade -->
            <div class="report-section">
                <h4>Satisfação por Faixa Etária</h4>

                <div class="report">
                    <h3>Menores de 18 anos</h3>
                    <p class="report-value">
                        <%= String.format("%.2f", relatorioPorIdade.getSatisfacaoMenor18()) %> / 5
                    </p>
                </div>

                <div class="report">
                    <h3>Entre 18 e 30 anos</h3>
                    <p class="report-value">
                        <%= String.format("%.2f", relatorioPorIdade.getSatisfacao18a23()) %> / 5
                    </p>
                </div>

                <div class="report">
                    <h3>Acima de 30 anos</h3>
                    <p class="report-value">
                        <%= String.format("%.2f", relatorioPorIdade.getSatisfacaoAcima30()) %> / 5
                    </p>
                </div>

                <!-- Exibição de mensagem se não houver dados por idade -->
                <% if (relatorio.getTotalPesquisas() == 0) { %>
                    <p class="error-message">Nenhum dado disponível para o relatório por idade.</p>
                <% } %>
            </div>

            <!-- Botão Voltar -->
            <button class="back-button" onclick="window.history.back()">Voltar</button>
        </div>
    </div>

</body>
</html>
