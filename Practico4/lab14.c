#include <stdio.h>
#include <limits.h>
#include <assert.h>

typedef struct 
{
    float maximo;
    float minimo;
    float promedio;
} datos_t;

datos_t stats(int tam, float a[]){
    assert(tam != 0 && a != NULL);

    float max = a[0];
    float min = a[0];
    float prom = 0;

    int it =0;
    while (it < tam){
        if (a[it] > max){
            max = a[it];
        }
        if (a[it] < min){
            min = a[it];
        }
        prom = prom + a[it];
        it = it+1;
    }

    prom = prom/tam;
    datos_t res;
    res.maximo = max;
    res.minimo = min;
    res.promedio = prom;

    return res;
}

int main(void){
    
    int tam;
    printf("Ingrese tamaño de array: ");
    scanf("%d",&tam);

    float a[tam];

    printf("\nA continuacion ingrese valores del array\n");
    int it = 0;
    while (it < tam){
        printf("Ingrese valor n %d del array: ", it);
        float temp;
        scanf("%f",&temp);
        a[it] = temp;
        it = it+1;
    }

    datos_t res = stats(tam, a);
    printf("\nMinimo = %f", res.minimo);
    printf("\nMaximo = %f",res.maximo);
    printf("\nPromedio = %f",res.promedio);
    return 0;
}