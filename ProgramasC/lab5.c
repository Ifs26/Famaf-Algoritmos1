#include <stdio.h> /* STDndar Input Output */
// echo $? en la consola me dice que valor dio la ultima funcion que se ejecuto en la terminal

int pedint(){
    int entero = 0;
    printf("Ingrese valor:");
    scanf("%d",&entero);
    return entero;
}

int f3a(int y, int x){
    printf("Se eligio x = %d e y = %d\n", x,y);
    
    if (x >= y){
        x = 0;
    } else if (x<=y){
        x = 2;
    }
    printf("el valor de x es igual a: %d\n", x);
    return x;
}

int main(void){
    f3a(pedint(),pedint());
    return 0;
}