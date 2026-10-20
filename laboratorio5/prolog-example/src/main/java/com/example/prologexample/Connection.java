package com.example.prologexample;

import alice.tuprolog.*;

import java.io.InputStream;

public class Connection {
    private final Prolog engine = new Prolog();

    public Connection() throws Exception {
        try (InputStream in = getClass().getResourceAsStream("/calculo.pl"))
        {
            if (in == null) throw new IllegalStateException("No se encontró calculo.pl");
            engine.setTheory(new Theory(in));
        }
    }

    public String consultar(String predicado, String expresion) throws Exception {
        SolveInfo info = engine.solve(
                predicado + "(x, " + expresion + ", R)."
        );
        if (info.isSuccess()) {
            return formatear(info.getTerm("R"));
        }
        return "Sin solución para esa expresión";
    }


    private String formatear(Term term) {

        // IMPORTANTE:
        // Si term es una variable ligada, obtenemos el término real
        term = term.getTerm();

        if (term instanceof Struct) {
            Struct s = (Struct) term;

            String nombre = s.getName();

            if (s.getArity() == 2) {

                // getTerm(i) también desreferencia variables ligadas
                String izq = formatear(s.getTerm(0));
                String der = formatear(s.getTerm(1));

                switch (nombre) {
                    case "+":
                        return izq + " + " + der;

                    case "-":
                        return izq + " - " + der;

                    case "*":
                        return izq + "*" + der;

                    case "/":
                        return izq + "/" + der;

                    case "^":
                        return izq + "^" + der;
                }
            }

            if (s.getArity() == 1) {
                return nombre + "(" + formatear(s.getTerm(0)) + ")";
            }
        }

        return term.toString();
    }
}
