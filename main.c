#include <stdio.h>

#include "ast.h" // our AST data structures
#include "parser.tab.h" // declared yyparser, interface to parser
#include "codegen.h" // our tree walker that generates assembly

extern FILE *yyout; // lexer interface, output of flex
extern int yylex (void); // lexer interface, get next toxen

extern T_statement_list ast; // interface to parser result

int main(int argc, char **argv){
	
	/* while (1) { */
	/*   yylex(); */
	/* } */
	
	// print input program and parse errors to stderr
	yyout = stderr;
	
	// kick off the parser, which will store the result in program_ast
	yyparse();
	
	gencode_statement_list(ast);
	
	return 0;
}
