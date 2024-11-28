<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Candidato"%>
<%@page import="model.dao.CandidatoDAO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exibição de Pesquisas - Área Administrativa</title>
    <link rel="stylesheet" href="../../styles.css">
</head>
<body>

    <div class="container">
        <h1>Relatório de Pesquisas de Satisfação</h1>

        <!-- Tabela de Pesquisas -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Idade</th>
                    <th>Email</th>
                    <th>P1</th>
                    <th>P2</th>
                    <th>P3</th>
                    <th>P4</th>
                    <th>P5</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Instanciando o DAO e buscando os candidatos
                    CandidatoDAO dao = new CandidatoDAO();
                    List<Candidato> candidatos = dao.tdsPesq();

                    // Iterando sobre a lista de candidatos para preencher a tabela
                    for (Candidato candidato : candidatos) {
                %>
                <tr>
                    <td><%= candidato.getId() %></td>
                    <td><%= candidato.getNomeCompleto() %></td>
                    <td><%= candidato.getIdade() %></td>
                    <td><%= candidato.getEmail() %></td>
                    <td><%= candidato.getP1() %></td>
                    <td><%= candidato.getP2() %></td>
                    <td><%= candidato.getP3() == 5 ? "Sim" : "Não" %></td>
                    <td><%= candidato.isP4() ? "Sim" : "Não" %></td>
                    <td><%= candidato.getP5() %></td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <!-- Botão para voltar -->
        <div class="button-container">
            <a href="../gerencia.jsp">
                <button class="back-button">Voltar para Área Administrativa</button>
            </a>
        </div>
    </div>

</body>
</html>
