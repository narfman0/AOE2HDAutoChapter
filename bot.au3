; Use this script to time out save chapter hotkeys
Global $paused = True
Global $shellPlay = "green.ico"
Global $shellPause = "red.ico"
Global $interval = Int(IniRead("settings.ini", "core", "interval", "360000"))
Global $pauseKey = IniRead("settings.ini", "core", "pauseKey", "F5")
Global $chapterKey = IniRead("settings.ini", "core", "chapterKey", "F9")
Global $detectStart = Int(IniRead("settings.ini", "core", "detectStart", "1"))
Global $debug = Int(IniRead("settings.ini", "core", "debug", "0"))
Global $inGameAcknowledged = False
Global $foodColor = 0xDCC12F

HotKeySet("{" & $pauseKey & "}", "TogglePause")
TraySetIcon($shellPause)

Func TogglePause()
    $paused = Not $paused
	TraySetIcon($paused ? $shellPause : $shellPlay)
	$inGameAcknowledged = False
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
   ElseIf $detectStart == 1 Then
      $clientSize = WinGetPos("[Active]")
	  Local $foodCoord = PixelSearch($clientSize[0], $clientSize[1], $clientSize[2], $clientSize[3], $foodColor)
	  If @error Then
		  MsgBox (0, "aoe2autochapter", "Game over?")
		 $inGameAcknowledged = False
	  Else
		 MouseMove($foodCoord[0], $foodCoord[1], 0)
         If not $inGameAcknowledged Then
             $result = MsgBox (4, "AOE2 Game Started", "Do you wish to enable autosave?")
             If $result == 6 Then
                TogglePause()
             EndIf
             $inGameAcknowledged = True
		 EndIf
	  EndIf
   EndIf
WEnd

Func GetWindowSize($hWnd)
    $clientSize = WinGetPos($hWnd)
    Local $arr[4] = [$clientSize[0], $clientSize[1], $clientSize[0] + $clientSize[2], $clientSize[1] + $clientSize[3]]
    return $arr
EndFunc