#SingleInstance force
#NoEnv
#Persistent
#Include <FindText>
Menu, Tray, Icon, %A_WorkingDir%\dep\Chronicle_of_Atzoatl.png ,, 1
#installKeybdHook
TrayTip, %A_ScriptName%, Started, 1
^#!r::reload %A_ScriptName% ; reload the script

;GroupAdd, PoEexe, ahk_exe PathOfExile.exe
;GroupAdd, PoEexe, ahk_exe PathOfExileSteam.exe
;GroupAdd, PoEexe, ahk_exe PathOfExile_x64.exe
;GroupAdd, PoEexe, ahk_exe PathOfExile_x64Steam.exe
;#IfWinActive Path of Exile ahk_class POEWindowClass ahk_group PoEexe


; get poe winpos, write coords to file (if it doesnt exist already)
; read file and set coords in FindText to look at top right corner of POE window
; saves time instead of searching whole screen

!2::
WinGetPos, winX, winY, Width, Height,
MsgBox, 
(
winX = %winX%
winY = %winY%
Width = %Width%
Height = %Height%
)
return

!1::
t1:=A_TickCount, X:=Y:=""

Armourers_Workshop:="|<armourers_workshop>*63$71.zzzzxzzzzzzzzzzznzzzzzzzzzzzbzlXtzzzzzzzDzXbnzzn1kMDwTb7jXk61UkDkT7CQ3UAnDaTDzCQnXANaTAz7yMvbaMnA6Ny7wkbDAlUwQ7z7wdSSM39ntDzDsEwwm6NbnDyTllsnaQt1bDUznbsDDzzzzzjzzjxzy"
Pools_of_Restoration:="|<Pools_of_Restoration>*61$86.1zzzzzzzzzzzzzk7zzzzzzzzzzzzwNUsUC7UyQ1DVtw6MA010s7X01kCD1aSRnb6NkyQNlVkNblwttaQDb6SMB0sADASNbNtl7aF0C7ln7a3USQNta0FbyQttYPbb6SNk69zbCAtYwtlXCS1k33nkSQDCQQ7bXzztzzzzzzzzrzzU"

if (ok:=FindText(X, Y, 2903-5000, 600-5000, 2903+5000, 600+5000, 0, 0, Armourers_Workshop))
{
  ; FindText().Click(X, Y, "L")
}
; ok:=FindText("wait",3, 0,0,0,0,0,0,Text)    ; Wait 3 seconds for appear
; ok:=FindText("wait0",-1, 0,0,0,0,0,0,Text)  ; Wait indefinitely for disappear
MsgBox, 4096, Tip, % "Found:`t" Round(ok.Length())
  . "`n`nTime:`t" (A_TickCount-t1) " ms"
  . "`n`nPos:`t" X ", " Y
  . "`n`nResult:`t<" (Comment:=ok[1].id) ">"

for i,v in ok
  if (i<=2)
    FindText().MouseTip(ok[i].x, ok[i].y)
