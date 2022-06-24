/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
u = LOAD 'data.tsv' AS (f1:CHARARRAY, f2:BAG{t:TUPLE(p:CHARARRAY)}, f3:MAP[CHARARRAY]);
w = FOREACH u GENERATE f1, COUNT(f2) AS letras, SIZE(f3) AS c;
ordenar = ORDER w BY f1,letras,c;

STORE ordenar INTO 'output' USING PigStorage(',');
