#include <stdio.h>

typedef struct {
    int menores;
    int iguales;
    int mayores;
} comp_t;


comp_t cuantos(int tam, int a[], int elem){
    comp_t res;
    res.menores = 0;
    res.iguales = 0;
    res.mayores = 0;

    int it = 0;
    while (it < tam){
        if (a[it]< elem){
            res.menores = res.menores+1;
        } else if (a[it] == elem){
            res.iguales = res.iguales+1;
        } else if (a[it]> elem){
            res.mayores = res.mayores+1;
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

    int elem;
    printf("\nIngrese elemento para comparar: ");
    scanf("%d",&elem);

    comp_t res = cuantos(tam,a,elem);
    
    printf("\nLa cantidad de elementos menores a %d es igual a: %d ",elem,res.menores);
    printf("\nLa cantidad de elementos iguales a %d es igual a: %d ",elem,res.iguales);
    printf("\nLa cantidad de elementos mayores a %d es igual a: %d\n ",elem,res.mayores);
    return 0;
}