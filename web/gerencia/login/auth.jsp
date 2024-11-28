<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.dao.FuncionarioDAO"%>
<%@page import="model.Funcionario"%>
<%@page import="java.io.IOException"%>

<%
    // Recuperando os dados do formulário
    String usuario = request.getParameter("usuario");
    String senha = request.getParameter("senha");

    // Instância do DAO para validação
    FuncionarioDAO funcionarioDAO = new FuncionarioDAO();
    Funcionario funcionario = null;

    try {
        // Autenticação do funcionário
        funcionario = funcionarioDAO.auth(usuario, senha);

        if (funcionario != null) {
            // Login bem-sucedido: armazenando o funcionário na sessão e redirecionando
            session.setAttribute("funcionario", funcionario);
            response.sendRedirect("../gerencia.jsp"); // Página de gerenciamento após login
        } else {
            // Login falhou: exibindo mensagem de erro
            request.setAttribute("erro", "Usuário ou senha inválidos. Tente novamente.");
            request.getRequestDispatcher("login.html").forward(request, response); // Volta para a página de login
        }
    } catch (Exception e) {
        e.printStackTrace();
        // Redirecionando para página de erro em caso de exceção
        response.sendRedirect("../erro.jsp");
    }
%>
