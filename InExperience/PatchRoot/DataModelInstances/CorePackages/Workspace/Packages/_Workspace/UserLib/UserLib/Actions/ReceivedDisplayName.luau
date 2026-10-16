return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p1, DisplayName) --[[ Line: 6 ]]
	return { userId = tostring(p1), displayName = DisplayName }
end)