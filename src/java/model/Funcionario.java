package model;

public class Funcionario {
    private int id;
    private String nome;
    private String nomeCompleto;
    private String senha;

    // Construtor padrão
    public Funcionario() {}

    // Construtor com parâmetros
    public Funcionario(int id, String nome, String nomeCompleto, String senha) {
        this.id = id;
        this.nome = nome;
        this.nomeCompleto = nomeCompleto;
        this.senha = senha;
    }

    // Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
