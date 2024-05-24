#include "CosSin_Fract_1_15.h"

int sommeCos, sommeSin; 



unsigned int DFT_fract(unsigned short int * signal, int k){
	sommeCos = 0;
	sommeSin = 0;	
	
	// Sachant que le format fractionnaire pour le signal est de 4.12
	// celui du Cos ou Sin est de format 1.15.
	// Leur produit donnera un nombre au format fractionnaire 5.27
	// Donc sommeCos et sommeSin a lire au format 5.27
	// Et le resultat final ( return ) sera a lire au format 10.54
	// Donc sur bien 64 bits
	
	for(int i=0;i<64;i++){
		sommeCos+=( unsigned short int )signal[i]* (short int) TabCos[(k*i)%64];
		sommeSin+=( unsigned short int )signal[i]* (short int) TabSin[(k*i)%64];
	}
	
	int prodCos = sommeCos*sommeCos;
	int prodSin = sommeSin*sommeSin;
	
	return  prodSin + prodCos;
}
