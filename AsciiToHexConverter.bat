@echo off
echo Executing Converter
	Set string=
	Set input=%1
	
	IF [%input%]==[] Set /p input="Enter the string to parse to HEX -> "

:Extract
	Set i=%input:~0,1%

	For /F "tokens=1,2,3 delims=;" %%a in (%~nx0) do If [";%%c"]==[";%i%"] Set ASCII=%%b

	Set string=%string%%ASCII%

	Set input=%input:~1%

	If [%input%]==[] goto Done


	goto Extract

:Done
	Set ENCODED=%string%

echo	%ENCODED%>enc.txt
	goto eof

R;00; 
R;20;#
R;21;!
R;22;"
X;23;#
R;24;$
R;25;%
R;26;&
R;27;'
R;28;(
R;29;)
R;2B;+
R;2C;,
R;2D;-
R;2E;.
R;2F;/
R;30;0
R;31;1
R;32;2
R;33;3
R;34;4
R;35;5
R;36;6
R;37;7
R;38;8
R;39;9
R;3A;:
R;3B;;
R;40;@
R;41;A
R;42;B
R;43;C
R;44;D
R;45;E
R;46;F
R;47;G
R;48;H
R;49;I
R;4A;J
R;4B;K
R;4C;L
R;4D;M
R;4E;N
R;4F;O
R;50;P
R;51;Q
R;52;R
R;53;S
R;54;T
R;55;U
R;56;V
R;57;W
R;58;X
R;59;Y
R;5A;Z
R;5B;[
R;5C;\
R;5D;]
R;5F;_
R;61;a
R;62;b
R;63;c
R;64;d
R;65;e
R;66;f
R;67;g
R;68;h
R;69;i
R;6A;j
R;6B;k
R;6C;l
R;6D;m
R;6E;n
R;6F;o
R;70;p
R;71;q
R;72;r
R;73;s
R;74;t
R;75;u
R;76;v
R;77;w
R;78;x
R;79;y
R;7A;z
R;7B;{
R;7D;}
R;7E;~

::Set stringToHex=%stringToHex:~0,1% -> esto extrae la primera letra de la cadena y para que
::extraiga las 2 primeras tenemos que variar el espacio donde se encuentra el 1

::Set stringToHex=%stringToHex:~1% -> esto borra la primera letra de la cadena de texto
:eof
echo.
echo 				Finalizing Conversion........
ping localhost -n 2 >nul
exit /b