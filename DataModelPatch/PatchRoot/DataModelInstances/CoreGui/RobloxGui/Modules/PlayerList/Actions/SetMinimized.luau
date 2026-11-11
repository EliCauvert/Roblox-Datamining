return require(script.Parent.Parent.ActionCreator)("SetMinimized", function(IsMinimized)
	return { isMinimized = IsMinimized }
end)