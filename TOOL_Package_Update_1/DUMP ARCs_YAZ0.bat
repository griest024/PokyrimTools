@echo off

echo /////////////////////////////////////////////////////////////////////////////
echo //                           ARC-Decrypter                        
echo //                                                                         
echo //          --------------------------------------------------             
echo //                  Please use "ant Renamer"	   
echo //	               	 to Delete all spaces                    
echo //                        before using Tool                      
echo //           --------------------------------------------------           
echo //                                                                        
echo //                                                                        
echo //               This is a Batch-File to decrypt            
echo //		           Arc-Files		  
echo //                                  (Yaz0)                           
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //Batch        :                          (c)Masl                 
echo //yaz0dec.exe :            (c)http://www.amnoid.de  
echo //                                                                       
echo ///////////////////////////////////////////////////////////////////////////
pause


FOR /f %%i IN ('DIR /s /b *.arc') DO (


echo extract "%%i"
source-Programs\yaz0dec.exe "%%i"


)

ECHO Delete every ARC-File?
SET /P X=(Y)es or (N)o?
IF /I "%X%"=="Y" goto :JA
IF /I "%X%"=="N" goto :NEIN
GOTO ENDE
 
:Ja
FOR /f %%i IN ('DIR /s /b *.arc') DO (


echo Delete "%%i"
del "%%i"


)
:nein
pause
exit