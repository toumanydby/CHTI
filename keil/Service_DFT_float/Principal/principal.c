

#include "DriverJeuLaser.h"
#include "ServiceJeuLaser.h"
#include "../GestionSon/GestionSon.h"
#include "../DFT/DFT.h"

extern int PeriodeSonMicroSec;
extern float LeSignal[64];
float res;

float resTab[64];

int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

/* Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers */
CLOCK_Configure();

	
res= DFT(LeSignal,2);

/* Configuration du son (voir ServiceJeuLaser.h) 
 Insérez votre code d'initialisation des parties matérielles gérant le son ....*/	

float sigCarre[64]; 

//for (int i = 0; i < 64; i++){
//	sigCarre[i] = LeSignal[i] / 2 ;
//}

//for(int i = 0; i < 64; i++){
//	resTab[i]= DFT(sigCarre,i);
//}

//============================================================================	
	
	
while	(1){
			
	}
}




