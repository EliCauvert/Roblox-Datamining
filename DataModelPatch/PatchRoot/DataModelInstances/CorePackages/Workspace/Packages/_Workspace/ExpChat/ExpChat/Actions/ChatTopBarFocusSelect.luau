return require(script.Parent.ActionCreator)(script.Name, function(OnSelectionLost, Keybinds)
	return { onSelectionLost = OnSelectionLost, keybinds = Keybinds }
end)