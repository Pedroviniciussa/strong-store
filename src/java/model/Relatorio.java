/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author arauj
 */
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
