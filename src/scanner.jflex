///------------------paquetes importaciones
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
    "!"             {return symbol(REXC); }
    "@"             {return symbol(ARROBA); }
    "#"             {return symbol(OR); }
    "$"             {return symbol(DOLLAR); }
    //"%"             {return symbol(PORCIENTO); }
    "^"             {return symbol(AND); }
    //"&"             {return symbol(AMPER); }
    "*"             {return symbol(MULT); }
    "("             {return symbol(LPAREN); }
    ")"             {return symbol(RPAREN); }
    "-"             {return symbol(MENOS); }
    //"_"             {return symbol(GUIONBAJO); }
    "+"             {return symbol(MAS); }
    "="             {return symbol(ASIG); }
    "["             {return symbol(LBRACKET); }
    "]"             {return symbol(RBRACKET); }
    "{"             {return symbol(LBRACE); }
    "}"             {return symbol(RBRACE); }
    //";"             {return symbol(SEMICOLON); }
    //":"             {return symbol(DOSPUNTOS); }
    //"\'"            {return symbol(COMILLASIM); }
    //"\""            {return symbol(COMILLADOB); }
    ","             {return symbol(COMA); }
    //"."             {return symbol(PUNTO); }
    "<"             {return symbol(MENOR); }
    ">"             {return symbol(MAYOR); }
    //"?"             {return symbol(RINTERRO); }
    "/"             {return symbol(DIV); }
    //"|"             {return symbol(PIPE); }
    //"\\"            {return symbol(SLASH); }
    "<="            {return symbol(MENORIGUAL); }
    ">="            {return symbol(MAYORIGUAL); }
    "=="            {return symbol(EQUAL); }
    "!="            {return symbol(NOTEQUAL); }
    "**"            {return symbol(POTENCIA); }
    "~"             {return symbol(MODULO); }
    "++"            {return symbol(INCREMENTO); }
    "--"            {return symbol(DECREMENTO); }
    "not"           {return symbol(NOT); }
    "int"           {return symbol(INT); }
    "float"         {return symbol(FLOAT); }
    "string"        {return symbol(STRING); }
    "char"          {return symbol(CHAR); }
    "array"         {return symbol(ARRAY); }
    "bool"          {return symbol(BOOL); }
    "main"          {return symbol(MAIN); }
    "true"          {return symbol(LITERAL_BOOL, true); }
    "false"         {return symbol(LITERAL_BOOL, false); }
    "if"            {return symbol(IF); }
    "elif"          {return symbol(ELIF); }
    "else"          {return symbol(ELSE); }
    "while"         {return symbol(WHILE); }
    "do"            {return symbol(DO); }
    "for"           {return symbol(FOR); }
    "return"        {return symbol(RETURN); }
    "break"         {return symbol(BREAK); }
    "leer"          {return symbol(LEER); }
    "escribir"      {return symbol(ESCRIBIR); }
}

//ER
<YYINITIAL> {numero}            {return new Symbol(sym.numero, yycolumn, yyline, yytext()); }
<YYINITIAL> {floatN}      {return new Symbol(sym.floatN, yycolumn, yyline, yytext()); }
<YYINITIAL> {letra}            {return new Symbol(sym.letra, yycolumn, yyline, yytext()); }
<YYINITIAL> {identificador}      {return new Symbol(sym.IDENTIFICADOR, yycolumn, yyline, yytext()); }
<YYINITIAL> {simbolo}            {return new Symbol(sym.simbolo, yycolumn, yyline, yytext()); }
//<YYINITIAL> {operador}            {return new Symbol(sym.operador, yycolumn, yyline, yytext()); }


//----------------espacios en blanco

[\t\r\n\f] {/*ignore*/}


