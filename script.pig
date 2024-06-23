data = LOAD 'hdfs:///data/data.csv' USING PigStorage(',')
    AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);

LIMITED_DATA = LIMIT data 10;

DUMP LIMITED_DATA;
