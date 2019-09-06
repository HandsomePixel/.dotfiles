function shortcut(__self, mod, key, action)
  local keybind = hs.hotkey.new(mod, key, function()
    action()
  end)
  local watcher = hs.application.watcher.new(function(name, eventType, app)
    if eventType ~= hs.application.watcher.activated then return end
    if name == __self.appName then
      keybind:enable() -- Enable the shortcut if the current activated app is the app_name you specified
    else
      keybind:disable() -- Disable otherwise
    end
  end)
  watcher:start()
end

------------------------
--Some handy functions--
------------------------
function FocusedWindowPath()
  local comm_bool
  local focused_window_path
  local comm_descriptor
  comm_bool, focused_window_path, comm_descriptor = hs.osascript.applescript("tell application \"Finder\" to return quoted form of POSIX path of (target of front window as string)")
  return focused_window_path
end

function SelectedFile()
  local comm_bool
  local selected_file
  local comm_descriptor
  comm_bool, selected_file, comm_descriptor = hs.osascript.applescript("tell application \"Finder\" to get quoted form of POSIX path of (item 1 of (get selection) as text)")
  return selected_file
end

function FileExt (filename) return filename:match("(%.%w+)$") or "" end

----------------------------
--Preview custom shortcuts--
----------------------------

Preview = {
  appName = 'Preview',
  cropSaveClose = shortcut,
}

Preview:cropSaveClose({'shift', 'option'}, 's', function()
  hs.eventtap.keyStroke({'cmd'}, 'k')
  hs.eventtap.keyStroke({'cmd'}, 's')
  hs.eventtap.keyStroke({'cmd'}, 'w')
end)

---------------------------
--Finder custom shortcuts--
---------------------------

Finder = {
  appName = 'Finder',
  openTermWindowHere = shortcut,
  openVolumes = shortcut,
  mrgInvoicePDF = shortcut,
  buildInvoice = shortcut,
  resetInvoice = shortcut,
}

Finder:openVolumes({'shift', 'option'}, 'v', function()
  hs.execute('open /Volumes')
  hs.alert('Volumes Folder Opened')
end)

Finder:openTermWindowHere({'shift', 'option'}, 't', function()
  hs.osascript.applescript('tell application "Finder" to set folderPath to quoted form of POSIX path of (target of front window as string)\
tell application "iTerm" to create window with default profile\
tell application "iTerm" to tell first session of current tab of current window to write text "cd " & folderPath & "; clear"')
end)

Finder:buildInvoice({'shift', 'option'}, 'b', function()
  if FileExt((SelectedFile():gsub("%'", ""))) == ".ods" then
    hs.execute("rm " .. SelectedFile() .. "; cp $HOME/.local/templates/invoice_template.ods " .. SelectedFile())
    hs.execute('export PATH=$HOME/.local/bin:$PATH cd ' .. FocusedWindowPath() .. '; build_invoice $HOME/.local/templates/invoice_values.yaml ' .. SelectedFile())
    hs.execute('cd /Applications/LibreOffice.app/Contents/MacOS; ./soffice --headless --convert-to pdf ' .. SelectedFile() .. ' --outdir ' .. FocusedWindowPath())
    hs.execute('cd ' .. FocusedWindowPath() .. '; export PATH=$HOME/.local/bin:/usr/local/bin:$PATH; mrgpdf *Transport.pdf *Transport.pdf *Confirmation.pdf *BOL.pdf')
  else
    hs.alert("Selected file is not in ODS format")
  end
end)
