%{						
#define YYSTYPE double
#include "calc.tab.h"
#ifdef CALC_LEX
YYSTYPE yylval;
#endif
%}

%%	
"+"			{ return ADD; }
"-"			{ return SUB; }
"*"			{ return MUL; }
\n 			{ return EOL; } 
[ \t] 		{ /* ignore */ } 
"'[a-z]'" 	{  yylval = atof(yytext); return ELEMENT; }			
%%

				
#ifdef CALC_LEX 				
int main (int argc, char** argv) 
{
	char *token;

	while (token = yylex()) 
	{
		printf("%s", token);
		if (token == ELEMENT) 
		{
			printf(" = %f\n", yylval);
		} 
		else 
		{
			printf("\n");
		}
	}


	return 0;
}
#endif 

