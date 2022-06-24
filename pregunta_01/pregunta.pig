/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' AS (line:CHARARRAY);

-- agrupo
grouped = GROUP lines BY line;

-- cuento palabras
wordcount = FOREACH grouped GENERATE group, COUNT(lines);

--extraigo carpeta
STORE wordcount INTO 'output' USING PigStorage(',');
