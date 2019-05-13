tell application "Finder" to set folderPath to quoted form of POSIX path of (target of front window as string)
tell application "iTerm" to create window with default profile
tell application "iTerm" to tell first session of current tab of current window to write text "cd " & folderPath & "; clear"