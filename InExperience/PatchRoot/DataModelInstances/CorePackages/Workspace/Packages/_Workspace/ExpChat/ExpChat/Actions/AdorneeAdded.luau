return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	return { userId = tostring(p1), character = p2, humanoid = p3 }
end)