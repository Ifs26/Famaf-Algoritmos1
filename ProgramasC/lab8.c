#include <stdio.h>
#include <stdbool.h>

int pedint(){
    int entero = 0;
    printf("Ingrese valor:");
    scanf("%d",&entero);
    return entero;
}

void f8a(){

    int i = 0;
    int x = pedint();
    int y = pedint();
    printf("\nvalores originales -> x = %d, y = %d e i = %d\n",x,y,i);

    while (x >= i){
        printf("\n Iteracion numero %d ",i);
        x=x-y;
        i=i+1;
        printf("con valores finales x = %d, y = %d e i = %d", x,y,i);
    }
    printf("\n");
}

void f8b(){
    int i = 2;
    int x = pedint();
    bool res = true;
    res = pedint();
    while ((i < x) && res){
        res = res && ((x%i)!=0);
        i = i+1;
    }
    
}

int main(void){
    f8b();
    return 0;
}