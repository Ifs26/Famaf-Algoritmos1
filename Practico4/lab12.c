#include <stdio.h>
#define N 5

typedef struct {
    int largo;
    int a[N];
} largo_lista;


largo_lista primIguales(int tam, int a[]){

    largo_lista lar_lis;
    lar_lis.largo = 1;
    

    int cheq = a[0];
    int it = 1;
    //int largo = 1;

    while (it < tam){
        if (a[it] == cheq){
            lar_lis.largo = lar_lis.largo+1;
        }
        it = it+1;
    }

    it = 0;
    //lar_lis.a[lar_lis.largo];
    while (it < lar_lis.largo){
        lar_lis.a[it] = a[0];
        it = it+1;
    }

    return lar_lis;
}

int main(void){

    int a[N];
    printf("\nA continuacion ingrese valores del array\n");
    int it = 0;
    while (it < N){
        printf("Ingrese valor n %d del array: ", it);
        int temp;
        scanf("%d",&temp);
        a[it] = temp;
        it = it+1;
    }

    largo_lista ress = primIguales(N,a);

    printf("El largo del tramo incial cuyo elementos son todos iguales es %d y la el tramo es [", ress.largo);
    it = 0;
    while (it < ress.largo){
        if (it == ress.largo-1){
            printf("%d]",ress.a[it]);
        } else {
            printf("%d,",ress.a[it]);
        }
        
        it = it+1;
    }
    return 0;
}