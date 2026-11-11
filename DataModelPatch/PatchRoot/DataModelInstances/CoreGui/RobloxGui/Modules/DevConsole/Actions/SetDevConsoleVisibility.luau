return require(script.Parent.Parent.Action)("SetDevConsoleVisibility", function(IsVisible)
	return { isVisible = IsVisible }
end)