#include <stdbool.h>
#include <stdio.h>

bool iter = true;

bool mod4(int x){
    if (x % 4 == 0){
        printf("La primera condicion se cumple para %d! (%d mod 4 = 0)\n", x,x);
        return true;
    } else if (x % 4 != 0) {
        return false;
    }
}

void cond2(int x){
    int y = -x;
    int z = 0;
    while (y - x  != (-1)* z){
        z= z+1;
    }

    printf("La segunda condicion se cumple para x = %d, y = %d y z= %d \n", x,y,z); 
}

bool f1(int x) {
    if (mod4(x) == true){
        cond2(x);
        return true;
    } else {
        return false;
    }
}

void f1principal(){
    printf("Esta funcion chequea la primera y segunda condicion del lab2 del practico 3\n \n");
    int it = 0;
    int vals = 1;
    while (it < 3){
        if (f1(vals) == true){
            it = it+1;
        }
        vals = vals + 1;
    }
}

bool f2principal() {

    int err = 0;
    if (err == 3){
        printf("Maximo de errores alcanzados");
        return false;
    }

    printf("Ingrese 0 para False o 1 para True:\n");
    int b = 0;
    scanf("%d",&b);
    int w = 1;
    scanf("%d",&w);

    if (((b == 0) || (b == 1)) && ((w == 0) || (w == 1))){
        if (!(b && w) == true){
            printf("El resultado es True!");
            return true;
        } else {
            printf("El resultado es False!");
            return false;
        }  
    } else {
        printf("Se ingresaron datos equivocados! \n \n");
        err = err+1;
        f2principal();
    }
    
}

int main(void){
    f1principal();
    printf("Esta funcion chequea la tercera condicion del lab2 del practico 3\n Advertencia: Solo esta hecha para chequear booleanos \n \n");
    f2principal();
    return 0;
}

/* -not (3 -and 4)
    False */
