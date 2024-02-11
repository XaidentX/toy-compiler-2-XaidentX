#ifndef AST_H
#define AST_H

#include <stdlib.h>

typedef struct S_statement_list* T_statement_list;
typedef struct S_statement* T_statement;
typedef struct S_expression* T_expression;

struct S_statement_list{
	T_statement statement;
	T_statement_list statement_list;
};

struct S_statement{
	T_expression expression;	
};

struct S_expression{
	int operand1;
	char operator;
	int operand2;		
};

T_statement_list create_statement_list(T_statement statement, T_statement_list statement_list);
T_statement create_statement(T_expression expression);
T_expression create_expression(int operand1, char operator, int operand2);

#endif