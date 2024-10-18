#include <stdio.h>
#include <stdbool.h> /* biblioteca estÃ¡ndar de booleanos*/
/* CTRL +SHIFT +B COMPILA!*/

int pideEntero(void) {
            int x;
            x = 0;
            printf("Ingrese un valor: "); 
            scanf("%d", &x); 
            return x;
        }

int fun1(int x, int y){
    printf("Se eligio %d y %d", y,x); 
    /*Por algun motivo ubica los datos a partir del ultimo valor añadido*/
    printf(" y x+y+1 es igual a %d", (y+x+1));
    return 0;
}

int fun1_1 (int a){
    const char *variables[] = {"x", "y", "z"};
    int it = 0;
    int vals [3];
    while (it < a)
    {
        printf("Ingrese un valor para la variable %s: ", variables[it]);
        scanf("%d", &vals[it]);
        it = it+1;
    }
    /* Cuando usas &x, estás pasando la dirección de la variable x a scanf, 
    permitiendo que la función escriba el valor ingresado directamente en 
    esa ubicación de memoria */
            
    printf("Se eligió %d y %d", vals[0],vals[1]); 
    /*Por algun motivo ubica los datos a partir del ultimo valor añadido*/
    printf(", por ende (x + y + 1) será igual a %d", (vals[0]+vals[1]+1));
    /* 
        %s para cadenas de caracteres
        %d para enteros
        %c para chars
    */
    return 0;
}

void fun2(int z,int y,int x) { /* Por que hay que ponerlos al reves¿?*/
    printf("Se eligio x = %d, y = %d y z= %d", x,y,z);
    printf(" y (z*z+y*45-15*x) es igual a: %d", ((z*z)+(y*45)+(-15*x)));
}

void fun3(int y, int x){ /*ESTA MAL*/
    printf("Se eligio x = %d e y = %d",x,y);
    int res = (y-2 == ((x*3)+1)%5);
    if (res == 0) {
        printf(", por lo que (y-2 == (x*3+1)/5) es False");
    } else {
        printf(", por lo que (y-2 == (x*3+1)/5) es True");
    }
}

void fun4 (int y, int x){ /*POR QUE SE DECLARAN AL REVES???*/
    int valx = x;
    printf("Se eligio x = %d \n", valx);
    int valy = y;
    printf("Se eligio y = %d \n",valy);
    int res = (valy / (2*valx));
    printf("(y/(2*x)) es igual a: %d", res);
}

void fun5(int x, int y, int z){
    printf("Se eligio x = %d, y = %d y z = %d",z,y,x);
    bool tr = true;
    bool fs = false;
    int res = (y < (x*z));

    if (res == tr) {
        printf(", por lo que (y < (x*z)) es True");
    } else{
        printf(", por lo que (y < (x*z)) es False");
    }
}

int ejemplo1(void){
    int temp;   
    bool x = true; /* declaraciÃ³n de variables - true es una constante definida como 1*/
    bool y; /* declaraciÃ³n de variables*/

    /* AsignaciÃ³n de un booleano */
    y =  false;/* es una constante definida como 0 */

    /* Lectura */
    printf("ingrese un bool: 0 para false, 1 para true:\n");
    scanf("%d", &temp); /* en realidad pedimos un entero por teclado, no un booleano, usamos temp, ya que scanf no tiene definido un '%' para bool */

   x = temp; /* asignamos para que el valor quede en x */
   printf("x vale %d, y vale %d \n", x, y); /* en realidad imprimimos un entero, no un booleano, */
   
   return 0;
}

int main(void)
    {
        printf("Bienvenido! Este es un programa que contiene todas las funciones del lab1 del practico 3\n");
        bool log = true;
        while (log == true){
            int val;
            printf("\nSeleccione el numero de funcion [1,5] o ingrese ejecute un error para salir:");
            scanf("%d",&val);
            if (val == 1) {
                fun1(pideEntero(),pideEntero());
            } else if (val == 2) {
                fun2(pideEntero(),pideEntero(),pideEntero());
            } else if (val == 3) {
                fun3(pideEntero(),pideEntero());
            } else if (val == 4) {
                fun4(pideEntero(),pideEntero());
            } else if (val == 5) {
                fun5(pideEntero(),pideEntero(),pideEntero());
            } else {
                log = false;
            }
        }
        return 0;
    }   
