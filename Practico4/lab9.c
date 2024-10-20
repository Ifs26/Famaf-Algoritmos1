#include <stdio.h>
#include <assert.h>

struct div_t{
    int cociente;
    int resto;
};

struct div_t division(int x, int y){
    assert(x>=0 && y>=0);
    //assert(y >= x);
    
    struct div_t res;
    res.cociente = 0;
    res.resto = x;

    while (y*res.cociente < x){
        res.cociente = res.cociente + 1;
        res.resto = x - y*res.cociente;
    }
    return res;
}

void imprimediv(struct div_t d){
    printf("El cociente de la cuenta es %d y el resto %d", d.cociente, d.resto);
}

int main(void){

    int dividendo = 0;
    printf("Ingrese dividendo: ");
    scanf("%d",&dividendo);
    int divisor = 0;
    printf("Ingrese divisor: ");
    scanf("%d",&divisor);

    imprimediv(division(dividendo,divisor));

    return 0;
}