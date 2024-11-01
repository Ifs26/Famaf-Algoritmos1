#include <stdio.h>
#include <assert.h>
#include <stdbool.h>

typedef char clave_t;
typedef int valor_t;

struct asoc {
    clave_t clave;
    valor_t valor;
};

bool existe_asoc (int tam, struct asoc a[], clave_t c){
    assert(tam > 0);
    assert(a != NULL);

    int it = 0;
    while (it < tam){
        if (a[it].clave == c){
            return true;
        }
        it= it+1;
    }
    return false;
}


int main(void){

    int tam;
    printf("Ingrese largo de array: ");
    scanf("%d",&tam);

    struct asoc a[tam];
    int it = 0;
    while (it < tam){
        char cl;
        printf("Ingrese nombre de clave numero %d: ", it);
        scanf(" %c",&cl);
        a[it].clave = cl;

        int val;
        printf("Ingrese valor numero %d: ", it);
        scanf("%d",&val);
        a[it].valor = val;

        it = it+1;
    }

    char c;
    printf("\n\nIngrese valor a buscar en las claves: ");
    scanf(" %c",&c);
    // Cuando usas scanf("%c", &cl); para leer un carácter, 
    // es posible que se lea un carácter de nueva línea (\n) 
    // que queda en el buffer de entrada después de la lectura 
    // anterior (cuando se lee el tamaño del array). Esto puede 
    // causar que el primer carácter leído sea inesperado.

    if (existe_asoc(tam,a,c)){
        printf("\n¡La clave existe!");
    } else{
        printf("\n¡La clave no existe!");
    }
    return 0;
}