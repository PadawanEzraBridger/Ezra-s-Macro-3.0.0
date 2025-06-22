;[No Env not sure what it does, it keeps down lag though/Single instance. force is forcing there to only ever be one of these runnin at all times.]

#NoEnv
#SingleInstance, Force


;[Shi for the gui]

Gui,Font, s12, Gameplay Regular
Gui,1:+AlwaysOnTop
Gui, New
Gui, Color, 0x00000
Gui, Font, s9 cWhite, Gameplay Regular
Gui, Add, Button, x100 y100 w200 h50 gMyButton +0x8000 +Background0x000000 cWhite, Emergency Close
Gui, Add, Text, x120 y60 w380 BackgroundTrans, Hold F1 for AutoClicker!
Gui, Add, Text, x10 y10 w380 BackgroundTrans, Open With notepad for instructions on how to use
Gui, Add, Text, x80 y35 w380 BackgroundTrans, -You can have this menu minimized-
Gui, Add, Button, x350 y250 w50 h50 gMySite +0x8000 +Background0x000000, Github


;[Checks to see if the "Rebel's_Phoenix.png" pic is in the folder, if it is then it will show, if not it will say image not found]

if FileExist(A_ScriptDir . "\Rebel's_Phoenix.png")
    Gui, Add, Picture, x155 y200 w100 h100, %A_ScriptDir%\Rebel's_Phoenix.png
else
    Gui, Add, Text, x130 y160 w200 h50 Center BackgroundTrans cWhite, Image not found
Gui, Show, x200 y200 w400 h300, Ezra's Macro



;[If this works right, if you somehow run this file without autohotkey installed, it should go to the page for it, prolly not tho, I cant test it :(]

*F1::
{
    RegRead, ahkPath, HKEY_LOCAL_MACHINE, SOFTWARE\AutoHotkey, InstallDir
    if ErrorLevel {
        if !FileExist("C:\Program Files\AutoHotkey\AutoHotkey.exe") and !FileExist("C:\Program Files (x86)\AutoHotkey\AutoHotkey.exe") {
            Run, https://www.autohotkey.com/download/
            MsgBox, 64, AutoHotkey Required, AutoHotkey is not installed. Opening download page...
            return
        }
    }

;[If you want your keybind for the autoclicker to start, Change the F1. If you want to change the Keyboard input, change b. Sleep adjusts the speed.(Going under 10 might cause some pc problems like crashing, freezing, etc)]

    while GetKeyState("F1", "P") {
        Send, b
        Sleep, 25  
        Click
        Sleep, 25 
    }
}
return


;[ the ^ ctrl, the ! is the alt and the d is... its still the d. What that is is sayin that if ctrl+alt+d is clicked down(^!d::)it will run the discord, and if ctrl+alt+f is clicked(^!f)It will close discord.
;[The if File Exist code is basically just to check if you have discord installed(not tested)]

^!d::
if FileExist(A_Desktop "\Discord.lnk")
    run, "%A_Desktop%\Discord.lnk"
else if FileExist(A_DesktopCommon "\Discord.lnk")
    run, "%A_DesktopCommon%\Discord.lnk"
else
    run, Discord
return

^!f::
WinClose, ahk_exe Discord.exe
return



;[Returns for your buttons(what you want the buttons to do after being clicked)]

MySite:
Run, https://github.com/PadawanEzraBridger
return

;[Emergency Stop]
MyButton:
MsgBox, 64, Message, Stopped (Closing Program) , 2
Sleep, 100
ExitApp
return

F3::ExitApp

Test_Button_Press:
MsgBox, Button was pressed!
return


