/*
Façam em Assembly um algoritmo que percorre e imprime os valores de uma matriz de ordem n, sendo n fornecido pelo usuario.
*/

#include <iostream>
#include <fstream>
using namespace std;
int main() {
	int n;
	cout << "Insira um valor para a ordem da matriz quadrada: ";
	cin >> n;

	// criar
	int** m = new int* [n];
	for (int i = 0; i < n; i++) {
		m[i] = new int[n];
	}

	// popular
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			m[i][j] = 1;
		}
	}

	// imprimir
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++){
			cout << " - Coluna "<< j << ":" << m[i][j] << endl;
		}
		cout << "Linha "<< i << ": ";
	}

	// deletar
	for (int i = 0; i < n; i++) {
		delete[] m[i];
	}
	delete[] m;
	return 0;
}