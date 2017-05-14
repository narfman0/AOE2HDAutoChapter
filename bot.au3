; Use this script to time out save chapter hotkeys
; can be paused with PAUSE key (yes, it exists)

Global $paused = True
Global $shellPlay = "green.ico"
Global $shellPause = "red.ico"
Global $interval = Int(IniRead("settings.ini", "core", "interval", "360000"))
Global $pauseKey = IniRead("settings.ini", "core", "pauseKey", "F5")
Global $chapterKey = IniRead("settings.ini", "core", "chapterKey", "F9")
Global $debug = Int(IniRead("settings.ini", "core", "debug", "0"))

HotKeySet("{" & $pauseKey & "}", "TogglePause")
TraySetIcon($shellPause)

Func TogglePause()
    $paused = Not $paused
	TraySetIcon($paused ? $shellPause : $shellPlay)
EndFunc

If $debug == 1 Then
   MsgBox(0, "Initialization Status", "Interval: " & $interval & " pause key: " & $pauseKey & " chapter key: " & $chapterKey)
EndIf
While True
   If not $paused Then
      Send("{" & $chapterKey & "}")
	  If $debug == 1 Then
	     MsgBox(0, "Triggered", "Save chapter triggered!")
	  EndIf
	  Sleep($interval)
   EndIf
WEnd