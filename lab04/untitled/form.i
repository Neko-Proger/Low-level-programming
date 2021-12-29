# 1 "form.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "form.c"
# 1 "form.h" 1






void form (int num, int array[],int len);
# 2 "form.c" 2

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
