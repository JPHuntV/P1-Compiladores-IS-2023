package src;
public class main {
    public static void main(String[] args) {
        App app = new App();
        app.analizar("programa/src/archivoFuente.txt");//lexer
        app.parsear("programa/src/archivoFuente.txt");//parser
    }
}
