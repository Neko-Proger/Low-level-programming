#include "form.h"

void form(int num, int array[],int len){
    if (num<0){
        array[0]=1;
        num=0-num;
    }else{
        array[0]=0;
    }
    for(int i = len; i>0;i--){
        int d=num%10;
        array[i]=d;
        num=num/10;
    }
}

//
// Created by NekoProger on 24.12.2021.
//

