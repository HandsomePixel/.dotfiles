shortcut_template = function(app_name, mod, key, action)
  local shortcut = hs.hotkey.new(mod, key, function()
    local hsek = hs.eventtap.keyStroke() -- Shorthand for those that want to do keystrokes without typing the syntax entirely
    action()
  end)
  local watcher = hs.application.watcher.new(function(name, eventType, app)
    if eventType ~= hs.application.watcher.activated then return end
    if name == app_name then
      shortcut:enable() -- Enable the shortcut if the current activated app is the app_name you specified
    else
      shortcut:disable() -- Disable otherwise
    end
  end)
  watcher:start()
end

preview_crop_save_close = shortcut_template

preview_crop_save_close('Preview', {'cmd', 'option'}, 's', function()
  hsek({'cmd'}, 'k')
  hsek({'cmd'}, 's')
  hsek({'cmd'}, 'w')
end)
