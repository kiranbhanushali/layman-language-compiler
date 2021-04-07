%{
#include <stdio.h>
#include "y.tab.h"
%}


%%
" " ;
which {   yylval.ret_type=1; return WHICH;}
Which {   yylval.ret_type=1;return WHICH;}
is {   return IS;}
Is {   yylval.ret_type=0;return IS;}
or {   return OR;}
and {   return AND;}
number {   return NUMBER;}
than {   return THAN;}
between {   return BETWEEN;}
From {   return FROM;}
the {   return THE;}
[0-9]+ { yylval.num = atoi(yytext) ; return NUM;}
"?" {return EOL;} 
"\n" {return NL;}
bigger {    yylval.op = 1 ;return BIGGER;}
smaller {    yylval.op= 0 ;return SMALLER;}
larger {    yylval.op = 1;return LARGER;}
lesser {    yylval.op = 0;return LESSER;}

. {printf("Not recognized Error at: %s \n",yytext);return OTHER;}
%%

int yywrap(void)
{
 return 1;
}  
