return require(script.Parent.ActionCreator)(script.Name, function(p1, p2)
	return { onSelectionLost = p1, keybinds = p2 }
end)