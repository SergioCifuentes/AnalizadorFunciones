package jflex;
import java_cup.runtime.Symbol;
import analizadorfunciones.cup.sym;
%%
%public class AnalizadorLexico
%cupsym sym
%cup
%cupdebug
%line
%column

/*Identifiers*/
Digito = [0123456789]
%%
//Reglas Lexicas
<YYINITIAL>{
        "x"|"X"                                  {return new Symbol(sym.X, yycolumn,yyline,yytext());}
        "f(x)"                                         {return new Symbol(sym.FUNCION, yycolumn,yyline,yytext());}
        "="                                     {return new Symbol(sym.IGUAL, yycolumn,yyline,yytext());}
        "^"                                         {return new Symbol(sym.POTENCIA, yycolumn,yyline,yytext());}
        "+"                                     {return new Symbol(sym.SUMA, yycolumn,yyline,yytext());}
        "-"                                     {return new Symbol(sym.RESTA, yycolumn,yyline,yytext());}
    
        ({Digito})+                                     {return new Symbol(sym.ENTERO, yycolumn,yyline,yytext());}
        [ \t\r\f\n]                            {} 
            
        .                                            {return new Symbol(sym.ERROR,yycolumn,yyline,yytext());}

}