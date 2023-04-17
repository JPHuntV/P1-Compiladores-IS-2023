package src;

import java.util.List;

public class Funcion {
    private String name;
    private List<ElementoTabla> parameters;

    public Funcion(String name, List<ElementoTabla> parameters) {
        this.name = name;
        this.parameters = parameters;
    }

    public String getName() {
        return name;
    }

    public List<ElementoTabla> getParameters() {
        return parameters;
    }
}
