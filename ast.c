#include "ast.h"

T_statement_list create_statement_list(T_statement statement, T_statement_list statement_list){
	T_statement_list new_list = malloc(sizeof(*new_list));
	new_list->statement = statement;
	new_list->statement_list = statement_list;
	return new_list;
}

T_statement create_statement(T_expression expression){
	T_statement new_statement = malloc(sizeof(*new_statement));
	new_statement->expression = expression;
	return new_statement;
}

T_expression create_expression(int operand1, char operator, int operand2){
	T_expression new_expression = malloc(sizeof(*new_expression));
	new_expression->operand1 = operand1;
	new_expression->operator = operator;
	new_expression->operand2 = operand2;
	return new_expression;
}