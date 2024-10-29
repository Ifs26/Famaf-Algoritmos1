#include <stdio.h>
#include <limits.h>

int minimo_pares(int tam, int a[]){
    int res = INT_MAX;
    int it = 0;
    
    while (it < tam){
        if (a[it]%2 == 0 && a[it]<res){
            res = a[it];
        }
        it = it+1;
    }

    
    return res;
}

int minimo_impares(int tam, int a[]){
    int res = INT_MAX;
    int it = 0;
    
    while (it < tam){
        if ((a[it]%2 > 0) && a[it]<res){
            res = a[it];
        }
        it = it+1;
    }
    return res;
}

int main(void){

    int tam;
    printf("Ingrese tamaño de array: ");
    scanf("%d",&tam);

    int a[tam];

    printf("\nA continuacion ingrese valores del array\n");
    int it = 0;
    while (it < tam){
        printf("Ingrese valor n %d del array: ", it);
        int temp;
        scanf("%d",&temp);
        a[it] = temp;
        it = it+1;
    }

    int min_par = minimo_pares(tam, a);
    int min_impar = minimo_impares(tam, a);
    printf("\nEl menor numero par es %d", min_par);
    printf("\nEl menor numero impar es %d", min_impar);

    int min_total = min_par;
    if (min_impar < min_par){
        min_total = min_impar;
    }
    printf("\nEl menor numero de todos es %d\n", min_total);

    return 0;
}