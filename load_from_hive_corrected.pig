REGISTER /opt/pig/lib/hive-hcatalog-core-4.0.0.jar;
REGISTER /opt/pig/lib/hive-hcatalog-pig-adapter-4.0.0.jar;

data = LOAD 'default.data' USING org.apache.hive.hcatalog.pig.HCatLoader();
DUMP data;
