#include <stdio.h>

void lab1(int x, int y, int z){
    z = x;
    x = y;
    y = z;
}

int f1(int x,int y){
    x= x+1;
    y = x+y;
    return y;
}

void f2(int x, int y, int z){

    int aux_x = x;
    int aux_y = y;

    x = y;
    y = y + aux_x + z;
    z = aux_x + aux_y;
}

int main(void){
    printf("%d",f1(2,3));
    return 0;
}