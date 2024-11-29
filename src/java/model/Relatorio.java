package model;
public class Relatorio {
    private int totalPesquisas;
    private double nivelSatisfacao;

    public Relatorio(int totalPesquisas, double nivelSatisfacao) {
        this.totalPesquisas = totalPesquisas;
        this.nivelSatisfacao = nivelSatisfacao;
    }

    public int getTotalPesquisas() {
        return totalPesquisas;
    }

    public double getNivelSatisfacao() {
        return nivelSatisfacao;
    }
}
