@echo off
echo %1
call sfdx force:source:push -f -u %1
for /f %%a in (import-data/order_of_execution.txt) do (
    echo %%a
    call sfdx force:data:tree:import -u %1 -p import-data/%%a
)