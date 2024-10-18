#include <stdio.h>

int pedirInt(char name){
    printf("Ingrese un entero: ");
    int e;
    scanf("%d",&e);
    printf("El entero se guardara en una variable llamada '%c' \n\n", name);
    return e;
}

void imprimirInt(char name, int x){
    printf("El valor de la variable llamada '%c' que se ha de imprimir es: %d", name, x);
}

int main(){

    char name = 'n';
    printf("Ingrese el nombre particular que desea asignarle a la variable (ya definida) a trabajar: ");
    scanf("%c",&name);
    printf("\n");
    int num = pedirInt(name);
    imprimirInt(name,num);
    return 0;
}