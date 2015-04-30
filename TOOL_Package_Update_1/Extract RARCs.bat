@echo off
echo /////////////////////////////////////////////////////////////////////////////
echo //                           RARC-Dumper                        
echo //                                                                         
echo //          --------------------------------------------------             
echo //                  Please use "ant Renamer"	   
echo //	               	 to Delete all spaces                    
echo //                        before using Tool                      
echo //           --------------------------------------------------           
echo //                                                                        
echo //                                                                        
echo //                  This is a Batch-File to Dump            
echo //		decrypted Arc-Files		  
echo //                                   (RARC)                         
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //                                                                       
echo //Batch        :                          (c)Masl                 
echo //rarcdump.exe :            (c)http://www.amnoid.de 
echo //                                                                       
echo ///////////////////////////////////////////////////////////////////////////
pause






FOR /f %%g IN ('DIR /s /b *.rarc') DO (


echo extract "%%g"
source-Programs\rarcdump.exe "%%g"


)


ECHO Delete every RARC-File?
SET /P X=(Y)es or (N)o?
IF /I "%X%"=="Y" goto :JA
IF /I "%X%"=="N" goto :NEIN

 
:Ja
FOR /f %%g IN ('DIR /s /b *.rarc') DO (


echo Delete "%%g"
del "%%g"


)
:nein

pause
exit