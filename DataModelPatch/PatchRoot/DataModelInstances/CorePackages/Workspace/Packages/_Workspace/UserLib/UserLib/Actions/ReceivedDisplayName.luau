return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p1, DisplayName)
	return { userId = tostring(p1), displayName = DisplayName }
end)