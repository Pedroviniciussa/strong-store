<%-- 
    Document   : candidato
    Created on : 24 de nov. de 2024, 23:09:16
    Author     : arauj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Candidato"%>
<%@page import="model.dao.CandidatoDAO"%>
<!DOCTYPE html>

<%
    // Inicialização de variáveis
    String nomeCompleto = request.getParameter("name");
    String idadeStr = request.getParameter("idade");
    String email = request.getParameter("email");
    String p1Str = request.getParameter("pergunta1");
    String p2Str = request.getParameter("pergunta2");
    String p3Str = request.getParameter("pergunta3");
    String p4Str = request.getParameter("pergunta4");
    String p5Str = request.getParameter("pergunta5");
    String obs = request.getParameter("observacao");

    try {
        // Validação básica
        if (nomeCompleto == null || idadeStr == null || email == null || 
            p1Str == null || p2Str == null || p3Str == null || 
            p4Str == null || p5Str == null) {
            throw new IllegalArgumentException("Todos os campos são obrigatórios!");
        }

        // Conversão de dados
        int idade = Integer.parseInt(idadeStr);
        int p1 = "excelente".equalsIgnoreCase(p1Str) ? 5 : 
                 "bom".equalsIgnoreCase(p1Str) ? 4 : 
                 "regular".equalsIgnoreCase(p1Str) ? 3 : 
                 "ruim".equalsIgnoreCase(p1Str) ? 2 : 1;

        int p2 = "excelente".equalsIgnoreCase(p2Str) ? 5 : 
                 "bom".equalsIgnoreCase(p2Str) ? 4 : 
                 "regular".equalsIgnoreCase(p2Str) ? 3 : 
                 "ruim".equalsIgnoreCase(p2Str) ? 2 : 1;

        int p3 = "sim".equalsIgnoreCase(p3Str) ? 5 : 1;

        int p4 = "excelente".equalsIgnoreCase(p4Str) ? 5 : 
                 "bom".equalsIgnoreCase(p4Str) ? 4 : 
                 "regular".equalsIgnoreCase(p4Str) ? 3 : 
                 "ruim".equalsIgnoreCase(p4Str) ? 2 : 1;

        int p5 = "excelente".equalsIgnoreCase(p5Str) ? 5 : 
                 "bom".equalsIgnoreCase(p5Str) ? 4 : 
                 "regular".equalsIgnoreCase(p5Str) ? 3 : 
                 "ruim".equalsIgnoreCase(p5Str) ? 2 : 1;

        // Criação do objeto Candidato
        Candidato candidato = new Candidato(0, nomeCompleto, idade, email, p1, p2, p3, true, p5, obs);

        // Inserção no banco de dados
        CandidatoDAO dao = new CandidatoDAO();
        dao.criarPesq(candidato);

        // Resposta para o usuário
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Pesquisa Enviada</title>");
        out.println("<link rel='../stylesheet' href='styles.css'>");  // Inclusão do CSS
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container'>"); // Exemplo de classe de estilo
        out.println("<h1>Obrigado por responder à pesquisa!</h1>");
        out.println("<a href='../index.html' class='btn'>Voltar para a página inicial</a>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");

    } catch (Exception e) {
        // Tratamento de erros
        e.printStackTrace();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Erro</title>");
        out.println("<link rel='../stylesheet' href='styles.css'>");  // Inclusão do CSS
        out.println("</head>");
        out.println("<body>");
        out.println("<div class='container error'>"); // Classe de erro
        out.println("<h1>Erro ao processar os dados: " + e.getMessage() + "</h1>");
        out.println("<a href='../index.html' class='btn'>Voltar</a>");
        out.println("</div>");
        out.println("</body>");
        out.println("</html>");
    }
%>
