@rem Licensed Materials - Property of IBM
@rem dashdb_configure.bat
@rem
@rem (C) Copyright IBM Corp. 2014
@rem
@rem US Government Users Restricted Rights - Use, duplication, or
@rem disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
@rem
@rem The following sample of source code ("Sample") is owned by International 
@rem Business Machines Corporation or one of its subsidiaries ("IBM") and is 
@rem copyrighted and licensed, not sold. You may use, copy, modify, and 
@rem distribute the Sample in any form without payment to IBM, for the purpose of 
@rem assisting you in the development of your applications.
@rem 
@rem The Sample code is provided to you on an "AS IS" basis, without warranty of 
@rem any kind. IBM HEREBY EXPRESSLY DISCLAIMS ALL WARRANTIES, EITHER EXPRESS OR 
@rem IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
@rem MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. Some jurisdictions do 
@rem not allow for the exclusion or limitation of implied warranties, so the above 
@rem limitations or exclusions may not apply to you. IBM shall not be liable for 
@rem any damages you suffer as a result of using, copying, modifying or 
@rem distributing the Sample, even if IBM has been advised of the possibility of 
@rem such damages.

@echo off

if .%1 == . goto error

@rem ODBC alias name is fixed at dashdb
@rem dashDB database name is fixed at BLUDB
@rem this is non-SSL - so port is fixed at 50000

@rem remove >nul from commands below to see output to aid in debugging

@rem first - remove ODBC dsn
db2cli registerdsn -remove -dsn dashdb >nul

@rem remove dsn and database from dsdriver.cfg
db2cli writecfg remove -dsn dashdb >nul
db2cli writecfg remove -database BLUDB -host %1 -port 50000 >nul

@rem create database, then dsn in dsdriver.cfg
db2cli writecfg add -database BLUDB -host %1 -port 50000 >nul
db2cli writecfg add -dsn dashdb -database BLUDB -host %1 -port 50000 >nul

@rem register this with ODBC now
db2cli registerdsn -add -dsn dashdb >nul

echo.
echo ODBC alias dashdb registered to BLUDB at %1 on port 50000
echo.

goto end

:error
echo.
echo Specify the hostname or IP address as the input parameter to this configuration script.
echo.


:end


