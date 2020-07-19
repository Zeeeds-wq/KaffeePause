#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Outfile=Kaffeepause 3.0 x86.exe
#AutoIt3Wrapper_Outfile_x64=K Me x64.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Fileversion=1.0.0.1
#AutoIt3Wrapper_Res_ProductVersion=3.0
#AutoIt3Wrapper_Run_Tidy=y
#AutoIt3Wrapper_Run_Au3Stripper=y
#Au3Stripper_Parameters=/pe /sf /sv /rm
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
;*****************************************
;Kaffeepause.au3 by Zeeeds
;Erstellt mit ISN AutoIt Studio v. 1.11
;*****************************************
#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <GuiButton.au3>
#include <UpDownConstants.au3>
#include <EditConstants.au3>
#include <WinAPISys.au3>


HotKeySet("{F4}", "IdleSwitch")
HotKeySet("{F9}", "SetWindow")
HotKeySet("{1}", "ProfilSwitchHK")

Local $T[2], $Idle, $VariTime, $CSearch, $OnOff, $ProfilSwitch, $Lock, $MemoryXyXy[2][4], $KColor = 12262439, $Audible, $Window, $MousePos, $RC, $SData[2] = [@DesktopWidth / 2, @DesktopHeight / 2] ;, $TData[2][2][2], $CData[2][2], $HKData[2][2], $AData[2], $RCData[2][2][2]
Local $PToken[3]
Local Const $iBitMask = 0x8000
$PToken[0] = "Kaffeepause"
$PToken[1] = "3.0"
$PToken[2] = "Pixelbrei export"
$T[0] = Random(1000, 9000, 1)
$T[1] = Random(1, 999, 1)


;~ #include "Kaffeepause_GUI.isf"
Opt("GUIOnEventMode", 1)
Local $Kaffeepause_GUI = GUICreate($T[0] & $T[1], 150, 510, -1, -1, BitOR($WS_SYSMENU, $WS_MINIMIZEBOX, $WS_VISIBLE), -1)
GUISetOnEvent($GUI_EVENT_CLOSE, "Terminate")
Local $CInput = GUICtrlCreateInput("", 50, 221, 70, 20, $ES_CENTER, $WS_EX_CLIENTEDGE)
GUICtrlSetOnEvent($CInput, "ColorSwitch")
GUICtrlSetTip(-1, "Color HEX code.")
Local $LXInput = GUICtrlCreateInput("", 17, 75, 30, 20, BitOR($ES_CENTER, $ES_NUMBER), $WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1, "Left X coordinate for the search square.")
GUICtrlCreateLabel("Zeeeds Kaffeepause", 14, 0, 125, 50, $SS_CENTER, -1)
GUICtrlSetFont(-1, 12, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
Local $CDisplay = GUICtrlCreateLabel("", 120, 221, 15, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetColor(-1, "0xFF00FF")
GUICtrlSetBkColor(-1, "0")
GUICtrlCreateLabel("Y", 54, 105, 20, 20, -1, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
Local $LYInput = GUICtrlCreateInput("", 17, 105, 30, 20, BitOR($ES_CENTER, $ES_NUMBER), $WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1, "Left Y coordinate for the search square.")
GUICtrlCreateGroup("Right", 75, 44, 60, 90, $BS_CENTER, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "0xF0F0F0")
GUICtrlCreateLabel("X", 54, 75, 20, 20, -1, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
Local $RXInput = GUICtrlCreateInput("", 82, 75, 30, 20, BitOR($ES_CENTER, $ES_NUMBER), $WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1, "Right X coordinate for the search square.")
GUICtrlCreateGroup("Left", 10, 44, 60, 90, $BS_CENTER, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "0xF0F0F0")
Local $RYInput = GUICtrlCreateInput("", 82, 105, 30, 20, BitOR($ES_CENTER, $ES_NUMBER), $WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1, "Right Y coordinate for the search square.")
GUICtrlCreateLabel("Y", 120, 105, 20, 20, -1, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("X", 120, 75, 20, 20, -1, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
Local $VariMinInput = GUICtrlCreateInput("50", 17, 173, 30, 20, BitOR($ES_CENTER, $ES_NUMBER), $WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1, "Minimum time to trigger again.")
Local $VariMaxInput = GUICtrlCreateInput("60", 58, 173, 30, 20, BitOR($ES_CENTER, $ES_NUMBER), $WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1, "Maximum time to trigger again.")
GUICtrlCreateLabel("Min", 17, 153, 30, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Max", 58, 153, 30, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateGroup("Time Variance", 9, 134, 125, 65, $BS_CENTER, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "0xF0F0F0")
Local $CVariInput = GUICtrlCreateInput("40", 10, 221, 40, 20, -1, $WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1, "Maximal color variance.")
Local $CVariInput_Updown = GUICtrlCreateUpdown(-1, BitOR($UDS_ALIGNLEFT, $UDS_ARROWKEYS, $ES_NUMBER))
Local $VariOnOff = GUICtrlCreateRadio("On", 95, 173, 35, 20, -1, -1)
GUICtrlSetState(-1, BitOR($GUI_CHECKED, $GUI_SHOW, $GUI_ENABLE))
GUICtrlSetOnEvent($VariOnOff, "OnOffSwitch")
GUICtrlSetTip(-1, "Time variance, checked = On.")
GUICtrlCreateLabel("Vari.", 10, 201, 40, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Color", 50, 201, 70, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
Local $HKInput = GUICtrlCreateInput("02", 10, 295, 22, 20, -1, $WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1, "Key to monitor, 02 = right mouse button.")
GUICtrlCreateLabel("Hotkey", 10, 274, 125, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
Local $CLButton = GUICtrlCreateButton("Code List", 32, 295, 103, 20, -1, -1)
GUICtrlSetOnEvent(-1, "CodeLTxT")
GUICtrlSetFont(-1, 9, 700, 2, "Comic Sans MS")
GUICtrlSetTip(-1, "Opens the codelist.txt file.")
Local $SButton = GUICtrlCreateButton("Save", 10, 340, 63, 20, -1, -1)
GUICtrlSetOnEvent(-1, "SaveData")
GUICtrlSetFont(-1, 9, 700, 2, "Comic Sans MS")
GUICtrlSetTip(-1, "Saves all values in a .save file.")
Local $LButton = GUICtrlCreateButton("Load", 73, 340, 62, 20, -1, -1)
GUICtrlSetOnEvent(-1, "LoadData")
GUICtrlSetFont(-1, 9, 700, 2, "Comic Sans MS")
GUICtrlSetTip(-1, "Loads a .save file.")
Local $HButton = GUICtrlCreateButton("Help", 10, 320, 125, 20, -1, -1)
GUICtrlSetOnEvent(-1, "HelpTxT")
GUICtrlSetFont(-1, 9, 700, 2, "Comic Sans MS")
GUICtrlSetTip(-1, "Opens the help.txt file.")
Local $Profil1 = GUICtrlCreateCheckbox("<-1- Profile -2->", 14, 259, 100, 20, $BS_CENTER, -1)
GUICtrlSetOnEvent(-1, "ProfilSwitch")
GUICtrlSetState(-1, BitOR($GUI_CHECKED, $GUI_SHOW))
GUICtrlSetFont(-1, 8, 400, 2, "Comic Sans MS")
Local $Profil2 = GUICtrlCreateCheckbox("", 118, 259, 150, 20, -1, -1)
GUICtrlSetOnEvent(-1, "ProfilSwitch")
GUICtrlSetState(-1, $GUI_SHOW)
GUICtrlCreateGroup("Profile", 10, 241, 125, 37, $BS_CENTER, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "0xF0F0F0")
GUICtrlCreateGroup("Filename", 10, 360, 125, 40, $BS_CENTER, -1)
GUICtrlSetFont(-1, 10, 700, 2, "Comic Sans MS")
GUICtrlSetBkColor(-1, "0xF0F0F0")
Local $DName = GUICtrlCreateInput("some weapon name", 12, 377, 121, 20, $ES_CENTER, $WS_EX_CLIENTEDGE)
GUICtrlSetFont(-1, 8, 700, 0, "Comic Sans MS")
GUICtrlCreateCheckbox("Audible Mode", 25, 405, 94, 20, -1, -1)
GUICtrlSetOnEvent(-1, "AudibleON")
GUICtrlSetState(-1, BitOR($GUI_UNCHECKED, $GUI_SHOW, $GUI_ENABLE))
GUICtrlSetFont(-1, 9, 700, 0, "Comic Sans MS")
Local $RCInputX = GUICtrlCreateInput("2", 17, 443, 25, 20, BitOR($ES_CENTER, $ES_NUMBER), $WS_EX_CLIENTEDGE)
GUICtrlSetFont(-1, 8, 700, 0, "Comic Sans MS")
Local $RCInputY = GUICtrlCreateInput("2", 57, 443, 25, 20, BitOR($ES_CENTER, $ES_NUMBER), $WS_EX_CLIENTEDGE)
GUICtrlSetFont(-1, 8, 700, 0, "Comic Sans MS")
Local $RCOnOff = GUICtrlCreateCheckbox("Off", 97, 443, 30, 20, -1, -1)
GUICtrlSetOnEvent(-1, "RecoilC")
GUICtrlSetState(-1, BitOR($GUI_UNCHECKED, $GUI_SHOW, $GUI_ENABLE))
GUICtrlCreateLabel("X", 42, 443, 15, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 700, 0, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateLabel("Y", 82, 443, 15, 20, $SS_CENTER, -1)
GUICtrlSetFont(-1, 9, 700, 0, "Comic Sans MS")
GUICtrlSetBkColor(-1, "-2")
GUICtrlCreateGroup("Recoil compensation", 10, 423, 125, 50, $BS_CENTER, -1)
GUICtrlSetFont(-1, 9, 700, 0, "Comic Sans MS")
GUICtrlSetBkColor(-1, "0xF0F0F0")
Local $KPState = GUICtrlCreateInput("0", 0, 0, 50, 20, $ES_READONLY, $WS_EX_CLIENTEDGE)
GUICtrlSetState(-1, BitOR($GUI_SHOW, $GUI_ENABLE))

GUICtrlSetData($LXInput, $SData[0] - 1)
GUICtrlSetData($LYInput, $SData[1] + 7)
GUICtrlSetData($RXInput, $SData[0])
GUICtrlSetData($RYInput, $SData[1] + 17)
GUICtrlSetData($CInput, 12330538)
GUICtrlSetBkColor($CDisplay, GUICtrlRead($CInput))
SaveHandle()

GUISetState(@SW_SHOW)
;~ MsgBox(0, "Info", $SData[0] & @CRLF & $SData[1], 0)

While 1
	While $Window = WinGetHandle("[active]")
		While $Idle = True
			Sleep(200)
		WEnd
		If BitAND(_WinAPI_GetAsyncKeyState(GUICtrlRead("01")), $iBitMask) = 0 Then
			While GUICtrlRead($HKInput) = 0
				If $Window <> WinGetHandle("[active]") Then ExitLoop
				If $Idle = True Then ExitLoop
				DoIt()
			WEnd
			While BitAND(_WinAPI_GetAsyncKeyState(GUICtrlRead($HKInput)), $iBitMask) <> 0
				If $Window <> WinGetHandle("[active]") Then ExitLoop
				If $Idle = True Then ExitLoop ;Just to be sure, coffee breaks are sacred.
				If BitAND(_WinAPI_GetAsyncKeyState(GUICtrlRead("01")), $iBitMask) <> 0 Then ExitLoop
				DoIt()
			WEnd
		EndIf
		Sleep(100)
	WEnd
	Sleep(200)
WEnd

Func DoIt()
	$CSearch = PixelSearch(GUICtrlRead($LXInput), GUICtrlRead($LYInput), GUICtrlRead($RXInput), GUICtrlRead($RYInput), GUICtrlRead($CInput), GUICtrlRead($CVariInput))
	If Not @error Then
		If $Audible = False Then
			$MousePos = MouseGetPos()
			GUICtrlSetData($KPState, "1")
			MouseWheel("down", 1)
			If $RC = True Then				
;~ 				NOT IMPLEMENTED!
			EndIf
		Else
			AudibleBeep()
		EndIf
		If $OnOff = False Then
			$VariTime = Random(GUICtrlRead($VariMinInput), GUICtrlRead($VariMaxInput), 1)
		Else
			$VariTime = GUICtrlRead($VariMinInput)
		EndIf
		Sleep($VariTime)
	Else
		Sleep(50)
	EndIf
	GUICtrlSetData($KPState, "0")
EndFunc   ;==>DoIt

Func ColorSwitch()
	GUICtrlSetBkColor($CDisplay, GUICtrlRead($CInput))
	ClickBeep()
EndFunc   ;==>ColorSwitch

Func OnOffSwitch()
	If $OnOff = False Then
		GUICtrlSetState($VariOnOff, $GUI_UNCHECKED)
		GUICtrlSetData($VariOnOff, "Off")
	Else
		GUICtrlSetState($VariOnOff, $GUI_CHECKED)
		GUICtrlSetData($VariOnOff, "On")
	EndIf
	$OnOff = Not $OnOff
	ClickBeep()
EndFunc   ;==>OnOffSwitch

Func SaveData()
	ClickBeep()
	Dim $nFile = "KP" & "_" & GUICtrlRead($DName) & "." & @HOUR & @MIN & @SEC & ".save"
	Dim $hFile = FileOpen(@ScriptDir & '\' & $nFile, $FO_READ + $FO_OVERWRITE + $FO_BINARY)
	If $hFile = -1 Then
		MsgBox(0, "Error", "Unable to open file.", 3)
		ClickBeep()
		Return
	Else
		FileWrite($hFile, $PToken[0] & @CRLF)
		FileWrite($hFile, $PToken[1] & @CRLF)
		If $MemoryXyXy[0][0] = False Then
			If GUICtrlRead($LXInput) = False Then
				For $r = 1 To 8
					FileWrite($hFile, "0" & @CRLF)
				Next
			Else
				FileWrite($hFile, GUICtrlRead($LXInput) & @CRLF)
				FileWrite($hFile, GUICtrlRead($LYInput) & @CRLF)
				FileWrite($hFile, GUICtrlRead($RXInput) & @CRLF)
				FileWrite($hFile, GUICtrlRead($RYInput) & @CRLF)
				For $s = 1 To 4
					FileWrite($hFile, "0" & @CRLF)
				Next
			EndIf
		ElseIf $MemoryXyXy[1][0] = False Then
			For $s = 0 To 3
				FileWrite($hFile, $MemoryXyXy[0][$s] & @CRLF)
			Next
			If GUICtrlRead($LXInput) = False Then
				For $s = 1 To 4
					FileWrite($hFile, "0" & @CRLF)
				Next
			Else
				FileWrite($hFile, GUICtrlRead($LXInput) & @CRLF)
				FileWrite($hFile, GUICtrlRead($LYInput) & @CRLF)
				FileWrite($hFile, GUICtrlRead($RXInput) & @CRLF)
				FileWrite($hFile, GUICtrlRead($RYInput) & @CRLF)
			EndIf
		Else
			For $r = 0 To 1
				For $s = 0 To 3
					FileWrite($hFile, $MemoryXyXy[$r][$s] & @CRLF)
				Next
			Next
		EndIf
		If GUICtrlRead($CInput) = False Then
			FileWrite($hFile, $KColor & @CRLF)
		Else
			FileWrite($hFile, GUICtrlRead($CInput) & @CRLF)
		EndIf
		FileWrite($hFile, GUICtrlRead($VariMinInput) & @CRLF)
		FileWrite($hFile, GUICtrlRead($VariMaxInput) & @CRLF)
		FileWrite($hFile, GUICtrlRead($CVariInput) & @CRLF)
		FileWrite($hFile, GUICtrlRead($HKInput) & @CRLF)
		FileWrite($hFile, GUICtrlRead($RCInputX) & @CRLF)
		FileWrite($hFile, GUICtrlRead($RCInputY))
	EndIf
	FileClose($hFile)
	rdyBeep()
EndFunc   ;==>SaveData

Func SaveHandle()
	Dim $SHandle = WinGetHandle("[active]")
	If @error Then
		MsgBox(4096, "Error", "Could not find the correct window", 5)
		ClickBeep()
		Return
	EndIf
	Dim $nFile = "kp.handle"
	Dim $hFile = FileOpen(@ScriptDir & '\' & $nFile, $FO_READ + $FO_OVERWRITE + $FO_ANSI)
	If $hFile = -1 Then
		MsgBox(0, "Error", "Unable to open file.", 3)
		ClickBeep()
		Return
	Else
		FileWrite($hFile, $SHandle)
	EndIf
	FileClose($hFile)
EndFunc   ;==>SaveHandle

Func LoadData()
	ClickBeep()
	Dim $Folder = @ScriptDir
	Dim $var = FileOpenDialog("Choose a File.", $Folder & "\", "Save (*.save)", 1 + 2)
	If @error Then
		MsgBox(4096, "", "No File chosen", 3)
		ClickBeep()
		Return
	Else
		$var = StringReplace($var, "|", @CRLF)
		Dim $hFile = FileOpen($var, 16)
		If $hFile = -1 Then
			MsgBox(0, "Error", "Unable to open file.", 3)
			ClickBeep()
			Return
		Else
			Dim $tempPToken[2]
			$tempPToken[0] = FileReadLine($hFile)
			$tempPToken[1] = FileReadLine($hFile)
			If $PToken[0] <> $tempPToken[0] And $PToken[2] <> $tempPToken[0] Then
				FileClose($hFile)
				MsgBox(0, "Error", "This is not a Kaffeepause save file.", 3)
				ClickBeep()
				Return
			EndIf
			If $PToken[1] <> $tempPToken[1] Then
				FileClose($hFile)
				MsgBox(0, "Error", "The save file is for Kaffeepause V" & $tempPToken[1] & ".", 3)
				ClickBeep()
				Return
			EndIf
			For $r = 0 To 1
				For $s = 0 To 3
					$MemoryXyXy[$r][$s] = FileReadLine($hFile)
				Next
			Next
			GUICtrlSetData($LXInput, $MemoryXyXy[0][0])
			GUICtrlSetData($LYInput, $MemoryXyXy[0][1])
			GUICtrlSetData($RXInput, $MemoryXyXy[0][2])
			GUICtrlSetData($RYInput, $MemoryXyXy[0][3])
			GUICtrlSetData($CInput, FileReadLine($hFile))
			GUICtrlSetBkColor($CDisplay, GUICtrlRead($CInput))
			GUICtrlSetData($VariMinInput, FileReadLine($hFile))
			GUICtrlSetData($VariMaxInput, FileReadLine($hFile))
			GUICtrlSetData($CVariInput, FileReadLine($hFile))
			GUICtrlSetData($HKInput, FileReadLine($hFile))
			GUICtrlSetData($RCInputX, FileReadLine($hFile))
			GUICtrlSetData($RCInputY, FileReadLine($hFile))
			If $PToken[2] = $tempPToken[0] Then
				MsgBox(0, "Info", "Pixelbrei export file was imported." & @CRLF & "Check all data and adjust them if necessary.", 5)
				ClickBeep()
			EndIf
		EndIf
		FileClose($hFile)
	EndIf
	rdyBeep()
EndFunc   ;==>LoadData

Func AudibleON()
	$Audible = Not $Audible
	ClickBeep()
EndFunc   ;==>AudibleON

Func RecoilC()
	If $RC = False Then
		GUICtrlSetData($RCOnOff, "On")
	Else
		GUICtrlSetData($RCOnOff, "Off")
	EndIf
	$RC = Not $RC
	ClickBeep()
EndFunc   ;==>RecoilC

Func ProfilSwitchHK()
	HotKeySet("{1}")
	Send("{1}")
	HotKeySet("{1}", "ProfilSwitchHK")
	If $Window <> WinGetHandle("[active]") Then Return
	ProfilSwitch()
EndFunc   ;==>ProfilSwitchHK

Func ProfilSwitch()
	$ProfilSwitch = Not $ProfilSwitch
	If $ProfilSwitch = True Then
		GUICtrlSetState($Profil1, $GUI_UNCHECKED)
		GUICtrlSetState($Profil2, $GUI_CHECKED)
		$MemoryXyXy[0][0] = GUICtrlRead($LXInput)
		$MemoryXyXy[0][1] = GUICtrlRead($LYInput)
		$MemoryXyXy[0][2] = GUICtrlRead($RXInput)
		$MemoryXyXy[0][3] = GUICtrlRead($RYInput)
		If $MemoryXyXy[1][0] = False Then
			GUICtrlSetData($LXInput, $SData[0] - 1)
			GUICtrlSetData($LYInput, $SData[1] + 7)
			GUICtrlSetData($RXInput, $SData[0])
			GUICtrlSetData($RYInput, $SData[1] + 17)
		Else
			GUICtrlSetData($LXInput, $MemoryXyXy[1][0])
			GUICtrlSetData($LYInput, $MemoryXyXy[1][1])
			GUICtrlSetData($RXInput, $MemoryXyXy[1][2])
			GUICtrlSetData($RYInput, $MemoryXyXy[1][3])
		EndIf
	Else
		GUICtrlSetState($Profil1, $GUI_CHECKED)
		GUICtrlSetState($Profil2, $GUI_UNCHECKED)
		$MemoryXyXy[1][0] = GUICtrlRead($LXInput)
		$MemoryXyXy[1][1] = GUICtrlRead($LYInput)
		$MemoryXyXy[1][2] = GUICtrlRead($RXInput)
		$MemoryXyXy[1][3] = GUICtrlRead($RYInput)
		GUICtrlSetData($LXInput, $MemoryXyXy[0][0])
		GUICtrlSetData($LYInput, $MemoryXyXy[0][1])
		GUICtrlSetData($RXInput, $MemoryXyXy[0][2])
		GUICtrlSetData($RYInput, $MemoryXyXy[0][3])
	EndIf
	ClickBeep()
EndFunc   ;==>ProfilSwitch

Func IdleSwitch()
	$Idle = Not $Idle
	If $Idle = True Then
		ClickBeep()
	Else
		rdyBeep()
	EndIf
EndFunc   ;==>IdleSwitch

Func ClickBeep()
	Beep(500, 35)
	Sleep(100)
EndFunc   ;==>ClickBeep

Func AudibleBeep()
	Beep(1000, 35)
	Sleep(35)
EndFunc   ;==>AudibleBeep

Func rdyBeep()
	For $i = 0 To 1
		Beep(5000, 100)
		Sleep(100)
	Next
EndFunc   ;==>rdyBeep

Func CodeLTxT()
	ClickBeep()
	ShellExecute(@ScriptDir & "\codelist.txt")
EndFunc   ;==>CodeLTxT

Func HelpTxT()
	ClickBeep()
	ShellExecute(@ScriptDir & "\help2.txt")
EndFunc   ;==>HelpTxT

Func SetWindow()
	$Window = WinGetHandle("[active]")
	If @error Then
		MsgBox(4096, "Error", "Could not find the correct window", 5)
		ClickBeep()
		Return
	EndIf
	rdyBeep()
EndFunc   ;==>SetWindow

Func Terminate()
	Dim $iDelete = FileDelete(@ScriptDir & "\kp.handle")
	GUIDelete($Kaffeepause_GUI)
	Exit 0
EndFunc   ;==>Terminate
