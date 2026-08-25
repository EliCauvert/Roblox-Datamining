return require(script:FindFirstAncestor("ExpChat").Parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2)
	return { userId = tostring(p0), character = p1, humanoid = p2 }
end)