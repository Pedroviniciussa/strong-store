/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author arauj
 */
public class RelatorioPorIdade {
    private double satisfacaoMenor18;
    private double satisfacao18a30;
    private double satisfacaoAcima30;

    public RelatorioPorIdade(double satisfacaoMenor18, double satisfacao23a30, double satisfacaoAcima30) {
        this.satisfacaoMenor18 = satisfacaoMenor18;
        this.satisfacao18a30 = satisfacao23a30;
        this.satisfacaoAcima30 = satisfacaoAcima30;
    }

    // Getters
    public double getSatisfacaoMenor18() {
        return satisfacaoMenor18;
    }

    public double getSatisfacao18a23() {
        return satisfacao18a30;
    }

    public double getSatisfacaoAcima30() {
        return satisfacaoAcima30;
    }
}
