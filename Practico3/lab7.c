#include <stdio.h>

int pedint(){
    int entero = 0;
    printf("Ingrese valor:");
    scanf("%d",&entero);
    return entero;
}

void f5a(){
    printf("Advertencia, ingresar un numero menor a 0 produce un bucle infinito\n");
    int i = pedint();
    while (i != 0)
    {
        printf("%d ",i);
        i = i-1;
    }   
}

void f5b(){
    int i = pedint();
    while (i != 0)
    {
        printf("%d \n",i);
        i = 0;
    }  
    printf("%d \n",i);
}

void f5c(){
    printf("Advertencia, ingresar un numero menor a 0 produce un bucle infinito\n");
    int i = pedint();
    while (i < 0)
    {
        printf("%d \n",i);
        i = i-1;
    }  
    printf("%d \n",i);
}

int main(void){
    f5c();
    return 0;
}