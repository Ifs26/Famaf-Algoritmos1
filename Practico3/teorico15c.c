#include <stdio.h>

int main(void){
    int x;
    int y;
    printf ("Ingrese valor para x: ");
    scanf("%d",&x);
    printf ("Ingrese valor para y: ");
    scanf("%d",&y);
    int aux = x;
    x = y*y;
    y = aux*aux;
    printf("valores luego de la primera segmentacion:\n");
    printf("%d \n",x);
    printf("%d",y);

    if (x>=y){
        x = x-y;
    } else if (x<=y){
        y = y-x;
    }

    printf("\nvalores luego de la segunda segmentacion:\n");
    printf("%d \n",x);
    printf("%d",y);

    return 0;
}