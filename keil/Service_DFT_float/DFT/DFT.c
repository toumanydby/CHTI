
extern float TabCos[64];
extern float TabSin[64];
float sommeCos, sommeSin; 



float DFT(float * signal, int k){
	sommeCos = 0.;
	sommeSin = 0.;	
	
	for(int i=0;i<64;i++){
		sommeCos+=signal[i]*TabCos[(k*i)%64];
		sommeSin+=signal[i]*TabSin[(k*i)%64];
	}
	return sommeCos*sommeCos+sommeSin*sommeSin;
}
