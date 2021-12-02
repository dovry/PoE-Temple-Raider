GroupAdd, PoEexe, ahk_exe PathOfExile.exe
GroupAdd, PoEexe, ahk_exe PathOfExileSteam.exe
GroupAdd, PoEexe, ahk_exe PathOfExile_x64.exe
GroupAdd, PoEexe, ahk_exe PathOfExile_x64Steam.exe
#IfWinActive Path of Exile ahk_class POEWindowClass ahk_group PoEexe
#SingleInstance force
#NoEnv
#Warn
#Persistent
Menu, Tray, Icon, %A_WorkingDir%\dep\Chronicle_of_Atzoatl.png ,, 1