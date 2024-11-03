#include <stdio.h>
#include <assert.h>

int pedint(){
    int entero = 0;
    printf("Ingrese cantidad de elementos para el array (¡No puede ser lista vacia!): ");
    scanf("%d",&entero);
    return entero;
}

void pedir_arreglo(int n_max, int a[]){

    //printf("Ingrese cantidad de elementos del arreglo (n>=0): ");
    //scanf("%d",&n_max);
    assert(n_max >= 1);

    if (n_max == 1){
        printf("\nIngrese elemento unico de la array: ");
        scanf("%d",&a[0]);
    } else if (n_max > 1){
        printf("\nIngrese elementos de la array\n--------------");
        int it = 0;
        while (it < n_max){
            printf("\nElemento %d del arreglo: ",it);
            scanf("%d",&a[it]);
            it = it + 1;
        }
    }
}

void imprimir_arreglo(int n_max, int a[]){
    assert(n_max >0);
    int it = 0;
    printf("[");
    while (it < n_max){
        printf("%d",a[it]);
        if (it != n_max-1){
            printf(","); 
        }
        it = it+1;  
    }
    printf("]");
}

int main(){

    int n_tam = pedint();
    int a[n_tam];

    pedir_arreglo(n_tam,a);
    imprimir_arreglo(n_tam,a);

    return 0;
}