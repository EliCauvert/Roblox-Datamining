return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { userId = tostring(p0), displayName = p1 }
end)