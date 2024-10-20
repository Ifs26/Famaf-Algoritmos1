#include <stdio.h>
#include <assert.h>

int pedint(){
    int entero = 0;
    printf("Ingrese valor:");
    scanf("%d",&entero);
    return entero;
}

int suma_hasta(int n){
    assert(n >= 1);
    int i = 1;
    int res = 0;
    while (i <= n){
        res = res + i;
        assert(res >= 1);
        i = i+1;
    }
    return res;
}

int main(){
    printf("%d",suma_hasta(pedint()));
    return 0;
}