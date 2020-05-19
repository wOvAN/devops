@echo off

IF "%time:~0,1%" LSS "1" (
   SET DATETIME=%date:~6,4%-%date:~3,2%-%date:~0,2% 0%time:~1,1%:%time:~3,2%:%time:~6,2%
) ELSE (
   SET DATETIME=%date:~6,4%-%date:~3,2%-%date:~0,2% %time:~0,2%:%time:~3,2%:%time:~6,2%
)

git add .
git commit -m "update %DATETIME%"
git push