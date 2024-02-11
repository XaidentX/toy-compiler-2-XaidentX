%{
#include <stdio.h>

#include "ast.h"

/* declare tokens defined by parser.y. */
#include "parser.tab.h"

%}

%option yylineno

%%

[0-9]			{ ECHO; yylval.intval = atoi(yytext); return(NUMBER); }
";"				{ ECHO; return(';'); }
"+"|"-"|"*"|"/" { ECHO; yylval.charval = yytext[0]; return(OPERATOR); }

[ \t\v\n\f]		{ ECHO; /* skip whitespace */ }
.		{ /* ignore bad characters */ }

%%

int yywrap()
{
 return (1);
}