; Use this script to time out save chapter hotkeys
; can be paused with PAUSE key (yes, it exists)

Global $paused = True
Global $intervalMinutes = 5
Global $shellPlay = "green.ico"
Global $shellPause = "red.ico"

HotKeySet("{F5}", "TogglePause")
TraySetIcon($shellPause)

Func TogglePause()
    $paused = Not $paused
	TraySetIcon($paused ? $shellPause : $shellPlay)
EndFunc

While True
   If not $paused Then
      Send("{F9}")
	  Sleep($intervalMinutes*1000*60)
   EndIf
WEnd