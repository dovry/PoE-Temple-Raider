;GroupAdd, PoEexe, ahk_exe PathOfExile.exe
;GroupAdd, PoEexe, ahk_exe PathOfExileSteam.exe
;GroupAdd, PoEexe, ahk_exe PathOfExile_x64.exe
;GroupAdd, PoEexe, ahk_exe PathOfExile_x64Steam.exe
;#IfWinActive Path of Exile ahk_class POEWindowClass ahk_group PoEexe

#SingleInstance force
#NoEnv
#Warn
#Persistent
#Include <FindText>
Menu, Tray, Icon, %A_WorkingDir%\dep\Chronicle_of_Atzoatl.png ,, 1

!1::
t1:=A_TickCount, X:=Y:=""
Armourers_Workshop:="|<armourers_workshop>*63$71.zzzzxzzzzzzzzzzznzzzzzzzzzzzbzlXtzzzzzzzDzXbnzzn1kMDwTb7jXk61UkDkT7CQ3UAnDaTDzCQnXANaTAz7yMvbaMnA6Ny7wkbDAlUwQ7z7wdSSM39ntDzDsEwwm6NbnDyTllsnaQt1bDUznbsDDzzzzzjzzjxzy"
if (ok:=FindText(X, Y, 2903-150000, 600-150000, 2903+150000, 600+150000, 0, 0, Armourers_Workshop))
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
