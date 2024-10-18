#include <stdio.h>

int pedint(){
    int entero = 0;
    printf("Ingrese valor:");
    scanf("%d",&entero);
    return entero;
}

void f6(int m,int z, int y,int x){
    printf("Se eligio x = %d, y = %d, z = %d e m = %d\n", x,y,z,m);
    if (x < y){
        m = x;
    } else if (x >= y) {
        m = y;
    }
    printf("Los resultados intermedios son x = %d, y = %d, z = %d e m = %d\n", x,y,z,m);
    if (m < z){
        
    } else if (m >= z){
        m = z;
    }
    printf("Los resultados finales son x = %d, y = %d, z = %d e m = %d\n", x,y,z,m);
}

int main(void){
    f6(pedint(),pedint(),pedint(),pedint());
    return 0;
}