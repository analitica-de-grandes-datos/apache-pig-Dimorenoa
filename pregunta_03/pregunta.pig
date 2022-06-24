/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' AS (f1:CHARARRAY,f2:CHARARRAY,f3:INT);

line3 = FOREACH lines GENERATE f3;

order_by = ORDER line3 BY f3 ASC;

mas_pequenos = LIMIT order_by 5;

STORE mas_pequenos INTO 'output' USING PigStorage(',');
