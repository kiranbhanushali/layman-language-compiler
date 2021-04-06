%{
#include <stdio.h>
#include "y.tab.h"
%}


// rules 
%%
" " ; 

which {printf("Keyword: %s\n",yytext);yylval.ret_type=1; return WHICH;}

Which {printf("Keyword: %s\n",yytext);yylval.ret_type=1;return WHICH;}

is {printf("Keyword: %s\n",yytext);return IS;}

Is {printf("Keyword: %s\n",yytext);yylval.ret_type=0;return IS;}

or {printf("Keyword: %s\n",yytext);return OR;}

and {printf("Keyword: %s\n",yytext);return AND;}

number {printf("Keyword: %s\n",yytext);return NUMBER;}

than {printf("Keyword: %s\n",yytext);return THAN;}

between {printf("Keyword: %s\n",yytext);return BETWEEN;}

From {printf("Keyword: %s\n",yytext);return FROM;}

the {printf("Keyword: %s\n",yytext);return THE;}

[0-9]+ {printf("Number: %s\n",yytext); yylval.num = atoi(yytext) ; return NUM;}

"?" {printf("Qusestion mark: %s\n",yytext);return EOL;} 

"\n" {return NL;}

bigger {printf("Comparator: %s\n",yytext); yylval.op = 1 ;return BIGGER;}

smaller {printf("Comparator: %s\n",yytext); yylval.op= 0 ;return SMALLER;}

larger {printf("Comparator: %s\n",yytext); yylval.op = 1;return LARGER;}

lesser {printf("Comparator: %s\n",yytext); yylval.op = 0;return LESSER;}

. {printf("Not recognized Error at: %s \n",yytext);return OTHER;}
%%

int yywrap(void)
{
 return 1;
}  
