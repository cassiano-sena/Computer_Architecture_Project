/*
* Disciplina: Organiza��o de Computadores
* Atividade : Avalia��o 02
*
* Grupo:
* - Cassiano de Sena Crispim
* - H�rick Vitor Vieira Bittencourt
* - Eduardo Miguel Fuchs Perez
*
* OBSERVA��O:
* - Devido o uso de for loops com l�gica [key, value], o padr�o ISO para
* este projeto deve ser o C++ 17, caso contr�rio a build ir� falhar
* (v� na aba projeto->propriedades de main no visual studio 2019)
*/

#ifndef CALCULOS_H
#define CALCULOS_H

#include <iostream>
#include <fstream>

using namespace std;

// Calculos feitos a partir da tabela de formulas disponivel no AVA

double gerarDesempenho(float tempoExecucao) {
	return 1.0 / tempoExecucao;
}

// Tempo de execu��o da CPU por tempo de clock
// Formula = QuantInstrucoes * CPI * TempoClock
// OBS: CiclosCPU = QuantInstrucoes * CPI
float TExecCPUPorTempoClock(int quantInstrucoes, float CPI, float tempoClock) {
	return quantInstrucoes * CPI * tempoClock;
}

// Ciclos-Por-Instru��o
// Formula = (5 [primeira instru��o] + (1 * (quantInstrucoes-1) [1 clock p/ instru��es seguintes])) / quantInstrucoes
float gerarCPI(float ciclosCPU, int quantInstrucoes) {
	return (5.0 + (1 * (quantInstrucoes-1))) / quantInstrucoes;
}

#endif // CALCULOS_H