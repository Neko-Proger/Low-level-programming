#include <stdio.h>
#include "form.h"

int main() {
double x=0.32;
int y=0;
double num = x;
float a = (int)num;
while(a!=num){
    num*=10;
    a=(int)num;
    y+=1;
}
int array[y+1];
    form((int)num, array,y);
    for(int i=0;i<y+1;i++){
        printf("%d",array[i]);
        putchar('\n');
    }
    return 0;
}

