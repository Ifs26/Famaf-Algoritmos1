#include <stdio.h>
#include <assert.h>

int pedint(){
    int entero = 0;
    printf("Ingrese valor:");
    scanf("%d",&entero);
    return entero;
}

void intercambiar(int tam, int a[], int i, int j){
    assert((i < tam) && (j < tam));
    int aux = a[i];
    a[i] = a[j];
    a[j] = aux;
}

int main(void){

    int tam;
    printf("Ingrese cantidad de elementos del arreglo (n>=2): ");
    scanf("%d",&tam);
    assert(tam >= 1);

    printf("\n\nA continuacion se ingresara los elementos del arreglo");
    int a[tam];

    int it = 0;
    while (it < tam){
        printf("\n Elemento nº %d del arreglo: ",it);
        scanf("%d",&a[it]);
        it = it+1;
    }

    int i;
    int j;
    printf("\n\nIngrese ubicacion del primer elemento a intercambiar: ");
    scanf("%d",&i);
    printf("\nIngrese ubicacion del segundo elemento a intercambiar: ");
    scanf("%d",&j);
    assert(i >= 0 || j >= 0);

    intercambiar(tam,a,i,j);
    printf("El nuevo arreglo es: [");
    it = 0;
    while (it < tam){
        printf("%d",a[it]);
        if (it == tam-1){
            printf("]");
        } else {
            printf(",");
        }
        
        it = it+1;
    }

    return 0;
}