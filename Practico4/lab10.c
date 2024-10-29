#include <stdio.h>
#include <stdbool.h>

bool todos_pares(int tam, int a[]){

    int it = 0;
    while (it < tam){
        if (a[it]%2 != 0){
            return false; 
        } else {

        }
        it = it+1;
    }
    return true;
}

bool existe_multiplo(int m, int tam, int a[]){

    int it = 0;
    while (it < tam){
        if (a[it]/m == 0){
            return true;
        }
        it = it+1;
    }
    return false;
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

    
    int opc;
    while (opc != 3){
        printf("--------------------------------\n¿Que funcion desea ejecutar?\n(1)todos_pares\n(2)existe_multiplo\n(3)Salir\nIngrese numero de funcion: ");
        scanf("%d",&opc);

        if (opc == 1){
            int res = todos_pares(tam, a);
            if (res == true){
                printf("\n¡Todos los elementos son pares!\n\n");
            } else {
                printf("\nExiste al menos un elemento impar! No todos los elementos son pares!\n\n");
            }
        } else if (opc == 2){
            int m;
            printf("\nIngrese el numero a verificar si hay multiplos: ");
            scanf("%d",&m);
            int res = existe_multiplo(m,tam,a);
            if (res == true){
                printf("\nExiste un multiplo de %d!\n\n", m);
            } else {
                printf("\nNo existe un multiplo de %d!\n\n", m);
            }
        }
    }

    return 0;
}
