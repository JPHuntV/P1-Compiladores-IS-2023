//------------------paquetes importaciones
package src;
import java_cup.runtime.*;

%%

%public
%class Analizador
%implements sym

%unicode

%line
%column

%cup
%cupdebug

%{
  StringBuilder string = new StringBuilder();

  private Symbol symbol(int type) {
    return new Symbol(type, yyline+1, yycolumn+1);
  }

  private Symbol symbol(int type, Object value) {
    return new Symbol(type, yyline+1, yycolumn+1, value);
  }
%}

//----------Expresiones Regulares

numero = (-?)[1-9][0-9]* | 0
floatN = (((-?)[1-9][0-9]*) | 0) . [0-9]+ | 0.0
letra = [a-zA-Z] 
identificador = [a-zA-Z_][a-zA-Z0-9_]*
simbolo = "!" | "@" | "#" | "$" | "%" | "^" | "&" | "*" 
    | "(" | ")" | "-" | "_" | "+" | "=" | "[" | "]" | "{" 
    | "}" | ";" | ":" | "\'" | '\"' | "," | "." | "<" | ">" 
    | "?" | "/" | "|" | "\\"
//operador = "+" | "-" | "*" | "/" | "<" | ">" | "<=" | ">=" | "==" | "!="

//------estados
%%

//--------------------reglas lexicas

//############################################################
//remplazo estructura de los simbolos de las reglas lexicas
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

}

//ER
<YYINITIAL> {numero}            {return new Symbol(sym.numero, yycolumn, yyline, yytext()); }


//----------------espacios en blanco

[\t\r\n\f] {/*ignore*/}


