%{

#include <stdio.h>

#include "ast.h"

// the resulting AST
T_statement_list ast;

// lexer variables
extern char yytext[];
extern int column;
extern int yylineno;

extern int yylex(); // from flex
void yyerror(char *);

%}

%token <intval> NUMBER
%token <charval> OPERATOR

%start program

%union value {
	int intval;
	char charval;
	T_statement_list statement_list;
	T_statement statement;
	T_expression expression;
}

%nterm <statement_list>		program
%nterm <statement_list>		statement_list
%nterm <statement>			statement
%nterm <expression>			expression

%%

/* starting symbol */
program
	: statement_list { $$ = $1; ast = $$; }
	;

statement_list
	: /* empty */ { $$ = NULL; }
	| statement statement_list { $$ = create_statement_list($1, $2); }
	;

statement
	: expression ';' { $$ = create_statement($1); }
	;

expression 
	: NUMBER OPERATOR NUMBER { $$ = create_expression($1, $2, $3); }
	;

%%

void yyerror(char *s){
  fprintf(stderr, "parsing error\n");
}
