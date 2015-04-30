@echo off

echo ///////////////////////////////////////////////////////////////////////////
echo //                           BTI-Converter (to DDS)           
echo //                                                                       
echo //           --------------------------------------------------          
echo //              Please use "ant Renamer" to 	 
echo // 		Delete all spaces                       
echo //                     before using Tool                       
echo //           --------------------------------------------------          
echo //                                                                       
echo //                                                                       
echo //                         This is a Batch File to              
echo // 		 Dump Nintendo .bti-Files	 
echo //                             into DDS-Textures               
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //Batch       :                           (c)Masl                 
echo //btidump.exe :              (c)http://www.amnoid.de 
echo //                                                                       
echo ///////////////////////////////////////////////////////////////////////////
pause


ECHO Continue?
SET /P X=(Y)es or (N)o?
IF /I "%X%"=="J" goto :Weiter
IF /I "%X%"=="N" goto :NEIN1
:Weiter
FOR /f %%i IN ('DIR /s /b *.bti') DO (


echo extract "%%i"
source-Programs\btidump.exe "%%i"


)

ECHO Delete every BTI-File?
SET /P X=(Y)es or (N)o?
IF /I "%X%"=="Y" goto :JA
IF /I "%X%"=="N" goto :NEIN
GOTO ENDE
 
:Ja
FOR /f %%i IN ('DIR /s /b *.bti') DO (


echo Delete "%%i"
del "%%i"


)
:nein
pause
exit

:NEIN1
echo EXIT
Pause
exit