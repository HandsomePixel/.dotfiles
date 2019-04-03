function chunkc(mods, key, command)
  hs.hotkey.bind(mods, key, function() hs.execute('/usr/local/bin/chunkc ' .. command) end)
end

-- Focus window
focusNorth = chunkc({'alt'}, 'w', 'tiling::window --focus north')
focusWest = chunkc({'alt'}, 'a', 'tiling::window --focus west')
focusSouth = chunkc({'alt'}, 's', 'tiling::window --focus south')
focusEast = chunkc({'alt'}, 'd', 'tiling::window --focus east')

-- Swap window
swapNorth = chunkc({'alt', 'shift'}, 'w', 'tiling::window --swap north')
swapWest = chunkc({'alt', 'shift'}, 'a', 'tiling::window --swap west')
swapSouth = chunkc({'alt', 'shift'}, 's', 'tiling::window --swap south')
swapEast = chunkc({'alt', 'shift'}, 'd', 'tiling::window --swap east')

-- Move window
moveNorth = chunkc({'alt', 'control'}, 'w', 'tiling::window --warp north')
moveWest = chunkc({'alt', 'control'}, 'a', 'tiling::window --warp west')
moveSouth = chunkc({'alt', 'control'}, 's', 'tiling::window --warp south')
moveEast = chunkc({'alt', 'control'}, 'd', 'tiling::window --warp east')

-- Make floating window fill entire screen
fillEntire = chunkc({'alt'}, 'f', 'tiling::window --grid-layout 1:1:0:0:1:1')

-- Make floating window fill left-half of screen
fillLeftHalf = chunkc({'alt'}, 'z', 'tiling::window --grid-layout 1:2:0:0:1:1')

-- Make floating window fill right-half of screen
fillRightHalf = chunkc({'alt'}, 'x', 'tiling::window --grid-layout 1:2:1:0:1:1')

-- Center floating window
centerWindow = chunkc({'alt'}, 'c', 'tiling::window --grid-layout 4:4:1:1:2:2')

-- Rotate tree
rotateTree = chunkc({'alt'}, 'r', 'tiling::desktop --rotate 90')

-- Increase window size
increaseSizeNorth = chunkc({'ctrl'}, 'w', 'tiling::window --use-temporary-ratio 0.1 --adjust-window-edge north')
increaseSizeWest = chunkc({'ctrl'}, 'a', 'tiling::window --use-temporary-ratio 0.1 --adjust-window-edge west')
increaseSizeSouth = chunkc({'ctrl'}, 's', 'tiling::window --use-temporary-ratio 0.1 --adjust-window-edge south')
increaseSizeEast = chunkc({'ctrl'}, 'd', 'tiling::window --use-temporary-ratio 0.1 --adjust-window-edge east')
