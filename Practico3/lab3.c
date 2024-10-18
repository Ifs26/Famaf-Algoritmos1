#include <stdio.h>
#include <stdbool.h>

int pedirn(){
    int x = 0;
    printf("Ingrese un valor:");
    scanf("%d",&x);
    return x;
}

int fa(int x){
    x = 5;
    printf("%d\n",x);
    return x;
}

int f21CHEQUEAR (int x, int y){
    printf("Se seleeciono como x: %d\n", x);
    printf("Se seleeciono como y: %d\n", y);

    x = x+x;
    y = y+y;
    return 0;
}

void fb(int y, int x){
    printf("Se seleeciono como x: %d\n", x);
    printf("Se seleeciono como y: %d\n", y);

    x = x+x;
    y = y+y;
    
    printf("Luego x sera igual a %d e y sera igual a %d\n", x,y);
}

void fc(int y, int x){
    printf("Se seleeciono como x: %d\n", x);
    printf("Se seleeciono como y: %d\n", y);

    y = y+y;
    x = x+y;
    
    printf("Luego x sera igual a %d e y sera igual a %d\n", x,y);
}

int main(void){

    bool on = true;
    while (on == true){
        printf("Seleccione una funcion 1(a),2(b) o 3(c) o ejecute error para salir: ");

        int ejer = 0;
        scanf("%d",&ejer);

        if (ejer == 1) {
            fa(pedirn());
        } else if (ejer == 2) {
            fb(pedirn(),pedirn());
        } else if (ejer == 3) {
            fc(pedirn(),pedirn());
        } else {
            on = false;
        }
    }
    return 0;
    

}