/* simplest version of calculator */
%{												
/*Prologue section	(跟C的前置處理區一樣，C的include和define就在此使用，因為這部份之後會複製到bison產生的C程式中)*/
#include <stdio.h>
#include <stdlib.h>
#include "test.h"
//#define YYSTYPE double	(should not define in yacc but lex, by info from stackoverflow)
%}

/*Bison declarations section (用於定義terminal, nonterminal, precedence)*/
/* declare tokens */	
%union{					//用來宣告下面type的<xxx>可使用型別，exp好像是內建的不用
	char *string;
	struct node *set;
}
%token ELEMENT
%token ADD SUB MUL
%token EOL
%type <string> ELEMENT
%type <set> exp			//token 和 type 是不是一樣啊？
%type <set> set
%start final
%left ADD SUB MUL

/*Grammar rules section (用於定義一或多個Bison的LALR(1)語法規則)*/
%%	
final: /* nothing */ 
	| final exp EOL  { struct node *ptr = $2; while(ptr!=NULL){ puts(ptr->name); ptr = ptr->next; } } 
;

exp: '{' set '}' ADD '{' set '}'	{ $$ = uni($2, $6);   }
	|'{' set '}' SUB '{' set '}'	{ $$ = differ($2, $6);}
	|'{' set '}' MUL '{' set '}'	{ $$ = inter($2, $6); }
;

set:  ELEMENT 				{ $$ = makenode($1); }
	| set ',' ELEMENT 		{ struct node *tmp = makenode($3);  $$ = makelist($1, tmp); }
;
%%

/*Epilogue section*/
main(int argc, char **argv)
{
	yyparse();
}

yyerror(char *s)
{
	fprintf(stderr, "error: %s\n", s);
} 

