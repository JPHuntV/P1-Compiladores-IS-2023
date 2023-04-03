//------------------paquetes importaciones
package src;
import java_cup.runtime.*;

//--------opciones y declaraciones
%%

%{

%}

%public
%class Analizador
%cupsym sym
%cup
%char
%column

%ignorecase
%line
%unicode


//----------Expresiones Regulares

numero = (-?)[1-9][0-9]* | 0
letra = [a-zA-Z] 
simbolo = "!" | "@" | "#" | "$" | "%" | "^" | "&" | "*" 
    | "(" | ")" | "-" | "_" | "+" | "=" | "[" | "]" | "{" 
    | "}" | ";" | ":" | "\'" | '\"' | "," | "." | "<" | ">" 
    | "?" | "/" | "|" | "\\"
operador = "+" | "-" | "*" | "/" | "<" | ">" | "<=" | ">=" | "==" | "!="

//------estados
%%

//--------------------reglas lexicas

<YYINITIAL>{

    "!"             {return new Symbol(sym.REXC, yycolumn, yyline, yytext()); }
    "@"             {return new Symbol(sym.ARROBA, yycolumn, yyline, yytext()); }
    "#"             {return new Symbol(sym.HASH, yycolumn, yyline, yytext()); }
    "$"             {return new Symbol(sym.DOLLAR, yycolumn, yyline, yytext()); }
    "%"             {return new Symbol(sym.PORCIENTO, yycolumn, yyline, yytext()); }
    "^"             {return new Symbol(sym.CONJ, yycolumn, yyline, yytext()); }
    "&"             {return new Symbol(sym.AND, yycolumn, yyline, yytext()); }
    "*"             {return new Symbol(sym.MULT, yycolumn, yyline, yytext()); }
    "("             {return new Symbol(sym.LPAREN, yycolumn, yyline, yytext()); }
    ")"             {return new Symbol(sym.RPAREN, yycolumn, yyline, yytext()); }
    "-"             {return new Symbol(sym.MENOS, yycolumn, yyline, yytext()); }
    "_"             {return new Symbol(sym.GUIONBAJO, yycolumn, yyline, yytext()); }
    "+"             {return new Symbol(sym.MAS, yycolumn, yyline, yytext()); }
    "="             {return new Symbol(sym.ASIGNACION, yycolumn, yyline, yytext()); }
    "["             {return new Symbol(sym.LBRACKET, yycolumn, yyline, yytext()); }
    "]"             {return new Symbol(sym.RBRACKET, yycolumn, yyline, yytext()); }
    "{"             {return new Symbol(sym.LBRACE, yycolumn, yyline, yytext()); }
    "}"             {return new Symbol(sym.RBRACE, yycolumn, yyline, yytext()); }
    ";"             {return new Symbol(sym.SEMICOLON, yycolumn, yyline, yytext()); }
    ":"             {return new Symbol(sym.DOSPUNTOS, yycolumn, yyline, yytext()); }
    "\'"            {return new Symbol(sym.COMILLASIM, yycolumn, yyline, yytext()); }
    "\""            {return new Symbol(sym.COMILLADOB, yycolumn, yyline, yytext()); }
    ","             {return new Symbol(sym.COMA, yycolumn, yyline, yytext()); }
    "."             {return new Symbol(sym.PUNTO, yycolumn, yyline, yytext()); }
    "<"             {return new Symbol(sym.MENOR, yycolumn, yyline, yytext()); }
    ">"             {return new Symbol(sym.MAYOR, yycolumn, yyline, yytext()); }
    "?"             {return new Symbol(sym.RINTERRO, yycolumn, yyline, yytext()); }
    "/"             {return new Symbol(sym.DIV, yycolumn, yyline, yytext()); }
    "|"             {return new Symbol(sym.PIPE, yycolumn, yyline, yytext()); }
    "\\"            {return new Symbol(sym.SLASH, yycolumn, yyline, yytext()); }
    "<="            {return new Symbol(sym.MENORIGUAL, yycolumn, yyline, yytext()); }
    ">="            {return new Symbol(sym.MAYORIGUAL, yycolumn, yyline, yytext()); }
    "=="            {return new Symbol(sym.EQUAL, yycolumn, yyline, yytext()); }
    "!="            {return new Symbol(sym.NOTEQUAL, yycolumn, yyline, yytext()); }
    "**"            {return new Symbol(sym.POTENCIA, yycolumn, yyline, yytext()); }
    "~"             {return new Symbol(sym.MODULO, yycolumn, yyline, yytext()); }
    "++"            {return new Symbol(sym.INCREMENTO, yycolumn, yyline, yytext()); }
    "--"            {return new Symbol(sym.DECREMENTO, yycolumn, yyline, yytext()); }
    "not"           {return new Symbol(sym.NOT, yycolumn, yyline, yytext()); }
    "int"           {return new Symbol(sym.INT, yycolumn, yyline, yytext()); }
    "float"         {return new Symbol(sym.FLOAT, yycolumn, yyline, yytext()); }
    "string"        {return new Symbol(sym.STRING, yycolumn, yyline, yytext()); }
    "char"          {return new Symbol(sym.CHAR, yycolumn, yyline, yytext()); }
    "array"         {return new Symbol(sym.ARRAY, yycolumn, yyline, yytext()); }
    "bool"          {return new Symbol(sym.BOOL, yycolumn, yyline, yytext()); }
    "main"          {return new Symbol(sym.MAIN, yycolumn, yyline, yytext()); }
    "true"          {return new Symbol(sym.TRUE, yycolumn, yyline, yytext()); }
    "false"         {return new Symbol(sym.FALSE, yycolumn, yyline, yytext()); }
    "if"            {return new Symbol(sym.IF, yycolumn, yyline, yytext()); }
    "elif"          {return new Symbol(sym.ELIF, yycolumn, yyline, yytext()); }
    "else"          {return new Symbol(sym.ELSE, yycolumn, yyline, yytext()); }
    "while"         {return new Symbol(sym.WHILE, yycolumn, yyline, yytext()); }
    "do"            {return new Symbol(sym.DO, yycolumn, yyline, yytext()); }
    "for"           {return new Symbol(sym.FOR, yycolumn, yyline, yytext()); }
    "return"        {return new Symbol(sym.RETURN, yycolumn, yyline, yytext()); }
    "break"         {return new Symbol(sym.BREAK, yycolumn, yyline, yytext()); }
    "/_"            {return new Symbol(sym.LCOMENTB, yycolumn, yyline, yytext()); }
    "_/"            {return new Symbol(sym.RCOMENTB, yycolumn, yyline, yytext()); }

}

//ER
<YYINITIAL> {numero}            {return new Symbol(sym.numero, yycolumn, yyline, yytext()); }
<YYINITIAL> {letra}            {return new Symbol(sym.letra, yycolumn, yyline, yytext()); }
<YYINITIAL> {simbolo}            {return new Symbol(sym.simbolo, yycolumn, yyline, yytext()); }
<YYINITIAL> {operador}            {return new Symbol(sym.operador, yycolumn, yyline, yytext()); }


//----------------espacios en blanco

[\t\r\n\f] {/*ignore*/}


