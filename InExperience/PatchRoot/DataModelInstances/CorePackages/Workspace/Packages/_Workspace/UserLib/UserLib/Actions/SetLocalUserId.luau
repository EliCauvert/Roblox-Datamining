return require(script:FindFirstAncestor("UserLib").Parent.Rodux).makeActionCreator(script.Name, function(p1)
	return { userId = p1 }
end)