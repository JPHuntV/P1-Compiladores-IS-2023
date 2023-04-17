package src;

import org.w3c.dom.Node;

import java_cup.runtime.Symbol;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;


public class App {
    public void analizar(String archivoFuente) {
        try {
            Reader reader = new BufferedReader(new FileReader(archivoFuente));
            BufferedWriter writer = new BufferedWriter(new FileWriter("lexemas.txt")); 
            //reader.read();
            Analizador analizador = new Analizador(reader);
            int i = 0;
            Symbol token;
            while(true){
                token = analizador.next_token();
                if(token.sym != 0){
                    System.out.println("I: " + i + "\tToken: " + token.sym + "\tvalor: "+analizador.yytext());
                    
                    writer.write("Token: " + token.sym + "\tvalor: "+analizador.yytext());
                    writer.newLine();
                }
                else{
                    System.out.println("Lexemas encontrados: " + i);
                    writer.close();
                    return;
                }
                i++;
            }
            
        } catch (Exception e) {
            System.err.println(e.getMessage());
        }
    }

    public void parsear(String archivoFuente) {
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("tablasimbolos.txt"));
            Reader reader = new BufferedReader(new FileReader(archivoFuente));
            //reader.read();
            Analizador analizador = new Analizador(reader);
            parser parse_obj = new parser(analizador);

            parse_obj.parse();
            if(parse_obj.getErrores() == false){
                SymbolTableStack tableStack = parse_obj.getSymbolTableStack();
                if(tableStack.isEmpty()) System.out.println("vacia");
                else{
                    for(SymbolTable tabla : tableStack.getStack()){
                        System.out.println("Tabla           : "+ tabla.getName());
                        for (Map.Entry<String, String> entry : tabla.getSymbols().entrySet()) {
                            String valor = entry.getKey();
                            String tipo = entry.getValue();
                            writer.write("Tabla: "+tabla.getName()+"    valor: "+valor+"    tipo: "+tipo);
                            writer.newLine();
                            System.out.println("valor: "+valor+"  tipo: "+tipo);
                        }
                    }
                }
            }else{
                System.out.println("El archivo no puede ser generado ya que se han reportado errores");
                writer.write("El archivo no puede ser generado ya que se han reportado errores");
            }
            writer.close();
        } catch (Exception e) {
            
            System.out.println("El archivo no puede ser generado ya que se han reportado errores");
        
        }
    }
    

    
}
    