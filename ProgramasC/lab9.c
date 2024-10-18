#include <stdio.h>
#define N 4

void f1(){

    int a[N];
    int i = 0;
    int s = 0;

    int it = 0;
    printf("A continuacion se ingresan 4 valores para array \n\n");
    while (it < N){
        printf("Ingrese valor para ubicacion %d: ", it);
        scanf("%d",&(a[it]));

        //printf("Se agrego %d", a[it]);
        it = it+1;
        printf("\n");
    }
    // printf("La array final es %d",a);

    while (i<N){
        s = s + a[i];
        i = i+1;
    }

    printf("El resultado final es %d", s);

}

void f2(){

    int a[N];
    int i = 0;
    int c = 0;

    printf("A continuacion se ingresan 4 valores para array \n\n");
    while (i < N){
        printf("Ingrese valor para ubicacion %d: ", i);
        scanf("%d",&(a[i]));

        //printf("Se agrego %d", a[it]);
        i = i+1;
        printf("\n");
    }

    i = 0;
    while (i<N){
        if (a[i] > 0){
            c = c+1;
        } else if (a[i] <= 0){
          //skip, pero en version C  
        }
        i = i+1;
    }

    printf("El resultado final es %d", c);

}

int main(){
    f2();
    return 0;
}