return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2)
	return { userId = tostring(p1), displayName = p2 }
end)