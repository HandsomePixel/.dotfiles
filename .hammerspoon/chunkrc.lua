-- Functions to reduce code clutter, it got messy real quick without it
function cwm(mods, key, action)
  hs.hotkey.bind(mods, key, function()
    hs.execute('/usr/local/bin/chunkc ' .. action)
  end)
end

function open(mods, key, appName)
  hs.hotkey.bind(mods, key, function() hs.application.launchOrFocus(appName) end)
end

-- Launch or focus my browser of choice, Firefox
open({"ctrl", "shift"}, "return", "Firefox")

-- Focus next window in cardinal direction
cwm({"alt"}, "h", "tiling::window --focus west")
cwm({"alt"}, "j", "tiling::window --focus south")
cwm({"alt"}, "k", "tiling::window --focus north")
cwm({"alt"}, "l", "tiling::window --focus east")

-- Swap current window with next window in cardinal direction
cwm({"shift", "alt"}, "h", "tiling:window --swap west")
cwm({"shift", "alt"}, "j", "tiling:window --swap south")
cwm({"shift", "alt"}, "k", "tiling:window --swap north")
cwm({"shift", "alt"}, "l", "tiling:window --swap east")

-- Increase current window size in cardinal direction
cwm({"shift", "alt"}, "w", "tiling::window --use-temporary-ratio 0.1 --adjust-window-edge north")
cwm({"shift", "alt"}, "a", "tiling::window --use-temporary-ratio 0.1 --adjust-window-edge west")
cwm({"shift", "alt"}, "s", "tiling::window --use-temporary-ratio 0.1 --adjust-window-edge south")
cwm({"shift", "alt"}, "d", "tiling::window --use-temporary-ratio 0.1 --adjust-window-edge east")

-- Focus next/previous monitor
cwm({"ctrl", "shift"}, "c", "tiling::monitor -f next")
cwm({"ctrl", "shift"}, "z", "tiling::monitor -f prev")
