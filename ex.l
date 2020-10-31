%{
#include <stdio.h>
#include<stdlib.h>
#include <string.h>
%}

%option noyywrap
digit [0-9]
letter [a-zA-Z]

%%

"#".* { };
[ \t\r\n] { };
"if" { printf("TIF\n"); }
"else" { printf("TELSE\n");}
"return" { printf("TRETURN\n"); }
"while" { printf("TWHILE\n"); }
"int" { printf("TYINT\n");}
"void" { printf("TYVOID\n"); }
"ID" { printf("TIDENTIFIER\n");}
"NUM" { printf("TINT\n"); }
"+" { printf("TPLUS\n"); }
"-" { printf("TMINUS\n"); }
"*" { printf("TMUL\n"); }
"/" { printf("TDIV\n"); }
"<" { printf("TCLT\n"); }
"<=" { printf("TCLE\n"); }
">" { printf("TCGT\n");}
">=" { printf("TCGE\n"); }
"=" { printf("TEQUAL\n"); }
"==" { printf("TCEQ\n"); }
"!=" { printf("TCNE\n"); }
";" { printf("TSEMICOLON\n"); }
"," { printf("TCOMMA\n"); }
"(" { printf("TLPAREN\n"); }
")" { printf("TRPAREN\n"); }
"{" { printf("TLBRACE\n"); }
"}" { printf("TRBRACE\n"); }
"[" { printf("TLBRACKET\n"); }
"]" { printf("TRBRACKET\n"); }
"/*" {
	register int c;
	for ( ; ; )
	{
		while ( (c = input()) != '*' && c != EOF ); /* eat up text of comment */
		if ( c == '*' )
		{
			while ( (c = input()) == '*');
			if ( c == '/')
			break; /* found the end */
		}
		if ( c == EOF )
		{
			printf( "EOF in comment" );
				break;
		} 
	} 
} 

%%

void main() 
{ 	
	yylex( ); 
}
