<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Funcionario"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Área Administrativa</title>
    <link rel="stylesheet" href="../styles.css">
</head>
<body>
    <div class="container">
        <h1>Área Administrativa</h1>

        <!-- Nome e Sobrenome do Administrador -->
        <div class="admin-info">
            <%
                // Recuperando o objeto Funcionario da sessão
                Funcionario funcionario = (Funcionario) session.getAttribute("funcionario");

                if (funcionario != null) {
            %>
                <p>Nome: <strong><%= funcionario.getNome() %></strong></p>
                <p>Nome Completo: <strong><%= funcionario.getNomeCompleto() %></strong></p>
            <%
                } else {
            %>
                <p>Erro: Dados do funcionário não encontrados na sessão.</p>
            <%
                }
            %>
        </div>

        <!-- Botões de Ação -->
        <div class="button-group">
            <button onclick="window.location.href='buscas/busca-pesquisa.html';">Busca Pesquisa</button>
            <button onclick="window.location.href='buscas/relatorio.jsp';">Relatórios</button>
            <button onclick="window.location.href='buscas/todas-pesquisas.jsp';">Todas as Pesquisas</button>
        </div>
    </div>
</body>
</html>
