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

numero = [0-9]+

//------estados
%%

//--------------------reglas lexicas

<YYINITIAL>{

    "+"             {System.out.println("reconocio +"); return new Symbol(sym.PLUS, yycolumn, yyline, yytext()); }
    "-"             {return new Symbol(sym.MINUS, yycolumn, yyline, yytext()); }
    "*"             {return new Symbol(sym.TIMES, yycolumn, yyline, yytext()); }
    "/"             {return new Symbol(sym.DIV, yycolumn, yyline, yytext()); }
    "("             {return new Symbol(sym.LPAREN, yycolumn, yyline, yytext()); }
    ")"             {return new Symbol(sym.RPAREN, yycolumn, yyline, yytext()); }
}

//ER
<YYINITIAL> {numero}            {return new Symbol(sym.numero, yycolumn, yyline, yytext()); }


//----------------espacios en blanco

[\t\r\n\f] {/*ignore*/}


