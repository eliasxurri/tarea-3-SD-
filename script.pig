A = LOAD 'hdfs:///user/hadoop/hdfspath/data.csv' USING PigStorage(',') AS (branch_addr:chararray, branch_type:chararray, taken:int, target:chararray);
B = FOREACH A GENERATE branch_addr, branch_type, taken, target;
STORE B INTO 'hdfs:///user/hadoop/output' USING PigStorage(',');
