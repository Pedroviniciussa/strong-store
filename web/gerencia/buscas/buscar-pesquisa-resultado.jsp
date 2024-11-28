<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Candidato"%>
<%@page import="model.dao.CandidatoDAO"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Pesquisa Encontrada</title>
        <link rel="stylesheet" href="../../styles.css">
        <script>
            function confirmarExclusao(id) {
                if (confirm("Tem certeza de que deseja excluir esta pesquisa?")) {
                    window.location.href = "deletar-pesquisa.jsp?id=" + id;
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <h1>Pesquisa Encontrada</h1>

            <%
                String idPesquisaStr = request.getParameter("id-pesquisa");

                if (idPesquisaStr != null && !idPesquisaStr.isEmpty()) {
                    int idPesquisa = Integer.parseInt(idPesquisaStr);

                    CandidatoDAO dao = new CandidatoDAO();
                    Candidato candidato = dao.localizaPesq(idPesquisa);

                    if (candidato != null) {
            %>

            <!-- Exibindo os dados da pesquisa encontrada -->
            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>ID da Pesquisa</th>
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
                        <tr>
                            <td><%= candidato.getId()%></td>
                            <td><%= candidato.getNomeCompleto()%></td>
                            <td><%= candidato.getIdade()%> anos</td>
                            <td><%= candidato.getEmail()%></td>
                            <td><%= candidato.getP1()%></td>
                            <td><%= candidato.getP2()%></td>
                            <td><%= candidato.getP3() == 5 ? "Sim" : "Não"%></td>
                            <td><%= candidato.isP4() ? "Sim" : "Não"%></td> <!-- Conversão do booleano -->
                            <td><%= candidato.getP5()%></td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Botões de Ação -->
            <div class="button-group">
                <button class="delete-btn" onclick="confirmarExclusao(<%= candidato.getId()%>)">Excluir</button>
                <button class="edit-btn" onclick="window.location.href = 'editar.html';">Editar</button>
            </div>

            <%
            } else {
            %>

            <p>A pesquisa com o ID <%= idPesquisa%> não foi encontrada.</p>
            <div class="button-group">
                <button onclick="window.location.href = 'processa-pesquisa-edit.html';">Voltar a busca</button> 
            </div>

            <%
                }
            } else {
            %>

            <p>Por favor, insira um ID válido.</p>

            <%
                }
            %>

        </div>
    </body>
</html>