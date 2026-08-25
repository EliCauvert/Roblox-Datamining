return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1)
	return { userId = tostring(p0), newState = p1 }
end)