#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

int pedint(){
    int entero = 0;
    printf("Ingrese valor:");
    scanf("%d",&entero);
    return entero;
}

// "Calcula el minimo entre dos variables enteras x e y"
int f1(int x, int y){
    assert(true); //Primero puse x>=y || x < y
    int res;
    if (x >= y){
        res = y;
    } else if (x < y){
        res = x;
    }
    assert(res == x || res == y);
    return res;
}

//"Calcula el valor absoluto de un numero entero"
int f2(int x){
    assert(true); //primero puse (x >= 0 || x < 0)
    int res;
    if (x >= 0){
        res = x;
    } else if (x < 0){
        res = -x;
    }
    assert(res >= 0);
    return res;
}

int main(){
    //printf("%d",f1(pedint(),pedint()));
    printf("%d",f2(pedint()));
    return 0;
}