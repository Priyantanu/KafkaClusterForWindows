@echo off
For /F "tokens=1* delims==" %%A IN (cluster.properties) DO (
    IF "%%A"=="KAFKAPATH" set KAFKAPATH=%%B
)
cd %KAFKAPATH%
START zookeeper-server-start.bat ..\..\config\zookeeper.properties
timeout 3
START kafka-server-start.bat ..\..\config\server0.properties