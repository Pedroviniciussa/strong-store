<%-- 
    Document   : deletar-pesquisa
    Created on : 25 de nov. de 2024, 14:33:22
    Author     : arauj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.dao.CandidatoDAO"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Excluir Pesquisa</title>
    <link rel="stylesheet" href="../../styles.css">
</head>
<body>
    <div class="container">
        <%
            String idStr = request.getParameter("id");
            if (idStr != null && !idStr.isEmpty()) {
                int id = Integer.parseInt(idStr);
                CandidatoDAO dao = new CandidatoDAO();
                dao.deletar(id); // Método para excluir no DAO
        %>
        <p>Pesquisa excluída com sucesso!</p>
        <button onclick="window.location.href='busca-pesquisa.html';">Voltar à Busca</button>
        <%
            } else {
        %>
        <p>Erro ao excluir: ID inválido.</p>
        <button onclick="window.location.href='busca-pesquisa.html';">Voltar à Busca</button>
        <%
            }
        %>
    </div>
</body>
</html>
