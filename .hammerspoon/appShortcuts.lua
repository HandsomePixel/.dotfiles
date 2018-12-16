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
review_shortcuts = hs.hotkey.modal.new()

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
