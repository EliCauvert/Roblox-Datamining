return require(script.Parent.ActionCreator)(script.Name, function(OnSelectionLost, Keybinds) --[[ Line: 4 ]]
	return { onSelectionLost = OnSelectionLost, keybinds = Keybinds }
end)