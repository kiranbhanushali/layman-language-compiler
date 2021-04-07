%{
#include<stdio.h>
int yyerror(char * m);
int yylex();

// will store 
int num1  =0 ; 
int num2 =0 ; 
int operator_c = 0 ; 
int ret_type = 0 ; 
int evaluate();
%}


// customized yylval 
%union 
{
    int num ;
    int op;
    int ret_type;
};


// token declaration
%token<num> NUM 
%token<op> LARGER BIGGER SMALLER LESSER 
%token WHICH IS NUMBER OR FROM AND THAN BETWEEN EOL OTHER NL THE

// rules 
%%

statement : WHICH IS the operator stm1 EOL { ret_type = 0;  operator_c = $<op>4; evaluate();  return 0 ;}

          | FROM num AND num WHICH IS operator EOL  { ret_type = 0;num1=$<num>2 ; num2=$<num>4;  operator_c = $<op>7; evaluate();  return 0 ;}

          | IS num operator THAN num EOL  { ret_type = 1; num1=$<num>2 ; num2=$<num>5;  operator_c = $<op>3; evaluate();  return 0 ;}


stm1:    NUMBER num OR num { num1 = $<num>2 ; num2 = $<num>4 ;}

     |   BETWEEN num AND num { num1 = $<num>2 ; num2 = $<num>4 ;}
    ;

operator: LESSER
        | LARGER
        | BIGGER
        | SMALLER
        ;

num : NUM
    ;

the : THE 
    |  /*epsilon*/ ; 

%%

int yyerror(char * message){

    printf("Input Sentence is Invalid! : %s\n",message);
    exit(1);

}

int min ( int a , int b ) {
    if( a< b ) return a;
    return b ;
}

int max ( int a , int b ) {
    if( a> b ) return a;
    return b ;
}

int evaluate(){
    // ret_type == 0 means we have to return the number and ret_type == 1 meand we have to validate the comparision.
    // operator_c == 0 is for smaller and lesser    
    // operator_c == 1 is for larger and bigger
    if( ret_type ==0 ) {
        if( operator_c == 0 ) {
            printf("Ans: %d\n",min(num1,num2));
        }else{
            printf("Ans: %d\n",max(num1,num2));
        }
    }else{
        // true false answer
        if(operator_c==0){
            if( num1 < num2 ) {
                printf("True\n");
            }else{
                printf("False\n");
            }
        }else{
            if( num1 > num2 ) {
                printf("True\n");
            }else{
                printf("False\n");
            }
        }
    }
}
int main(){

    yyparse();

}



