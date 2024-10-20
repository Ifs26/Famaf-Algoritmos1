#include <stdio.h>
#include <stdbool.h>

int pedirchar(){
    char letra;
    printf("Ingrese letra: ");
    scanf("%c",&letra);
    return letra;
}

int pedint(){
    int entero = 0;
    printf("Ingrese valor:");
    scanf("%d",&entero);
    return entero;
}

bool es_vocal(char letra){
    char vocales[] = {'a','e','i','o','u'};
    int i = 0;
    while (i < 5){
        if (letra == vocales[i]){
            return true;
        }
        i = i + 1;
    }

    return false;
}

int main(){
    printf("%d",es_vocal(pedirchar()));
    return 0;
}