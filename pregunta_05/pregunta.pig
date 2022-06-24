/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
lines = LOAD 'data.tsv' AS (f1:CHARARRAY,f2:CHARARRAY );
line = FOREACH lines GENERATE f2;
words = FOREACH line GENERATE FLATTEN(TOKENIZE(f2)) AS word;
grouped = GROUP words BY word ;
word_count = FOREACH grouped GENERATE group, COUNT(words);
final = LIMIT word_count 7;

STORE final INTO 'output' USING PigStorage(',');
