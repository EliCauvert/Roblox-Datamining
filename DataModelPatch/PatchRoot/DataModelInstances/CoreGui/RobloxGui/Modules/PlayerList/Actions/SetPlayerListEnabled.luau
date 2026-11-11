return require(script.Parent.Parent.ActionCreator)("SetPlayerListEnabled", function(IsEnabled)
	return { isEnabled = IsEnabled }
end)