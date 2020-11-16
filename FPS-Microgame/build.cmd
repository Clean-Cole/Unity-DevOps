@echo off

SET UNITYVERSION=2019.4.14f1

SET PRODUCTNAME="Product Name"
IF NOT [%1]==[] (set PRODUCTNAME=%1)

SET COMPANYNAME="Company Name"
IF NOT [%2]==[] (set COMPANYNAME=%2)

SET TARGET=Windows
IF NOT [%3]==[] (set TARGET=%3)

SET VERSION=0.0.0.0
IF NOT [%4]==[] (set VERSION=%4)

SET BUILDLOCATION="./Build/%TARGET%/%VERSION%"

rmdir -S %BUILDLOCATION%
mkdir %BUILDLOCATION%

>buildManifest.txt (
    echo ProductName=%PRODUCTNAME%
    echo CompanyName=%COMPANYNAME%
    echo Version=%VERSION%
    echo BuildLocation=%BUILDLOCATION%
)

"C:\Program Files (x86)\Unity\%UNITYVERSION%\Editor\Unity.exe" -quit -batchMode -executeMethod BuildHelper.%TARGET%

del /f buildManifest.txt