#include <stdio.h>
#include <assert.h>

int sumatoria(int tam, int a[]){
    int it = 0;
    int res = 0;
    while (it < tam){
        res = res + a[it];
        it = it+1;
    }
    return res;
}

int pedint(){
    int i = 0;
    printf("Ingrese entero para largo array: ");
    scanf("%d",&i);
    assert(i>=0);
    return i;
}

void pedir_arr(int tam, int a[]){
    int u = 0;
    while (u<tam){
        printf("Ingrese valor para ubicacion %d: ", u);
        scanf("%d",&a[u]);
        u = u+1;
    }
}

int main(){
    int tam = pedint();
    int a[tam];
    pedir_arr(tam,a);
    printf("\nLa sumatoria es igual a %d", sumatoria(tam,a));
    return 0;
}