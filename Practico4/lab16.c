#include <stdio.h>
#include <assert.h>
#include <stdbool.h>
#include <math.h>

bool esPrimo(int n){
    int it = 2;
    int maximo = pow(n,0.5);
    //printf("%d",maximo);
    while (it <= maximo){
        if (n%it == 0){
            return false;
        }
        it = it+1;
    }
    return true;
}
int n_esimoPrimo(int n){
    assert(n>=0); //main ajustado para que eso nunca pase
    int primos[n-1];
    int lugaresListos = 0;

    int lugar = 0;
    int nTC = 1;
    while (lugaresListos < n){
        if (esPrimo(nTC)){
            primos[lugar]=nTC;
            lugar = lugar+1;
            lugaresListos = lugaresListos+1;
        }
        nTC = nTC +1;
    }
    return primos[n-1];
}

int main(void){

    int n=-1;
    while (n < 0){
        printf("Ingrese valor positivo a analizar:");
        scanf("%d",&n);
    }

    int res = n_esimoPrimo(n);
    printf("El %d-esimo numero primo es %d!",n,res);
    
    return 0;
}