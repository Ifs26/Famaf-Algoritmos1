#include <stdio.h>        /* inclusiÃ³n biblioteca estandar */

/**/
int main(void)            /* devuelve un int, sin argumentos */ 
 {
    printf("Hello World!\n");

    return 0;             /* resultado de la funciÃ³n */
 }

 /*  
 
 RECORDAR:

 1. Para crear un ejecutable debo ir a Terminal -> Configure Task -> Elegir el que uso 
                                        Terminal -> Run build task -> EJECUTABLE GENERADO!
 
 2. Para ejecutar un archivo en la consola debo utilizar 
        ./ pegado al nombre del archivo ejecutable (exe)

 3. No me anda el debug asjdasd, SOLUCIONADO borrando una extension innecesaria!
 
  */

/*

 int main(void)            
 {
	int x, y;
	printf("Ingrese un valor para x\n"); 
	scanf("%d", &x); 
	printf("Ingrese un valor para y\n"); 
	scanf("%d", &y); 
	
	printf("Usted ingreso x=%d, y=%d; entonces x*y=%d\n",x,y,x*y); 


       return 0;
}

*/