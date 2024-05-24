

#include "DriverJeuLaser.h"
#include "ServiceJeuLaser.h"
#include "../DFT_Frac/DFT_frac.h"
#include "../DFT_Frac/Signal_4_12.h"


long int res;

long int resTab[64];

int main(void)
{

// ===========================================================================
// ============= INIT PERIPH (faites qu'une seule fois)  =====================
// ===========================================================================

/* Après exécution : le coeur CPU est clocké à 72MHz ainsi que tous les timers */
CLOCK_Configure();

	

/* Configuration du son (voir ServiceJeuLaser.h) 
 Insérez votre code d'initialisation des parties matérielles gérant le son ....*/	

	
for(int i = 0; i < 64; i++){
	resTab[i]= DFT_fract(LeSignal,i);
}

//============================================================================	
	
	
while	(1){
			
	}
}




