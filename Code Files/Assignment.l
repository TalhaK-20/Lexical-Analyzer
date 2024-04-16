%{
#include <stdio.h>
%}

%option noyywrap

letter      [A-Za-z]
digit       [0-9]
id          {letter}({letter}|{digit}|_)*
digits      {digit}{digit}*

%%

while | 
if  |
else |     
return | 
break |  
continue |  
int | 
float |  
void |
for |
printf {printf("keyword: %s\n", yytext);}

{letter}({letter}|{digit}|_)* {printf("Identifier: %s\n", yytext);}

{digits} { printf("Num: %s\n", yytext); }

{digits}\.{digits}?[Ee][+-]?{digits}?|\.{digits}[Ee][+-]?{digits}?  { printf("Num: %s\n", yytext); }


"(" {printf("(: %s\n", yytext);}
")" {printf("): %s\n", yytext);}
"{" {printf("{: %s\n", yytext);}
"}" {printf("}: %s\n", yytext);}
"[" {printf("[: %s\n", yytext);}
"]" {printf("]: %s\n", yytext);}
"+" {printf("+: %s\n", yytext);}
"-" {printf("-: %s\n", yytext);}
"<" {printf("<: %s\n", yytext);}
">" {printf(">: %s\n", yytext);}
"<=" {printf("<=: %s\n", yytext);}
">=" {printf(">=: %s\n", yytext);}
"==" {printf("==: %s\n", yytext);}
"!" {printf("!: %s\n", yytext);}
"!=" {printf("!=: %s\n", yytext);}
"&&" {printf("&&: %s\n", yytext);}
"*" {printf("*: %s\n", yytext);}
"/" {printf("/: %s\n", yytext);}
"=" {printf("=: %s\n", yytext);}


.|\n {ECHO ;}           

%%

int main(){
    FILE *file = fopen("input.txt", "r");
    FILE *file2 = fopen("output.txt", "w");

    yyin = file;

    yyout = file2;
    
    yylex();

    fclose(file);
    fclose(file2);
    return 0;
}


int my_wrap(){
    return 1; 
}