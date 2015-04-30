@echo off

echo /////////////////////////////////////////////////////////////////////////////
echo //                           LZ11-Decomp                         
echo //                                                                         
echo //          --------------------------------------------------             
echo //                                                                        
echo //                                                                        
echo //        This is a Batch-File to decompress            
echo //                   LZ11-Compressed-Files	 
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //Batch        :                                        (c)Masl   
echo //DSDecomp :                                    (c)Barubar 
echo //                                                                       
echo ///////////////////////////////////////////////////////////////////////////
pause


FOR /f %%i IN ('DIR /s /b *.arc.LZ') DO (
echo extract %%i
source-Programs\DSDecmp -d %%i %%i.u8
CLS



)

ECHO Sollen alle "arc.LZ" gelöscht werden?
SET /P X=(J)a oder (N)ein?
IF /I "%X%"=="J" goto :JA
IF /I "%X%"=="N" goto :NEIN
:Ja
FOR /f %%i IN ('DIR /s /b *.arc.LZ') DO (
echo lösche "%%i"
del "%%i"
)
:nein

