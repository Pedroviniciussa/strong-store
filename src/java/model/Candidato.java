package model;

public class Candidato {
    private int id;
    private String nomeCompleto;
    private int idade;
    private String email;
    private int p1;
    private int p2;
    private int p3;
    private boolean p4;
    private int p5;
    private String obs;

    // Construtor padrão
    public Candidato() {}

    // Construtor com parâmetros
    public Candidato(int id, String nomeCompleto, int idade, String email, int p1, int p2, int p3, boolean p4, int p5, String obs) {
        this.id = id;
        this.nomeCompleto = nomeCompleto;
        this.idade = idade;
        this.email = email;
        this.p1 = p1;
        this.p2 = p2;
        this.p3 = p3;
        this.p4 = p4;
        this.p5 = p5;
        this.obs = obs;
    }

    // Getters e Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getP1() {
        return p1;
    }

    public void setP1(int p1) {
        this.p1 = p1;
    }

    public int getP2() {
        return p2;
    }

    public void setP2(int p2) {
        this.p2 = p2;
    }

    public int getP3() {
        return p3;
    }

    public void setP3(int p3) {
        this.p3 = p3;
    }

    public boolean isP4() {
        return p4;
    }

    public void setP4(boolean p4) {
        this.p4 = p4;
    }

    public int getP5() {
        return p5;
    }

    public void setP5(int p5) {
        this.p5 = p5;
    }

    public String getObs() {
        return obs;
    }

    public void setObs(String obs) {
        this.obs = obs;
    }
}
