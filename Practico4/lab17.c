#include <stdio.h>
#include <assert.h>

typedef struct _persona {
    char *nombre;
    int edad;
    float altura;
    float peso;
} persona_t;

// El tipo de dato unsigned int en C se utiliza
// para representar números enteros no negativos!

float peso_promedio(unsigned int longitud, persona_t arr[]){
    unsigned int it = 0;
    float res = 0;
    while (it < longitud){
        res= res + arr[it].peso;
        it= it+1;
    }
    return (res/longitud);

}
persona_t persona_de_mayor_edad(unsigned int longitud, persona_t arr[]){
    unsigned int it = 1;
    persona_t res = arr[0];
    while (it <longitud){
        if (arr[it].edad > res.edad){
            res = arr[it];
        }
        it = it+1;
    }
    return res;
}
persona_t persona_de_menor_altura(unsigned int longitud, persona_t arr[]){
    unsigned int it = 1;
    //int res = arr[0].edad;
    persona_t res = arr[0];
    while (it <longitud){
        if (arr[it].altura < res.altura){
            res = arr[it];
        }
        it = it+1;
    }
    return res;


}

int main(void) {
    persona_t p1 = {.nombre="Paola", .edad=21, .altura=1.85, .peso=75};
    persona_t p2 = {.nombre="Luis", .edad=54, .altura=1.75, .peso=69};
    persona_t p3 = {.nombre="Julio", .edad=40, .altura=1.70, .peso=80};
    unsigned int longitud = 3;
    persona_t arr[] = {p1, p2, p3};
    printf("El peso promedio es %f\n", peso_promedio(longitud, arr));
    persona_t p = persona_de_mayor_edad(longitud, arr);
    printf("El nombre de la persona con mayor edad es %s\n", p.nombre);
    p = persona_de_menor_altura(longitud, arr);
    printf("El nombre de la persona con menor altura es %s\n", p.nombre);
    return 0;
}