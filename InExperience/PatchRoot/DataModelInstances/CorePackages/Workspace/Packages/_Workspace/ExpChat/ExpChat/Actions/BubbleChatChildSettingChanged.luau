return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { childName = p1, property = p2, value = p3 }
end)