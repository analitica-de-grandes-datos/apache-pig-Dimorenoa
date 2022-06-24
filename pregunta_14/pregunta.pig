/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
lines = LOAD 'data.csv' USING PigStorage(',')
    AS (
            f1:int,
            f2:chararray,
            f3:chararray,
            f4:chararray,
            f5:chararray,
            f6:int
    );


B = FOREACH lines GENERATE f5 AS (color:chararray);
C = FILTER B BY NOT STARTSWITH (color,'b');

STORE C INTO 'output';
