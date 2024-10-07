#include <stdbool.h>
#include <stdio.h>

bool iter = true;

bool mod4(int x){
    if (x % 4 == 0){
        return true;
    } else if (x % 4 != 0) {
        return false;
    }
}

int main(void){
    if (mod4(4)==true){
        printf("True!");
    }


    return 0;
}
