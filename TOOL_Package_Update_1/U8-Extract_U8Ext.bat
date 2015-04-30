@echo off
echo ///////////////////////////////////////////////////////////////////////////
echo //                  U8-Extract_U8Extension                  
echo //                                                                       
echo //           --------------------------------------------------          
echo //          				 
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //Batch        :                                         (c)Masl  
echo //Sharpii :                                        (c)person66 
echo //libsharpii         (c) leathl (mod by scooby74029) 
echo ///////////////////////////////////////////////////////////////////////////
pause

FOR /f %%i IN ('DIR /s /b *.arc.LZ.u8') DO (
echo extract %%i
source-Programs\Sharpii.exe U8 -u %%i %%i_Folder
)



ECHO Sollen alle "arc.LZ.u8" gelöscht werden?
SET /P X=(J)a oder (N)ein?
IF /I "%X%"=="J" goto :JA2
IF /I "%X%"=="N" goto :NEIN2
:Ja2
FOR /f %%i IN ('DIR /s /b *.arc.LZ.u8') DO (
echo lösche "%%i"
del "%%i"
)
:nein2