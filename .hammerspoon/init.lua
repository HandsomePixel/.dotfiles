preview_shortcuts = hs.hotkey.modal.new()

preview_shortcuts:bind({'cmd', 'alt'}, 's', function()
  hs.eventtap.keyStroke('cmd', 'k')
  hs.eventtap.keyStroke('cmd', 's')
  hs.eventtap.keyStroke('cmd', 'w')
end)

function previewWatcher(appName, eventType, appObject)
  if (appName == 'Preview') then
    if (eventType == hs.application.watcher.activated) then
      preview_shortcuts:enter()
      -- Preview is in focus, so enable our preview_shortcuts
    elseif (eventType == hs.application.watcher.deactivated) then
      preview_shortcuts:exit()
      -- Preview is out of focus, so enable our preview_shortcuts
    end
  end
end

-- Create and start the application event watcher
watcher = hs.application.watcher.new(previewWatcher)
watcher:start()

-- Activate the modal state
preview_shortcuts:enter()

function chunkwm(modifiers, key, action)
  hs.hotkey.bind(modifiers, key, function() hs.execute('/usr/local/bin/chunkc ' .. action) end)
end

-- Rotate Windows
rotateWindows = chunkwm({'alt'}, 'r', 'tiling::desktop --rotate 90')

-- Make window fullscreen
rotateWindows = chunkwm({'alt'}, 'f', 'tiling::window --toggle native-fullscreen')

-- Focus window
focusWindowWest = chunkwm({'alt'}, 'h', 'tiling::window --focus west')
focusWindowSouth = chunkwm({'alt'}, 'j', 'tiling::window --focus south')
focusWindowNorth = chunkwm({'alt'}, 'k', 'tiling::window --focus north')
focusWindowEast = chunkwm({'alt'}, 'l', 'tiling::window --focus east')

-- Swap window
swapWindowWest = chunkwm({'shift', 'alt'}, 'h', 'tiling::window --swap west')
swapWindowSouth = chunkwm({'shift', 'alt'}, 'j', 'tiling::window --swap south')
swapWindowNorth = chunkwm({'shift', 'alt'}, 'k', 'tiling::window --swap north')
swapWindowEast = chunkwm({'shift', 'alt'}, 'l', 'tiling::window --swap east')

-- Move window
moveWindowWest = chunkwm({'cmd', 'shift'}, 'h', 'tiling::window --warp west')
moveWindowSouth = chunkwm({'cmd', 'shift'}, 'j', 'tiling::window --warp south')
moveWindowNorth = chunkwm({'cmd', 'shift'}, 'k', 'tiling::window --warp north')
moveWindowEast = chunkwm({'cmd', 'shift'}, 'l', 'tiling::window --warp east')

-- Increase window size
increaseWindowSizeWest = chunkwm({'shift', 'alt'}, 'a', 'tiling::window --use-temporary-ratio 0.1 --adjust-window-edge west')
increaseWindowSizeSouth = chunkwm({'shift', 'alt'}, 's', 'tiling::window --use-temporary-ratio 0.1 --adjust-window-edge south')
increaseWindowSizeNorth = chunkwm({'shift', 'alt'}, 'w', 'tiling::window --use-temporary-ratio 0.1 --adjust-window-edge north')
increaseWindowSizeEast = chunkwm({'shift', 'alt'}, 'd', 'tiling::window --use-temporary-ratio 0.1 --adjust-window-edge east')

-- Decrease window size
decreaseWindowSizeWest = chunkwm({'cmd', 'shift'}, 'a', 'tiling::window --use-temporary-ratio -0.1 --adjust-window-edge west')
decreaseWindowSizeSouth = chunkwm({'cmd', 'shift'}, 's', 'tiling::window --use-temporary-ratio -0.1 --adjust-window-edge south')
decreaseWindowSizeNorth = chunkwm({'cmd', 'shift'}, 'w', 'tiling::window --use-temporary-ratio -0.1 --adjust-window-edge north')
decreaseWindowSizeEast = chunkwm({'cmd', 'shift'}, 'd', 'tiling::window --use-temporary-ratio -0.1 --adjust-window-edge east')

-- Focus monitor
focusPreviousMonitor = chunkwm({'cmd', 'ctrl'}, 'z', 'tiling::monitor -f prev')
focusNextMonitor = chunkwm({'cmd', 'ctrl'}, 'x', 'tiling::monitor -f next')

-- Send window to monitor and follow focus
sendWindowToPreviousMonitor = chunkwm({'cmd', 'ctrl', 'alt'}, 'z', 'tiling::window --send-to-monitor prev; /usr/local/bin/chunkc tiling::monitor -f prev')
sendWindowToNextMonitor = chunkwm({'cmd', 'ctrl', 'alt'}, 'x', 'tiling::window --send-to-monitor next; /usr/local/bin/chunkc tiling::monitor -f next')
