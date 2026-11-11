return require(script.Parent.Parent.ActionCreator)("SetPlayerListVisibility", function(IsVisible)
	return { isVisible = IsVisible }
end)