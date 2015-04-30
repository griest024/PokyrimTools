@echo off
echo ///////////////////////////////////////////////////////////////////////////
echo //                  U8-Extract_ArcExtension                
echo //                                                                      
echo //           --------------------------------------------------          
echo //                                                                        
echo // Batch        :                                         (c)Masl  
echo // Sharpii :                                        (c)person66 
echo // libsharpii         (c) leathl (mod by scooby74029) 
echo ///////////////////////////////////////////////////////////////////////////
pause

FOR /f %%i IN ('DIR /s /b "*.arc"') DO (
echo extract %%i
source-Programs\Sharpii.exe U8 -u %%i %%i_Folder
)



ECHO Sollen alle "arc" gelöscht werden?
SET /P X=(J)a oder (N)ein?
IF /I "%X%"=="J" goto :JA
IF /I "%X%"=="N" goto :NEIN
:JA

FOR /f %%i IN ('DIR /s /b "*.arc"') DO (
echo lösche "%%i"
del "%%i" /q
)
:NEIN